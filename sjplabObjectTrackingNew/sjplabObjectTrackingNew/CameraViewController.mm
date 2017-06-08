//
//  CameraViewController.m
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
#import "CameraViewController.h"
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

@interface CameraViewController ()<CvVideoCameraDelegate>
{
    //UIImageView *containerView;
    cv::Mat currentImg;
    CGPoint start_p;
    //UIView *backView;
    //UIView *videoView;
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
    __weak IBOutlet UIView *mySubview;
    
    NSInteger currentVideoType;
    NSInteger currentAlgorithm;
    NSInteger isTracking;

    __weak IBOutlet UIButton *camView;
    __weak IBOutlet UIButton *streamView;
    __weak IBOutlet UIButton *actionView;
    __weak IBOutlet UIButton *normalView;
    __weak IBOutlet UIButton *otherView;
    __weak IBOutlet UIButton *homeView;
    
    __weak IBOutlet UIView *videoView;
    __weak IBOutlet UIView *backView;
}

@property (nonatomic, strong) CvVideoCamera* videoSource;
@property (nonatomic, strong) UIImageView* containerView;


@end

@implementation CameraViewController : UIViewController

@synthesize videoSource;
@synthesize containerView;

- (void)buttonPressed:(UIButton*)button
{
    NSLog(@"Button  clicked.");
}

- (void)setVideoSourceButton{
    
    UIImage *buttonOff = [UIImage imageNamed:@"check_normal_ios.png"];
    UIImage *buttonOn = [UIImage imageNamed:@"check_pressed_ios.png"];
    
    if(currentVideoType == Gclee_Cam){
        [camView setImage:buttonOn forState:UIControlStateNormal];
        [streamView setImage:buttonOff forState:UIControlStateNormal];
    }else{
        [camView setImage:buttonOff forState:UIControlStateNormal];
        [streamView setImage:buttonOn forState:UIControlStateNormal];
    }
}

- (void)setAlgorithimButton{
    
    UIImage *buttonOff = [UIImage imageNamed:@"check_normal_ios.png"];
    UIImage *buttonOn = [UIImage imageNamed:@"check_pressed_ios.png"];
    
    if(currentAlgorithm == Gclee_cmt){
        [normalView setImage:buttonOn forState:UIControlStateNormal];
        [otherView setImage:buttonOff forState:UIControlStateNormal];
        
    }else{
        [normalView setImage:buttonOff forState:UIControlStateNormal];
        [otherView setImage:buttonOn forState:UIControlStateNormal];
    }
    [normalView setNeedsDisplay];
    [otherView setNeedsDisplay];
}

- (void)setTrackingButton{
    
    UIImage *buttonOff = [UIImage imageNamed:@"tracking_normal_ios.png"];
    UIImage *buttonOn = [UIImage imageNamed:@"tracking_pressed_ios.png"];
    
    if(isTracking){
        [actionView setImage:buttonOn forState:UIControlStateNormal];
    }else{
        [actionView setImage:buttonOff forState:UIControlStateNormal];
    }
    [actionView setNeedsDisplay];
}

- (IBAction)clickChangeAction:(id)sender {
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    CGFloat marginX = 0.0;
    //    marginX = (kScreenBoundsWidth-250)/2;
    
    //    [self.view setBounds:CGRectMake(0,0,kScreenBoundsWidth, kScreenBoundsHeight)];
    //    containerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenBoundsWidth, kScreenBoundsHeight)];
    //    containerView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    containerView = [[UIImageView alloc] init];
//    //    [containerView setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [containerView setBackgroundColor:[UIColor redColor]];
//    [self.view setBackgroundColor:[UIColor blueColor]];
//    [self.view addSubview:containerView];
//    [containerView setFrame:self.view.frame];
    
    NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeRight]; //UIDeviceOrientationLandscapeRight
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
    
//    backView = [[UIView alloc]init];
//    backView.backgroundColor = [UIColor greenColor];
//    //backView.userInteractionEnabled = YES;
//    //backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
//    backView.alpha = 0.5;
//    //    CGRect drawnFrame = CGRectMake(0,0,0,0);
//    //    backView.frame = drawnFrame;
//    //[self.view addSubview:backView];
//    //[mySubview addSubview:backView];
//    [mySubview insertSubview:backView atIndex:0];

//    videoView = [[UIView alloc]init];
//    [mySubview insertSubview:videoView atIndex:0];
//    CGRect bounds = CGRectZero;
//    bounds.size = [self.view convertRect:self.view.bounds toView:videoView].size;
//    videoView.bounds = bounds;
//    videoView.center = CGPointMake( self.view.bounds.size.width/2.0, self.view.bounds.size.height/2.0 );
//    videoView.userInteractionEnabled = YES;
    
//    UIImage *buttonOff = [UIImage imageNamed:@"tracking_normal_ios.png"];
//    UIImage *buttonOn = [UIImage imageNamed:@"tracking_pressed_ios.png"];
//    UIButton *predictButton = [UIButton alloc];
//    predictButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    predictButton.frame = CGRectMake(10.0, 10.0, 120.0, 30.0);
//    [predictButton setBackgroundImage:buttonOff forState:UIControlStateNormal];
//    [predictButton setBackgroundImage:buttonOn forState:UIControlStateHighlighted];
//    [predictButton setTitle:@"Predict" forState:UIControlStateNormal];
//    [predictButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
//    [predictButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:predictButton];
    
//    camView.userInteractionEnabled = YES;
//    streamView.userInteractionEnabled = YES;
//    actionView.userInteractionEnabled = YES;
//    normalView.userInteractionEnabled = YES;
//    otherView.userInteractionEnabled = YES;
//    homeView.userInteractionEnabled = YES;
//    
//    camView.enabled = YES;
//    streamView.enabled = YES;
//    actionView.enabled = YES;
//    normalView.enabled = YES;
//    otherView.enabled = YES;
//    homeView.enabled = YES;
    
    //self.videoSource = [[CvVideoCamera alloc] initWithParentView:containerView];
    self.videoSource = [[CvVideoCamera alloc] initWithParentView:videoView]; //mySubView
    self.videoSource.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack; //[self get_inputType];
    self.videoSource.defaultAVCaptureSessionPreset = AVCaptureSessionPreset1280x720;//[self get_display_resolution]; //AVCaptureSessionPreset640x480, AVCaptureSessionPreset1280x720
    self.videoSource.defaultFPS = 20;//(int)[self get_original_fps]; //30 (10 ~ 30) 25 ok, 20 best ok
    //    self.videoSource.defaultFPS = 10; //30 (10 ~ 30) 25 ok, 20 best ok
    self.videoSource.delegate = self;
    self.videoSource.recordVideo = NO;
    self.videoSource.grayscaleMode = NO;
    self.videoSource.useAVCaptureVideoPreviewLayer = NO;
//    self.videoSource.rotateVideo = YES;
    
    
    //    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    ////    g_orientation = [[UIApplication sharedApplication] statusBarOrientation];
//    [self.videoSource adjustLayoutToInterfaceOrientation:(UIInterfaceOrientation)UIDeviceOrientationLandscapeRight]; //UIDeviceOrientationLandscapeLeft
    
    //init ui
    currentVideoType = Gclee_Cam;
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
    
}
- (IBAction)showStreamView:(id)sender {
    NSLog(@"click showStreamView");
}

- (void) viewDidAppear:(BOOL)animated
{
//    [self.videoSource adjustLayoutToInterfaceOrientation:(UIInterfaceOrientation)UIInterfaceOrientationMaskLandscapeRight];
    
    [self.videoSource start];
    
//    [self.view bringSubviewToFront:mySubview];
//    [mySubview bringSubviewToFront:backView];
//    
//    [mySubview bringSubviewToFront:camView];
//    [mySubview bringSubviewToFront:streamView];
//    [mySubview bringSubviewToFront:actionView];
//    [mySubview bringSubviewToFront:normalView];
//    [mySubview bringSubviewToFront:otherView];
//    [mySubview bringSubviewToFront:homeView];
    
    
    [super viewDidAppear:animated];
    
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
//    [self.videoSource adjustLayoutToInterfaceOrientation:(UIInterfaceOrientation)UIInterfaceOrientationMaskLandscapeRight]; //UIDeviceOrientationLandscapeLeft
    return UIInterfaceOrientationMaskLandscapeLeft; //UIInterfaceOrientationMaskPortrait
}

- (void) deviceOrientationDidChange
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    //containerView.frame = self.view.frame;
    
//    [self.videoSource adjustLayoutToInterfaceOrientation:(UIInterfaceOrientation)orientation];
    
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            NSLog(@"UIDeviceOrientationPortrait");
            //[self.videoSource adjustLayoutToInterfaceOrientation:(UIInterfaceOrientation)orientation];
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"UIDeviceOrientationPortraitUpsideDown");
            //[self.videoSource adjustLayoutToInterfaceOrientation:(UIInterfaceOrientation)orientation];
            break;
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"UIDeviceOrientationLandscapeLeft");
            //[self.videoSource adjustLayoutToInterfaceOrientation:(UIInterfaceOrientation)orientation];
            break;
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"UIDeviceOrientationLandscapeRight");
            //[self.videoSource adjustLayoutToInterfaceOrientation:(UIInterfaceOrientation)orientation];
            break;
            
        default:
            break;
    }
}

-(void) viewWillAppear:(BOOL)animated
{
    firstStep = 1;
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.videoSource stop];
    
    //tld & cmt delete
    delete main;
    main = NULL;
    delete gui;
    gui = NULL;
    firstStep = 0;
    //end
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)orientation
                                         duration:(NSTimeInterval)duration {
    
    NSLog(@"willAnimateRotationToInterfaceOrientation ");
    
    //    typedef NS_ENUM(NSInteger, UIInterfaceOrientation) {
    //        UIInterfaceOrientationUnknown            = UIDeviceOrientationUnknown,
    //        UIInterfaceOrientationPortrait           = UIDeviceOrientationPortrait,
    //        UIInterfaceOrientationPortraitUpsideDown = UIDeviceOrientationPortraitUpsideDown,
    //        UIInterfaceOrientationLandscapeLeft      = UIDeviceOrientationLandscapeRight,
    //        UIInterfaceOrientationLandscapeRight     = UIDeviceOrientationLandscapeLeft
    //    } __TVOS_PROHIBITED;
    
    if( orientation == UIInterfaceOrientationUnknown )
    {
        NSLog(@"UIInterfaceOrientationUnknown");
        
    }else if( orientation == UIInterfaceOrientationPortrait )
    {
        NSLog(@"UIInterfaceOrientationPortrait");
        
    }else if( orientation == UIInterfaceOrientationPortraitUpsideDown )
    {
        NSLog(@"UIInterfaceOrientationPortraitUpsideDown");
        
    }else if( orientation == UIInterfaceOrientationLandscapeLeft )
    {
        NSLog(@"UIInterfaceOrientationLandscapeLeft");
        
    }else if( orientation == UIInterfaceOrientationLandscapeRight )
    {
        NSLog(@"UIInterfaceOrientationLandscapeRight");
    }
}

#pragma mark - Protocol CvVideoCameraDelegate

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
            NSLog(@" imageView Width %f, imageView Height %f ", containerView.frame.size.width, containerView.frame.size.height);
            
            
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
            ////////////////////////////////////////////////////////////////////////
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
//    [super touchesBegan:touches withEvent:event];
//    [self.nextResponder touchesBegan:touches withEvent:event];
    
//    for (UIView *view in mySubview.subviews){
//        [view touchesBegan:touches withEvent:event];
//    }
    
    // Pass to top of chain
//    UIResponder *responder = self;
//    while (responder.nextResponder != nil){
//        responder = responder.nextResponder;
//        if ([responder isKindOfClass:[UIViewController class]]) {
//            // Got ViewController
//            break;
//        }
//    }
//    [responder touchesBegan:touches withEvent:event];
    
    
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
//    CGPoint p = [touch locationInView:self.containerView]; //mySubview
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
//    [mySubview sendSubviewToBack:backView];
    
    isTracking = Gclee_on;
    [self setTrackingButton];

}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - public function

- (void)setROI{
    
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

-(void)setVideoType:(NSInteger)type{
    [self.videoSource stop];
    //self.videoSource = [[CvVideoCamera alloc] initWithParentView:containerView];
    self.videoSource.defaultAVCaptureSessionPreset = AVCaptureSessionPreset1280x720; //AVCaptureSessionPreset640x480, AVCaptureSessionPreset1280x720
    self.videoSource.defaultFPS = 30;
    self.videoSource.delegate = self;
    self.videoSource.recordVideo = NO;
    self.videoSource.grayscaleMode = NO;
    
    if(type == 0){
        self.videoSource.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack;
    }else{
        self.videoSource.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    }
    [self.videoSource start];
}

- (NSString*)get_display_resolution{
    
    NSString* rstring;
    NSInteger display_optionNo = [[NSUserDefaults standardUserDefaults] integerForKey:cdisplay_optionNo];
    
    switch (display_optionNo) {
        case 0:
            rstring = AVCaptureSessionPreset352x288;
            break;
        case 1:
            rstring = AVCaptureSessionPreset640x480;
            break;
        case 2:
            rstring = AVCaptureSessionPreset1280x720;
            break;
        case 3:
            rstring = AVCaptureSessionPreset1920x1080;
            break;
        case 4:
            rstring = AVCaptureSessionPreset3840x2160;
            break;
            
        default:
            rstring = AVCaptureSessionPreset1280x720;
            
            break;
    }
    return rstring;
}

- (AVCaptureDevicePosition)get_inputType
{
    
    AVCaptureDevicePosition rinteger;
    NSInteger inputType_optionNo = [[NSUserDefaults standardUserDefaults] integerForKey:cinputType_optionNo];
    
    switch (inputType_optionNo) {
        case 0:
            rinteger = AVCaptureDevicePositionFront;
            break;
        case 1:
            rinteger = AVCaptureDevicePositionBack;
            break;
        case 2:
            rinteger = AVCaptureDevicePositionBack;
            break;
            
        default:
            rinteger = AVCaptureDevicePositionBack;
            break;
    }
    
    return rinteger;
}

- (cv::Size)get_resize_size
{
    cv::Size rsize;
    NSInteger processing_optionNo = [[NSUserDefaults standardUserDefaults] integerForKey:cprocessing_optionNo];
    
    switch (processing_optionNo) {
        case 0:
            rsize.width = 320; rsize.height = 240;
            break;
        case 1:
            rsize.width = 352; rsize.height = 288;
            break;
        case 2:
            rsize.width = 640; rsize.height = 480;
            break;
        case 3:
            rsize.width = 960; rsize.height = 540;
            break;
        case 4:
            rsize.width = 1280; rsize.height = 720;
            break;
            
        default:
            rsize.width = 640; rsize.height = 480;
            break;
    }
    return rsize;
    
}

- (cv::Size)get_display_resize_size
{
    cv::Size rsize;
    NSInteger display_optionNo = [[NSUserDefaults standardUserDefaults] integerForKey:cdisplay_optionNo];
    
    switch (display_optionNo) {
        case 0:
            rsize.width = 352; rsize.height = 288;
            break;
        case 1:
            rsize.width = 640; rsize.height = 480;
            break;
        case 2:
            rsize.width = 1280; rsize.height = 720;
            break;
        case 3:
            rsize.width = 1920; rsize.height = 1080;
            break;
        case 4:
            rsize.width = 3840; rsize.height = 2160;
            break;
            
        default:
            rsize.width = 1280; rsize.height = 720;
            break;
    }
    return rsize;
    
}


- (NSInteger)get_original_fps
{
    NSInteger rinteger;
    
    NSInteger orgFPS_optionNo = [[NSUserDefaults standardUserDefaults] integerForKey:corgFPS_optionNo];
    
    switch (orgFPS_optionNo) {
        case 0:
            rinteger = 15;
            break;
        case 1:
            rinteger = 20;
            break;
        case 11:
            rinteger = 25;
            break;
        case 12:
            rinteger = 30;
            break;
            
        default:
            rinteger = 30;
            break;
    }
    
    return rinteger;
}

- (void)get_use_algorithim:(NSInteger&)useKeypoints useLearning:(NSInteger&)useLearning
{
    
    useKeypoints = [[NSUserDefaults standardUserDefaults] integerForKey:ctrackingALG_keyPoints];
    useLearning = [[NSUserDefaults standardUserDefaults] integerForKey:ctrackingALG_learning];
    
}

@end
