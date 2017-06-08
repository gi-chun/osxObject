//
//  StreamViewController.m
//  sjplabObjectTrackingNew
//
//  Created by gclee on 2017. 3. 23..
//  Copyright © 2017년 SJPlab. All rights reserved.
//

#ifdef __cplusplus
#include "Main.h"
#include "Config.h"
#include "ImAcq.h"
#include "Gui.h"
#include "TLDUtil.h"
#include "Trajectory.h"
#include "CMT.h"

using tld::Config;
using tld::Gui;
using tld::Settings;

using namespace tld;
using namespace cv;

#endif

#ifdef __OBJC__
#import "StreamViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "OpenGLPixelBufferView.h"
#import "main_header.h"
#endif


typedef NS_ENUM(NSInteger, Gclee_VideoType) {
    Gclee_Cam,
    Gclee_Stream
};

typedef NS_ENUM(NSInteger, Gclee_AlgoType) {
    Gclee_cmt,
    Gclee_tld
};

typedef NS_ENUM(NSInteger, Gclee_tracking_on) {
    Gclee_off,
    Gclee_on
};

@interface StreamViewController ()
{
    cv::Mat currentImg;
    CGPoint start_p;
    UIInterfaceOrientation g_orientation;
    Main *main;
    Gui *gui;
    int firstStep; //1: first, 0: no
    int isObjectSelected; //1:yes 0:no
    CMT cmt;
    cv::Mat im_gray;
    cv::UMat cmt_im_gray;
    Trajectory trajectory;
    IplImage *img;
 
    UIView *backView;
    __weak IBOutlet UIView *mySubview;
    AVPlayer *_player;
    AVURLAsset *_asset;
    AVPlayerItem *_playerItem;
    AVPlayerItemVideoOutput* _output;
    NSTimer *refreshTimer;
    NSInteger breakTimer;
    GLuint texture;
    
    BOOL _addedObservers;
    BOOL _allowedToUseGPU;
    OpenGLPixelBufferView *_previewView;
    AVCaptureVideoOrientation _videoBufferOrientation;
    
    NSInteger currentVideoType;
    NSInteger currentAlgorithm;
    NSInteger isTracking;
    
    __weak IBOutlet UIButton *btnCam;
    __weak IBOutlet UIButton *btnStream;
    __weak IBOutlet UIButton *btnTracking;
    __weak IBOutlet UIButton *btnNormal;
    __weak IBOutlet UIButton *btnOther;
}

@property AVPlayerItem *playerItem;
@property (nonatomic) AVPlayerItemVideoOutput *output;

@end

@implementation StreamViewController

static int AAPLPlayerViewControllerKVOContext = 0;

- (void)dealloc
{
    if ( _addedObservers )
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:[UIApplication sharedApplication]];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:[UIApplication sharedApplication]];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
        [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    }
}

-(void)setObjectTracking:(NSInteger)isDo{
    
    if(isDo){
        
        isObjectSelected = 1;
        firstStep = 1;
        [backView setHidden:TRUE];
        
    }else{
        
        isObjectSelected = 0;
        [backView setHidden:TRUE]; //FALSE
        
    }
}

- (IBAction)clickVideoSource:(id)sender {
    
    UIButton* button = (UIButton*)sender;
    
    switch (button.tag) {
//        case 0: //cam
//            if(currentVideoType != Gclee_Cam){
//                [self setVideoSourceButton];
//                currentVideoType = Gclee_Cam;
//            }
//            break;
//        case 1: //stream
//            if(currentVideoType != Gclee_Stream){
//                [self setVideoSourceButton];
//                currentVideoType = Gclee_Stream;
//            }
//            break;
        case 2: //tracking
            isTracking = (isTracking == Gclee_on)?Gclee_off:Gclee_on;
            [self setObjectTracking:isTracking];
            [self setTrackingButton];
            
            break;
        case 3: //normal (cmt)
            if(currentAlgorithm != Gclee_cmt){
                currentAlgorithm = Gclee_cmt;
                [self setAlgorithimButton];
                
                if(isTracking == Gclee_on){
                    isTracking = Gclee_off;
                    [self setObjectTracking:isTracking];
                    [self setTrackingButton];
                }
            }
            
            break;
        case 4: //other (tld)
            if(currentAlgorithm != Gclee_tld){
                currentAlgorithm = Gclee_tld;
                [self setAlgorithimButton];
                
                if(isTracking == Gclee_on){
                    isTracking = Gclee_off;
                    [self setObjectTracking:isTracking];
                    [self setTrackingButton];
                }
            }
            break;
            
        default:
            break;
    }
    
}

- (IBAction)goCameraVC:(id)sender {
    
    if ( _addedObservers )
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:[UIApplication sharedApplication]];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:[UIApplication sharedApplication]];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
        [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    }
    
    [_player pause];
    //_player = nil;
    
    breakTimer = 1;
    [refreshTimer invalidate];
    refreshTimer = nil;
    
    [self performSegueWithIdentifier:@"se_show_camera" sender:self];
}

#pragma mark - View lifecycle

- (void)applicationDidEnterBackground
{
    // Avoid using the GPU in the background
    _allowedToUseGPU = NO;
    
    // We reset the OpenGLPixelBufferView to ensure all resources have been cleared when going to the background.
    [_previewView reset];
}

- (void)applicationWillEnterForeground
{
    _allowedToUseGPU = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidEnterBackground)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:[UIApplication sharedApplication]];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillEnterForeground)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:[UIApplication sharedApplication]];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deviceOrientationDidChange)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:[UIDevice currentDevice]];
    
    // Keep track of changes to the device orientation so we can update the capture pipeline
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    _addedObservers = YES;
    
    // the willEnterForeground and didEnterBackground notifications are subsequently used to update _allowedToUseGPU
    _allowedToUseGPU = ( [UIApplication sharedApplication].applicationState != UIApplicationStateBackground );
    
    
    backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor greenColor];
    //backView.userInteractionEnabled = YES;
    //backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    backView.alpha = 0.5;
    //    CGRect drawnFrame = CGRectMake(0,0,0,0);
    //    backView.frame = drawnFrame;
    //[self.view addSubview:backView];
    [mySubview addSubview:backView];
    
    breakTimer = 0;
    
    //init ui
    currentVideoType = Gclee_Stream;
    currentAlgorithm = Gclee_cmt;
    isTracking = Gclee_off;
    
    [self setVideoSourceButton];
    [self setAlgorithimButton];
    [self setTrackingButton];
    
    //tld & cmt init
    main = new Main();
    gui = new Gui();
    main->gui = gui;
    srand(main->seed);
    firstStep = 1;
    
    //https://devimages.apple.com.edgekey.net/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8
    NSURL *movieURL = [NSURL URLWithString:@"https://devimages.apple.com.edgekey.net/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8"];
    [self readMovie:movieURL];

}

- (void)setVideoSourceButton{
    
    UIImage *buttonOff = [UIImage imageNamed:@"check_normal_ios.png"];
    UIImage *buttonOn = [UIImage imageNamed:@"check_pressed_ios.png"];

    if(currentVideoType == Gclee_Cam){
        [btnCam setImage:buttonOn forState:UIControlStateNormal];
        [btnStream setImage:buttonOff forState:UIControlStateNormal];
    }else{
        [btnCam setImage:buttonOff forState:UIControlStateNormal];
        [btnStream setImage:buttonOn forState:UIControlStateNormal];
    }
}

- (void)setAlgorithimButton{
    
    UIImage *buttonOff = [UIImage imageNamed:@"check_normal_ios.png"];
    UIImage *buttonOn = [UIImage imageNamed:@"check_pressed_ios.png"];
    
    if(currentAlgorithm == Gclee_cmt){
        [btnNormal setImage:buttonOn forState:UIControlStateNormal];
        [btnOther setImage:buttonOff forState:UIControlStateNormal];
        
    }else{
        [btnNormal setImage:buttonOff forState:UIControlStateNormal];
        [btnOther setImage:buttonOn forState:UIControlStateNormal];
    }
    [btnNormal setNeedsDisplay];
    [btnOther setNeedsDisplay];
}

- (void)setTrackingButton{
    
    UIImage *buttonOff = [UIImage imageNamed:@"tracking_normal_ios.png"];
    UIImage *buttonOn = [UIImage imageNamed:@"tracking_pressed_ios.png"];
    
    if(isTracking){
        [btnTracking setImage:buttonOn forState:UIControlStateNormal];
    }else{
        [btnTracking setImage:buttonOff forState:UIControlStateNormal];
    }
    [btnTracking setNeedsDisplay];
}

- (void)viewWillAppear:(BOOL)animated{
    firstStep = 1;
}

- (void)viewDidDisappear:(BOOL)animated{
    
    if ( _addedObservers )
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:[UIApplication sharedApplication]];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:[UIApplication sharedApplication]];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
        [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    }
    
    [_player pause];
    //_player = nil;
    
    breakTimer = 1;
    [refreshTimer invalidate];
    refreshTimer = nil;
    
    //tld & cmt delete
    delete main;
    main = NULL;
    delete gui;
    gui = NULL;
    firstStep = 0;
    //end

}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape; //UIInterfaceOrientationMaskPortrait
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

static CGFloat angleOffsetFromPortraitOrientationToOrientation(AVCaptureVideoOrientation orientation)
{
    CGFloat angle = 0.0;
    
    switch ( orientation )
    {
        case AVCaptureVideoOrientationPortrait:
            angle = 0.0;
            break;
        case AVCaptureVideoOrientationPortraitUpsideDown:
            angle = M_PI;
            break;
        case AVCaptureVideoOrientationLandscapeRight:
            angle = -M_PI_2;
            break;
        case AVCaptureVideoOrientationLandscapeLeft:
            angle = M_PI_2;
            break;
        default:
            break;
    }
    
    //angle = 0.0;
    return angle;
}

- (void)setupPreviewView
{
    // Set up GL view
    _previewView = [[OpenGLPixelBufferView alloc] initWithFrame:CGRectZero];
    
    //[self.view insertSubview:_previewView atIndex:0];
    [mySubview insertSubview:_previewView atIndex:0];
    CGRect bounds = CGRectZero;
    bounds.size = [self.view convertRect:self.view.bounds toView:_previewView].size;
    _previewView.bounds = bounds;
    
    _previewView.center = CGPointMake( self.view.bounds.size.width/2.0, self.view.bounds.size.height/2.0 );
    
}

- (void)deviceOrientationDidChange
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    
}

- (void)setPlayer:(AVPlayer *)player{
    _player = player;
}

- (AVPlayerItem *)playerItem {
    return _playerItem;
}

- (void)setPlayerItem:(AVPlayerItem *)newPlayerItem {
    if (_playerItem != newPlayerItem) {
        
        _playerItem = newPlayerItem;
        
        // If needed, configure player item here before associating it with a player
        // (example: adding outputs, setting text style rules, selecting media options)
        [self.player replaceCurrentItemWithPlayerItem:_playerItem];
    }
}

- (void)setOutput:(AVPlayerItemVideoOutput *)output{
    _output = output;
}

// MARK: - public

- (void) readNextMovieFrame {
    
    CMTime outputItemTime = [[self playerItem] currentTime];
    
    //float interval = [self maxTimeLoaded];
    
    CMTime t = [[self playerItem] currentTime];
    CMTime d = [[self playerItem] duration];
    //NSLog(@"Video : %f/%f (loaded : %f) - speed : %f", (float)t.value / (float)t.timescale, (float)d.value / (float)d.timescale, interval, [self player].rate);
    NSLog(@"Video : %f/%f - speed : %f", (float)t.value / (float)t.timescale, (float)d.value / (float)d.timescale, [self player].rate);
    
    //[videoBar updateProgress:(interval / CMTimeGetSeconds(d))];
    //[videoBar updateSlider:(CMTimeGetSeconds(t) / CMTimeGetSeconds(d))];
    
    if ([[self output] hasNewPixelBufferForItemTime:outputItemTime]) {
        CVPixelBufferRef buffer = [[self output] copyPixelBufferForItemTime:outputItemTime itemTimeForDisplay:nil];
        
        // Lock the image buffer
        CVPixelBufferLockBaseAddress(buffer, 0);
        
        if ( ! _previewView ) {
            [self setupPreviewView];
        }
        
        //gclee
        unsigned char *base = (unsigned char *)CVPixelBufferGetBaseAddress( buffer );
        size_t width = CVPixelBufferGetWidth( buffer );
        size_t height = CVPixelBufferGetHeight( buffer );
        size_t stride = CVPixelBufferGetBytesPerRow( buffer );
        size_t extendedWidth = stride / sizeof( uint32_t ); // each pixel is 4 bytes/32 bits
        
        cv::Mat bgraImage = cv::Mat( (int)height, (int)extendedWidth, CV_8UC4, base );
        
//        for ( uint32_t y = 0; y < height; y++ )
//        {
//            for ( uint32_t x = 0; x < width; x++ )
//            {
//                bgraImage.at<cv::Vec<uint8_t,4> >(y,x)[1] = 0;
//            }
//        }

        [self processImage:bgraImage];
        //gclee end
        
        [_previewView displayPixelBuffer:buffer];
        
        // Unlock the image buffer
        CVPixelBufferUnlockBaseAddress(buffer, 0);
        //CFRelease(sampleBuffer);
        CVBufferRelease(buffer);
        
    }
}

- (void)bufferingVideo:(NSNotification*)not1 {
    
    NSLog(@"bufferingVideo Item notification: %@", not1.name);
    //[self readNextMovieFrame];
    
}

- (void)videoEnded:(NSNotification*)not2{
    
    NSLog(@"videoEnded Item notification: %@", not2.name);
    
    breakTimer = 1;
    [refreshTimer invalidate];
    refreshTimer = nil;
    
}

- (void)videoFailed:(NSNotification*)not3{
    
    NSLog(@"videoFailed Item notification: %@", not3.name);
    
}

- (void) readMovie:(NSURL *)url {
    NSLog(@"Playing video %@", url);
    
    AVURLAsset * asset = [AVURLAsset URLAssetWithURL:url options:nil];
    [asset loadValuesAsynchronouslyForKeys:[NSArray arrayWithObject:@"tracks"] completionHandler:
     ^{
         dispatch_async(dispatch_get_main_queue(),
                        ^{
                            NSError* error = nil;
                            AVKeyValueStatus status = [asset statusOfValueForKey:@"tracks" error:&error];
                            if (status == AVKeyValueStatusLoaded) {
                                NSDictionary* settings = @{ (id)kCVPixelBufferPixelFormatTypeKey : [NSNumber numberWithInt:kCVPixelFormatType_32BGRA] };
                                AVPlayerItemVideoOutput* output = [[AVPlayerItemVideoOutput alloc] initWithPixelBufferAttributes:settings];
                                AVPlayerItem* playerItem = [AVPlayerItem playerItemWithAsset:asset];
                                [playerItem addOutput:output];
                                //AVPlayer* player = [AVPlayer playerWithPlayerItem:playerItem];
                                _player = [AVPlayer playerWithPlayerItem:playerItem];
                                
                                [self setPlayer:_player];
                                [self setPlayerItem:playerItem];
                                [self setOutput:output];
                                
                                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bufferingVideo:) name:AVPlayerItemPlaybackStalledNotification object:playerItem];
                                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoEnded:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
                                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoFailed:) name:AVPlayerItemFailedToPlayToEndTimeNotification object:nil];
                                
                                [[self player] addObserver:self forKeyPath:@"rate" options:0 context:&AAPLPlayerViewControllerKVOContext];
                                [[self player] addObserver:self forKeyPath:@"status" options:0 context:&AAPLPlayerViewControllerKVOContext];
                                
                                [_player play];
                            } else {
                                NSLog(@"%@ Failed to load the tracks.", self);
                            }
                        });
     }];
}


// MARK: - KV Observation

// Update our UI when player or player.currentItem changses
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if (context != &AAPLPlayerViewControllerKVOContext) {
        // KVO isn't for us.
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    if ([keyPath isEqualToString:@"asset"]) {
        if (self.asset) {
            //[self asynchronouslyLoadURLAsset:self.asset];
        }
    }
    else if ([keyPath isEqualToString:@"player.currentItem.duration"]) {
        
        // Update timeSlider and enable/disable controls when duration > 0.0
        
        // Handle NSNull value for NSKeyValueChangeNewKey, i.e. when player.currentItem is nil
        NSValue *newDurationAsValue = change[NSKeyValueChangeNewKey];
        CMTime newDuration = [newDurationAsValue isKindOfClass:[NSValue class]] ? newDurationAsValue.CMTimeValue : kCMTimeZero;
        BOOL hasValidDuration = CMTIME_IS_NUMERIC(newDuration) && newDuration.value != 0;
        double newDurationSeconds = hasValidDuration ? CMTimeGetSeconds(newDuration) : 0.0;
        
        //        self.timeSlider.maximumValue = newDurationSeconds;
        //        self.timeSlider.value = hasValidDuration ? CMTimeGetSeconds(self.currentTime) : 0.0;
        //        self.rewindButton.enabled = hasValidDuration;
        //        self.playPauseButton.enabled = hasValidDuration;
        //        self.fastForwardButton.enabled = hasValidDuration;
        //        self.timeSlider.enabled = hasValidDuration;
        //        self.startTimeLabel.enabled = hasValidDuration;
        //        self.durationLabel.enabled = hasValidDuration;
        //        int wholeMinutes = (int)trunc(newDurationSeconds / 60);
        //        self.durationLabel.text = [NSString stringWithFormat:@"%d:%02d", wholeMinutes, (int)trunc(newDurationSeconds) - wholeMinutes * 60];
        
    }
    else if ([keyPath isEqualToString:@"rate"]) {
        // Update playPauseButton image
        
        //        double newRate = [change[NSKeyValueChangeNewKey] doubleValue];
        //        UIImage *buttonImage = (newRate == 1.0) ? [UIImage imageNamed:@"PauseButton"] : [UIImage imageNamed:@"PlayButton"];
        //        [self.playPauseButton setImage:buttonImage forState:UIControlStateNormal];
        
        NSLog(@"Update playPauseButton image");
        
        refreshTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeoutHandler:) userInfo:nil repeats:YES];
        
        
    }
    else if ([keyPath isEqualToString:@"status"]) {
        // Display an error if status becomes Failed
        
        // Handle NSNull value for NSKeyValueChangeNewKey, i.e. when player.currentItem is nil
        NSNumber *newStatusAsNumber = change[NSKeyValueChangeNewKey];
//        AVPlayerItemStatus newStatus = [newStatusAsNumber isKindOfClass:[NSNumber class]] ? newStatusAsNumber.integerValue : AVPlayerItemStatusUnknown;
//        
//        if (newStatus == AVPlayerItemStatusFailed) {
//            [self handleErrorWithMessage:self.player.currentItem.error.localizedDescription error:self.player.currentItem.error];
//        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

// Trigger KVO for anyone observing our properties affected by player and player.currentItem
+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    if ([key isEqualToString:@"duration"]) {
        return [NSSet setWithArray:@[ @"player.currentItem.duration" ]];
    } else if ([key isEqualToString:@"currentTime"]) {
        return [NSSet setWithArray:@[ @"player.currentItem.currentTime" ]];
    } else if ([key isEqualToString:@"rate"]) {
        return [NSSet setWithArray:@[ @"player.rate" ]];
    } else {
        return [super keyPathsForValuesAffectingValueForKey:key];
    }
}

// MARK: - Error Handling

- (void)handleErrorWithMessage:(NSString *)message error:(NSError *)error {
    NSLog(@"Error occured with message: %@, error: %@.", message, error);
    
    NSString *alertTitle = NSLocalizedString(@"alert.error.title", @"Alert title for errors");
    NSString *defaultAlertMesssage = NSLocalizedString(@"error.default.description", @"Default error message when no NSError provided");
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:alertTitle message:message ?: defaultAlertMesssage preferredStyle:UIAlertControllerStyleAlert];
    
    NSString *alertActionTitle = NSLocalizedString(@"alert.error.actions.OK", @"OK on error alert");
    UIAlertAction *action = [UIAlertAction actionWithTitle:alertActionTitle style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:action];
    
    [self presentViewController:controller animated:YES completion:nil];
}

// MARK: timer

-(void)timeoutHandler:(NSTimer*) timer
{
    //    NSDictionary *userInfo = (NSDictionary*)timer.userInfo;
    //    NSString *key =[userInfo objectForKey:@"key"];
    //    
    
    
    [self readNextMovieFrame];
    
    if(breakTimer){
        [timer invalidate];
        breakTimer = 0;
    }
    //[timer invalidate];
    
}

#ifdef __cplusplus
- (void) processImage:(cv::Mat&)image
{
    // Do some OpenCV stuff with the image
    //[self.currentSample processFrame:image into:outputFrame];
    //    image.copyTo(currentImg);
    //    currentImg.copyTo(image);
    
    //IplImage *img 그리기 목적
    //    if(img)
    //        delete img;
    //    img = new IplImage(image);
    
    double tic = cvGetTickCount();
    
    //resize
    Mat dst;
    Mat tldDst;
    cv::Size rsize;
    rsize.width = 640; rsize.height = 480;
    cv::Size resize_size = rsize; //[self get_resize_size];
    cv::Size cmt_resize_size = rsize;//[self get_resize_size];
    rsize.width = 1280; rsize.height = 720;
    cv::Size display_size = rsize; //[self get_display_resize_size];
    //get use algorithm
    NSInteger luseKeypoints = 1, luseLearning = 0;
    
    if(currentAlgorithm == Gclee_cmt){
        luseKeypoints = 1; luseLearning = 0;
    }else{
        luseKeypoints = 0; luseLearning = 1;
    }
    //[self get_use_algorithim:luseKeypoints useLearning:luseLearning];
    
    //NSLog(@"luseKeypoints:%ld == luseLearning:%ld", luseKeypoints, luseLearning);
    
    resize(image, dst, cv::Size(resize_size.width,resize_size.height));
    resize(image, tldDst, cv::Size(resize_size.width,resize_size.height));
    resize(image, image, cv::Size(display_size.width, display_size.height));
    
    //    cmt_resize_size.width = 480;
    //    cmt_resize_size.height = 240;
    
    
    if(luseKeypoints){
        cvtColor(dst, cmt_im_gray, CV_BGR2GRAY);
        //cvtColor(image, cmt_im_gray, CV_BGR2GRAY);
    }
    
    if(!isObjectSelected){
        main->tld->release();
        main->cmt_tracking = false;
    }
    
    if(isObjectSelected){
        
        if(firstStep){
            
            CGRect drawnFrame = backView.frame;
            if(drawnFrame.size.width < 1 && drawnFrame.size.height < 1)
                return;
            
            cv::Rect r = cv::Rect(drawnFrame.origin.x, drawnFrame.origin.y, drawnFrame.size.width, drawnFrame.size.height);
            
            NSLog(@" kScreenBoundsWidth %f, kScreenBoundsHeight %f ", kScreenBoundsWidth, kScreenBoundsHeight);
//            NSLog(@" imageView Width %f, imageView Height %f ", containerView.frame.size.width, containerView.frame.size.height);
            
            
            cv::Rect rTemp;
            if(luseLearning){
                rTemp = r;
                rTemp.x = rTemp.x * resize_size.width / kScreenBoundsWidth;
                rTemp.y = rTemp.y * resize_size.height / kScreenBoundsHeight;
                rTemp.width = rTemp.width * resize_size.width / kScreenBoundsWidth;
                rTemp.height = rTemp.height * resize_size.height / kScreenBoundsHeight;
                
                Mat grey;
                cvtColor(tldDst, grey, CV_BGR2GRAY);
                
                ///////////////////////////////////////////////
                cv::Point2f topleft(rTemp.x, rTemp.y);
                cv::Point2f bottomright(rTemp.x+rTemp.width,rTemp.y+rTemp.height);
                
                cv::Rect roi = cv::Rect(topleft.x, topleft.y, bottomright.x-topleft.x, bottomright.y - topleft.y);
                cv::UMat roiMat;
                grey(roi).copyTo(roiMat);
                cv::UMat src_bin;
                cv::threshold(roiMat, src_bin, 0, 255, cv::THRESH_BINARY | cv::THRESH_OTSU);
                std::vector<std::vector <cv::Point> > contours;
                cv::findContours(src_bin, contours, cv::RETR_LIST, cv::CHAIN_APPROX_NONE);
                double a, largest_area = 0.0;
                unsigned largest_contour_index = 0;
                for (unsigned i = 0; i < contours.size(); i++) {
                    double a = contourArea(contours[i], false);  //Find the largest area of contour
                    if (a>largest_area)
                    {
                        largest_area = a;
                        largest_contour_index = i;
                    }
                }
                std::vector<cv::Point> contours_poly;
                cv::Rect boundRect;
                cv::approxPolyDP(cv::Mat(contours[largest_contour_index]), contours_poly, 3, true);
                boundRect = cv::boundingRect(cv::Mat(contours_poly));
                
                topleft.x = boundRect.x + topleft.x;
                topleft.y = boundRect.y + topleft.y;
                bottomright.x = bottomright.x - (bottomright.x - (topleft.x+boundRect.width));
                bottomright.y = bottomright.y - (bottomright.y - (topleft.y+boundRect.height));
                ///////////////////////////////////////////////
                rTemp = cv::Rect(topleft.x, topleft.y, bottomright.x-topleft.x, bottomright.y - topleft.y);
                
                main->tld->detectorCascade->imgWidth = grey.cols;
                main->tld->detectorCascade->imgHeight = grey.rows;
                main->tld->detectorCascade->imgWidthStep = grey.step;
                main->tld->selectObject(grey, &rTemp);
            }
            
            if(luseKeypoints){
                rTemp = r;
                rTemp.x = rTemp.x * cmt_resize_size.width / kScreenBoundsWidth;
                rTemp.y = rTemp.y * cmt_resize_size.height / kScreenBoundsHeight;
                rTemp.width = rTemp.width * cmt_resize_size.width / kScreenBoundsWidth;
                rTemp.height = rTemp.height * cmt_resize_size.height / kScreenBoundsHeight;
                
                //cmt tracket init
                ///////////////////////////////////////////////
                cv::Point2f topleft(rTemp.x, rTemp.y);
                cv::Point2f bottomright(rTemp.x+rTemp.width,rTemp.y+rTemp.height);
                
                cv::Rect roi = cv::Rect(topleft.x, topleft.y, bottomright.x-topleft.x, bottomright.y - topleft.y);
                cv::UMat roiMat;
                cmt_im_gray(roi).copyTo(roiMat);
                cv::UMat src_bin;
                cv::threshold(roiMat, src_bin, 0, 255, cv::THRESH_BINARY | cv::THRESH_OTSU);
                std::vector<std::vector <cv::Point> > contours;
                cv::findContours(src_bin, contours, cv::RETR_LIST, cv::CHAIN_APPROX_NONE);
                double a, largest_area = 0.0;
                unsigned largest_contour_index = 0;
                for (unsigned i = 0; i < contours.size(); i++) {
                    double a = contourArea(contours[i], false);  //Find the largest area of contour
                    if (a>largest_area)
                    {
                        largest_area = a;
                        largest_contour_index = i;
                    }
                }
                std::vector<cv::Point> contours_poly;
                cv::Rect boundRect;
                cv::approxPolyDP(cv::Mat(contours[largest_contour_index]), contours_poly, 3, true);
                boundRect = cv::boundingRect(cv::Mat(contours_poly));
                
                topleft.x = boundRect.x + topleft.x;
                topleft.y = boundRect.y + topleft.y;
                bottomright.x = bottomright.x - (bottomright.x - (topleft.x+boundRect.width));
                bottomright.y = bottomright.y - (bottomright.y - (topleft.y+boundRect.height));
                ///////////////////////////////////////////////

                main->cmt_tracking = cmt.initialise(cmt_im_gray, topleft, bottomright);
            }
            
            firstStep = 0;
        }else{
            
            if(luseLearning)
                main->tld->processImage(tldDst);
            
            if(main->cmt_tracking && luseKeypoints)
                cmt.processFrame(cmt_im_gray);
        }
        
    }//isObjectSelected
    
    double toc = (cvGetTickCount() - tic) / cvGetTickFrequency();
    
    toc = toc / 1000000;
    
    float fps = 1 / toc;
    
    int confident = (main->tld->currConf >= main->threshold) ? 1 : 0;
    
    if(main->showOutput || main->saveDir != NULL)
    {
        char string[128];
        
        char learningString[10] = "";
        
        if(main->tld->learning)
        {
            strcpy(learningString, "Learning");
        }
        
        sprintf(string, "#Posterior %.2f; fps: %.2f, #numwindows:%d, %s", main->tld->currConf, fps, main->tld->detectorCascade->numWindows, learningString);
        CvScalar yellow = CV_RGB(255, 255, 0);
        CvScalar blue = CV_RGB(0, 0, 255);
        CvScalar black = CV_RGB(0, 0, 0);
        CvScalar white = CV_RGB(255, 255, 255);
        
        CvFont font;
        cvInitFont(&font, CV_FONT_HERSHEY_SIMPLEX, .5, .5, 0, 1, 8);
        
        //cvRectangle(img, cvPoint(0, 0), cvPoint(img->width, 50), black, CV_FILLED, 8, 0);
        //cvPutText(img, string, cvPoint(25, 25), &font, white);
        cv::putText(image, string, cvPoint(25,25), 1, 1, white);
        
        if(main->tld->currBB != NULL)
        {
            CvScalar rectangleColor = (confident) ? blue : yellow;
            
            CvPoint topleft = cvPoint(main->tld->currBB->x, main->tld->currBB->y);
            CvPoint bottomRight = cvPoint(main->tld->currBB->x+main->tld->currBB->width, main->tld->currBB->y+main->tld->currBB->height);
            
            topleft.x = topleft.x * display_size.width / resize_size.width;
            topleft.y = topleft.y * display_size.height / resize_size.height;
            bottomRight.x = bottomRight.x * display_size.width / resize_size.width;
            bottomRight.y = bottomRight.y * display_size.height / resize_size.height;
            
            //cv::rectangle(image, topleft, bottomRight, rectangleColor);
            ////////////////////////////////////////////////////////////////////////
            int roix, roiy, roiwidth, roiheight = 0;
            roix = (int)topleft.x;
            roiy = (int)topleft.y;
            roiwidth = (int)(bottomRight.x  - topleft.x);
            roiheight = (int)(bottomRight.y - topleft.y);
            
            if(roix >= 0 && roiwidth >= 0 && roix+roiwidth <= display_size.width && roiy >=0 && roiheight >=0 && roiy+roiheight <= display_size.height){
                
                //                Rect roi = new Rect(roix, roiy, roiwidth, roiheight);
                cv::Rect roi = cv::Rect(roix, roiy, roiwidth, roiheight);
                int lineLength = 20;
                /* corners:
                 * p1 - p2
                 * |     |
                 * p4 - p3
                 */
                int cornerRadius = 10;
                Scalar lineColor = Scalar(0, 255, 0);
                int thickness = 2;
                int lineType = 8;
                CvPoint p1 = CvPoint(roi.x, roi.y);
                CvPoint p2 = CvPoint(roi.x+roi.width, roi.y);
                CvPoint p3 = CvPoint(roi.x+roi.width, roi.y+roi.height);
                CvPoint p4 = CvPoint(roi.x, roi.y+roi.height);
                
                // draw straight lines
                cv::line(image, CvPoint(p1.x+cornerRadius,p1.y), CvPoint(p1.x+cornerRadius+lineLength,p1.y), lineColor, thickness, lineType, 0);
                cv::line(image, CvPoint (p2.x-cornerRadius-lineLength,p2.y), CvPoint (p2.x-cornerRadius,p2.y), lineColor, thickness, lineType, 0);
                
                cv::line(image, CvPoint (p2.x,p2.y+cornerRadius), CvPoint (p2.x,p2.y+cornerRadius+lineLength), lineColor, thickness, lineType, 0);
                cv::line(image, CvPoint (p3.x,p3.y-cornerRadius-lineLength), CvPoint (p3.x,p3.y-cornerRadius), lineColor, thickness, lineType, 0);
                
                cv::line(image, CvPoint (p4.x+cornerRadius,p4.y), CvPoint (p4.x+cornerRadius+lineLength,p4.y), lineColor, thickness, lineType, 0);
                cv::line(image, CvPoint (p3.x-cornerRadius-lineLength,p3.y), CvPoint (p3.x-cornerRadius,p3.y), lineColor, thickness, lineType, 0);
                
                cv::line(image, CvPoint (p1.x,p1.y+cornerRadius), CvPoint (p1.x,p1.y+cornerRadius+lineLength), lineColor, thickness, lineType, 0);
                cv::line(image, CvPoint (p4.x,p4.y-cornerRadius-lineLength), CvPoint (p4.x,p4.y-cornerRadius), lineColor, thickness, lineType, 0);
                
                // draw arcs
                cv::Size sTemp = cv::Size(cornerRadius,cornerRadius);
                cv::ellipse( image, CvPoint(p1.x+cornerRadius, p1.y+cornerRadius), sTemp, 180.0, 0, 90, lineColor, thickness, lineType, 0);
                cv::ellipse( image, CvPoint(p2.x-cornerRadius, p2.y+cornerRadius), sTemp, 270.0, 0, 90, lineColor, thickness, lineType, 0);
                cv::ellipse( image, CvPoint(p3.x-cornerRadius, p3.y-cornerRadius), sTemp, 0.0, 0, 90, lineColor, thickness, lineType, 0);
                cv::ellipse( image, CvPoint(p4.x+cornerRadius, p4.y-cornerRadius), sTemp, 90.0, 0, 90, lineColor, thickness, lineType, 0);
                //////////////////////////////////////////////////////////////////////////////////////
                
                //draw some crosshairs around the object
                int x, y = 0;
                x = roi.x + roi.width / 2;
                y = roi.y + roi.height / 2;
                
                // public static void circle(Mat img, Point center, int radius, Scalar color, int thickness, int lineType, int shift)
                cv::circle(image, CvPoint(x, y), roi.width/5, Scalar(0, 255, 0), 1, 1, 0);
                cv::circle(image, CvPoint(x, y), 3, Scalar(255, 0, 0), -1);
                
            }
            ////////////////////////////////////////////////////////////////////////
            
            //            CvPoint center = cvPoint(topleft.x+(bottomRight.x-topleft.x)/2, topleft.y+(bottomRight.y-topleft.y)/2);
            //            cv::line(image, cvPoint(center.x-2, center.y+2), cvPoint(center.x+2, center.y-2), rectangleColor, 2);
        }
        
        if(cmt.hasResult && main->cmt_tracking){
            for(int i = 0; i<cmt.trackedKeypoints.size(); i++){
                
                CvPoint nPoint = cmt.trackedKeypoints[i].first.pt;
                nPoint.x = nPoint.x * display_size.width / cmt_resize_size.width;
                nPoint.y = nPoint.y * display_size.height / cmt_resize_size.height;
                
                cv::circle(image, nPoint, 3, cv::Scalar(255,255,255));
            }
            
            CvPoint topleft = cmt.topLeft;
            CvPoint topright = cmt.topRight;
            CvPoint bottomleft = cmt.bottomLeft;
            CvPoint bottomright = cmt.bottomRight;
            
            topleft.x = topleft.x * display_size.width / cmt_resize_size.width;
            topleft.y = topleft.y * display_size.height / cmt_resize_size.height;
            topright.x = topright.x * display_size.width / cmt_resize_size.width;
            topright.y = topright.y * display_size.height / cmt_resize_size.height;
            bottomleft.x = bottomleft.x * display_size.width / cmt_resize_size.width;
            bottomleft.y = bottomleft.y * display_size.height / cmt_resize_size.height;
            bottomright.x = bottomright.x * display_size.width / cmt_resize_size.width;
            bottomright.y = bottomright.y * display_size.height / cmt_resize_size.height;
            
            //            cv::line(image,topleft,topright,Scalar(255,255,255),1);
            //            cv::line(image,topright,bottomright,Scalar(255,255,255),1);
            //            cv::line(image,bottomright,bottomleft,Scalar(255,255,255),1);
            //            cv::line(image,bottomleft,topleft,Scalar(255,255,255),1);
            
            ////////////////////////////////////////////////////////////////////////
            int roix, roiy, roiwidth, roiheight = 0;
            roix = (int)topleft.x;
            roiy = (int)topleft.y;
            roiwidth = (int)(bottomright.x  - topleft.x);
            roiheight = (int)(bottomright.y - topleft.y);
            
            if(roix >= 0 && roiwidth >= 0 && roix+roiwidth <= display_size.width && roiy >=0 && roiheight >=0 && roiy+roiheight <= display_size.height){
                
                //                Rect roi = new Rect(roix, roiy, roiwidth, roiheight);
                cv::Rect roi = cv::Rect(roix, roiy, roiwidth, roiheight);
                int lineLength = 20;
                /* corners:
                 * p1 - p2
                 * |     |
                 * p4 - p3
                 */
                int cornerRadius = 10;
                Scalar lineColor = Scalar(0, 255, 0);
                int thickness = 2;
                int lineType = 8;
                CvPoint p1 = CvPoint(roi.x, roi.y);
                CvPoint p2 = CvPoint(roi.x+roi.width, roi.y);
                CvPoint p3 = CvPoint(roi.x+roi.width, roi.y+roi.height);
                CvPoint p4 = CvPoint(roi.x, roi.y+roi.height);
                
                // draw straight lines
                cv::line(image, CvPoint(p1.x+cornerRadius,p1.y), CvPoint(p1.x+cornerRadius+lineLength,p1.y), lineColor, thickness, lineType, 0);
                cv::line(image, CvPoint (p2.x-cornerRadius-lineLength,p2.y), CvPoint (p2.x-cornerRadius,p2.y), lineColor, thickness, lineType, 0);
                
                cv::line(image, CvPoint (p2.x,p2.y+cornerRadius), CvPoint (p2.x,p2.y+cornerRadius+lineLength), lineColor, thickness, lineType, 0);
                cv::line(image, CvPoint (p3.x,p3.y-cornerRadius-lineLength), CvPoint (p3.x,p3.y-cornerRadius), lineColor, thickness, lineType, 0);
                
                cv::line(image, CvPoint (p4.x+cornerRadius,p4.y), CvPoint (p4.x+cornerRadius+lineLength,p4.y), lineColor, thickness, lineType, 0);
                cv::line(image, CvPoint (p3.x-cornerRadius-lineLength,p3.y), CvPoint (p3.x-cornerRadius,p3.y), lineColor, thickness, lineType, 0);
                
                cv::line(image, CvPoint (p1.x,p1.y+cornerRadius), CvPoint (p1.x,p1.y+cornerRadius+lineLength), lineColor, thickness, lineType, 0);
                cv::line(image, CvPoint (p4.x,p4.y-cornerRadius-lineLength), CvPoint (p4.x,p4.y-cornerRadius), lineColor, thickness, lineType, 0);
                
                // draw arcs
                cv::Size sTemp = cv::Size(cornerRadius,cornerRadius);
                cv::ellipse( image, CvPoint(p1.x+cornerRadius, p1.y+cornerRadius), sTemp, 180.0, 0, 90, lineColor, thickness, lineType, 0);
                cv::ellipse( image, CvPoint(p2.x-cornerRadius, p2.y+cornerRadius), sTemp, 270.0, 0, 90, lineColor, thickness, lineType, 0);
                cv::ellipse( image, CvPoint(p3.x-cornerRadius, p3.y-cornerRadius), sTemp, 0.0, 0, 90, lineColor, thickness, lineType, 0);
                cv::ellipse( image, CvPoint(p4.x+cornerRadius, p4.y-cornerRadius), sTemp, 90.0, 0, 90, lineColor, thickness, lineType, 0);
                //////////////////////////////////////////////////////////////////////////////////////
                
                //draw some crosshairs around the object
                int x, y = 0;
                x = roi.x + roi.width / 2;
                y = roi.y + roi.height / 2;
                
                // public static void circle(Mat img, Point center, int radius, Scalar color, int thickness, int lineType, int shift)
                cv::circle(image, CvPoint(x, y), roi.width/5, Scalar(0, 255, 0), 1, 1, 0);
                cv::circle(image, CvPoint(x, y), 3, Scalar(255, 0, 0), -1);
                
            }

            
            //draw some crosshairs around the object
            //            int x, y = 0;
            //            x = topleft.x+(bottomright.x-topleft.x)/2;
            //            y = topleft.y+(bottomright.y-topleft.y)/2;
            //            cv::circle(image,cv::Point(x,y),10,Scalar(0,255,0),1);
            //            cv::line(image,cv::Point(x,y),cv::Point(x,y-15),Scalar(0,255,0),1);
            //            cv::line(image,cv::Point(x,y),cv::Point(x,y+15),Scalar(0,255,0),1);
            //            cv::line(image,cv::Point(x,y),cv::Point(x-15,y),Scalar(0,255,0),1);
            //            cv::line(image,cv::Point(x,y),cv::Point(x+15,y),Scalar(0,255,0),1);
        }
    }
    
}
#endif

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.videoSource stop];
    UITouch *touch = [touches anyObject];
    start_p = [touch locationInView:mySubview];
    
    CGRect drawnFrame = backView.frame;
    drawnFrame.origin.x = start_p.x;
    drawnFrame.origin.y = start_p.y;
    backView.frame = drawnFrame;
    
    isObjectSelected = 0;
    firstStep = 0;
    [backView setHidden:FALSE];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(isObjectSelected){
        //[backView setHidden:TRUE];
        //backView.frame = CGRectMake(0,0,0,0);
        return;
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:mySubview]; //mySubview
    
    CGRect drawnFrame = backView.frame;
    drawnFrame.size.width = std::abs(start_p.x - p.x);
    drawnFrame.size.height = std::abs(start_p.y - p.y);
    backView.frame = drawnFrame;
    
    //[mySubview bringSubviewToFront:backView];
    
    //cv::rectangle(currentImg,cvPoint(start_p.x, start_p.y), cvPoint(p.x, p.y), CV_RGB(255, 0, 0));
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event // (2)
{
    UITouch *touch = [touches anyObject];
    start_p = [touch locationInView:mySubview];
    //[self.videoSource start];
    isObjectSelected = 1;
    firstStep = 1;
    [backView setHidden:TRUE];
    
    isTracking = Gclee_on;
    [self setTrackingButton];
    
    //    [mySubview sendSubviewToBack:backView];
}



@end
