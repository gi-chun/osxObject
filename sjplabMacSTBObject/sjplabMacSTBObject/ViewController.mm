//
//  ViewController.m
//  sjplabMacSTBObject
//
//  Created by gclee on 2016. 10. 24..
//  Copyright © 2016년 sjplab. All rights reserved.
//


#ifdef __OBJC__
#import "ViewController.h"
#import "main_header.h"
//using namespace cocos2d;
#endif

#ifdef __cplusplus
#include "Main.h"
#include "Config.h"
#include "ImAcq.h"
#include "Gui.h"
#include "TLDUtil.h"
#include "Trajectory.h"
#include "CMT.h"

using namespace tld;
using namespace cv;
#endif


@interface ViewController()<CvVideoCameraDelegate>
{
    
    //__weak IBOutlet NSImageView *videoView;
    
    NSView *backView;
    
    Main *main;
    tld::Gui *gui;
    int firstStep; //1: first, 0: no
    int isObjectSelected; //1:yes 0:no
    CMT cmt;
    
    CvPoint roitopleft;
    CvPoint roibottomright;
    
    BOOL mousedrag;
    BOOL objecttracking;
    cv::Size displaySize;
}

@property (nonatomic, strong) CvVideoCamera* videoSource;

@property (weak) IBOutlet NSView *videoView;




@end

@implementation ViewController
@synthesize videoSource;
@synthesize videoView;

- (IBAction)objecttrackingClick:(id)sender {
    
    objecttracking = !objecttracking;
    
    if(objecttracking){
       mousedrag = NO;
    }else{
        firstStep = 1;
    }
    NSLog(@"objecttrackingClick %d", objecttracking);
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    objecttracking = NO;
    
//    backView = [[NSView alloc]init];
//    [backView setWantsLayer:YES];
//    [backView.layer setBackgroundColor:[[NSColor whiteColor] CGColor]];
//    [backView setFrame:CGRectMake(100, 100, 100, 100)];
//    [videoView addSubview:backView];
    
    //[[self view] window] setStyleMask:<#(NSUInteger)#>
    //[[[self view] window] setBackgroundColor:[NSColor blackColor]];
    
    //self.videoSource = [[CvVideoCamera alloc] initWithParentView:_videoView];
    self.videoSource = [[CvVideoCamera alloc] initWithParentView:videoView];
    //self.videoSource = [[CvVideoCamera alloc] initWithParentView:self.view];
    //self.videoSource.defaultAVCaptureDevicePosition = [self get_inputType];
    self.videoSource.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack;
    self.videoSource.defaultAVCaptureSessionPreset = [self get_display_resolution]; //AVCaptureSessionPreset640x480, AVCaptureSessionPreset1280x720
    //self.videoSource.defaultFPS = (int)[self get_original_fps]; //30 (10 ~ 30) 25 ok, 20 best ok
    self.videoSource.defaultFPS = 30; //30 (10 ~ 30) 25 ok, 20 best ok
    self.videoSource.delegate = self;
    self.videoSource.recordVideo = NO;
    self.videoSource.grayscaleMode = NO;
    self.videoSource.inputMethod = [[NSUserDefaults standardUserDefaults] integerForKey:inputMethod];
    
    [self.view setWantsLayer:YES];
    [self.view.layer setBackgroundColor:[[NSColor blackColor] CGColor]];
    //self.view.layer.backgroundColor = CGColorCreateGenericRGB(0, 0, 0, 1.0);

    main = new Main();
    Config config;
    config.configure(main);
    
    //    gui = new tld::Gui();
//    main->gui = gui;
//    srand(main->seed);

    firstStep = 1;
    
    // Do any additional setup after loading the view.
}

- (void) viewDidLayout
{
    [super viewDidLayout];
    //update video view layer
    [self.videoSource layoutPreviewLayer];
}

-(void) viewDidAppear
{
    [self.videoSource start];
}

-(void) viewWillAppear:(BOOL)animated
{
    firstStep = 1;
}

#pragma mark - Protocol CvVideoCameraDelegate

#ifdef __cplusplus
- (void) processImage:(cv::Mat&)image
{
    
    //NSLog(@"processImage #####################################");
    
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
    cv::Mat dst, cmt_im_gray;
    cv::Size resize_size = [self get_resize_size];
    cv::Size display_size = [self get_display_resize_size];
    
    resize(image, dst, cv::Size(resize_size.width,resize_size.height));
    
    resize(image, image, cv::Size(display_size.width,display_size.height));
    
    //    resize(image, dst, cv::Size(320,180));
    
    //get use algorithm
    NSInteger luseKeypoints, luseLearning;
    [self get_use_algorithim:luseKeypoints useLearning:luseLearning];
    //NSLog(@"luseKeypoints:%ld == luseLearning:%ld", luseKeypoints, luseLearning);
    
    //    if(luseLearning){
    //        cvtColor(dst, im_gray, CV_BGR2GRAY);
    //        //cvtColor(image, im_gray, CV_BGR2GRAY);
    //    }
    if(luseKeypoints){
        cv::cvtColor(dst, cmt_im_gray, CV_BGR2GRAY);
        //cvtColor(image, cmt_im_gray, CV_BGR2GRAY);
    }
    
    //    cvtColor(image, im_gray, CV_BGR2GRAY);
    //    cvtColor(image, cmt_im_gray, CV_BGR2GRAY);
    
    
    if(!objecttracking){
        main->tld->release();
        main->cmt_tracking = false;
    }
    
    if(objecttracking){
        
        if(firstStep){
            
//            CGRect drawnFrame = backView.frame;
//            if(drawnFrame.size.width < 1 && drawnFrame.size.height < 1)
//                return;
            
            cv::Rect r = cv::Rect(roitopleft.x, roitopleft.y, roibottomright.x - roitopleft.x, roibottomright.y - roitopleft.y);
            
            //NSLog(@" kScreenBoundsWidth %f, kScreenBoundsHeight %f ", kScreenBoundsWidth, kScreenBoundsHeight);
            //NSLog(@" imageView Width %f, imageView Height %f ", videoView.frame.size.width, videoView.frame.size.height);
            
            r.x = r.x * resize_size.width / videoView.frame.size.width;
            r.y = r.y * resize_size.height / videoView.frame.size.height;
            r.width = r.width * resize_size.width / videoView.frame.size.width;
            r.height = r.height * resize_size.height / videoView.frame.size.height;

            
            if(luseLearning){
                
                cv::Mat grey;
                cvtColor(dst, grey, CV_BGR2GRAY);
                
                main->tld->detectorCascade->imgWidth = grey.cols;
                main->tld->detectorCascade->imgHeight = grey.rows;
                main->tld->detectorCascade->imgWidthStep = grey.step;
                main->tld->selectObject(grey, &r);
            }
            
            if(luseKeypoints){
                //cmt tracket init
                cv::Point2f initTopLeft(r.x, r.y);
                cv::Point2f initBottomDown(r.x+r.width,r.y+r.height);
                //main->cmt_tracking = cmt.initialise(cmt_im_gray, initTopLeft, initBottomDown);
                main->cmt_tracking = cmt.initialise(cmt_im_gray, initTopLeft, initBottomDown);
            }
            
            firstStep = 0;
        }
        
        if(luseLearning)
            main->tld->processImage(dst);
        
        if(main->cmt_tracking){
            if(luseKeypoints)
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
        CvScalar yellow = CV_RGB(155, 155, 0);
        CvScalar blue = CV_RGB(155, 0, 155);
        CvScalar white = CV_RGB(255, 255, 255);
        
        CvFont font;
        cvInitFont(&font, CV_FONT_HERSHEY_SIMPLEX, .5, .5, 0, 1, 8);
        
        //cvRectangle(img, cvPoint(0, 0), cvPoint(img->width, 50), black, CV_FILLED, 8, 0);
        //cvPutText(img, string, cvPoint(25, 25), &font, white);
        cv::putText(image, string, cvPoint(25,25), 1, 1, yellow);
        
        //draw roi rect
        if(!objecttracking && mousedrag){
            
            cv::Rect r = cv::Rect(roitopleft.x, roitopleft.y, roibottomright.x - roitopleft.x, roibottomright.y - roitopleft.y);
           
//            r.x = r.x * videoView.frame.size.width / resize_size.width;
//            r.y = r.y * videoView.frame.size.height / resize_size.height;
//            r.width = r.width * videoView.frame.size.width / resize_size.width;
//            r.height = r.height * videoView.frame.size.height / resize_size.height;
            
            r.x = r.x * display_size.width / videoView.frame.size.width;
            r.y = r.y * display_size.height / videoView.frame.size.height;
            r.width = r.width * display_size.width / videoView.frame.size.width;
            r.height = r.height * display_size.height / videoView.frame.size.height;

            cv:rectangle(image, r, CV_RGB(0,255,0), 2);
            //NSLog(@"topleft x:%d,y:%d bottomright x:%d,y:%d", roitopleft.x, roitopleft.y, roibottomright.x, roibottomright.y);
        }
        
        if(cmt.hasResult && main->cmt_tracking){
            for(int i = 0; i<cmt.trackedKeypoints.size(); i++){
                
                CvPoint nPoint = cmt.trackedKeypoints[i].first.pt;
                nPoint.x = nPoint.x * display_size.width / resize_size.width;
                nPoint.y = nPoint.y * display_size.height / resize_size.height;
//                nPoint.x = nPoint.x * display_size.width / videoView.frame.size.width;
//                nPoint.y = nPoint.y * display_size.height / videoView.frame.size.height;
                
                //cvCircle(img, cmt.trackedKeypoints[i].first.pt, 3, cv::Scalar(255,255,255));
                //cvCircle(img, nPoint, 3, cv::Scalar(255,255,255));
                cv::circle(image, nPoint, 3, cv::Scalar(255,255,255));
            }
            
            CvPoint topleft = cvPoint(cmt.boundingbox.x, cmt.boundingbox.y);
            CvPoint bottomRight = cvPoint(cmt.boundingbox.x+cmt.boundingbox.width, cmt.boundingbox.y+cmt.boundingbox.height);
            
            topleft.x = topleft.x * display_size.width / resize_size.width;
            topleft.y = topleft.y * display_size.height / resize_size.height;
            bottomRight.x = bottomRight.x * display_size.width / resize_size.width;
            bottomRight.y = bottomRight.y * display_size.height / resize_size.height;
            
//            topleft.x = topleft.x * resize_size.width / videoView.frame.size.width;
//            topleft.y = topleft.y * resize_size.height / videoView.frame.size.height;
//            bottomRight.x = bottomRight.x * resize_size.width / videoView.frame.size.width;
//            bottomRight.y = bottomRight.y * resize_size.height / videoView.frame.size.height;
            
            cv::rectangle(image, topleft, bottomRight, Scalar(0,0,255), 1, 4);
            
            //draw some crosshairs around the object
            int x, y = 0;
            x = topleft.x+(bottomRight.x-topleft.x)/2;
            y = topleft.y+(bottomRight.y-topleft.y)/2;
            
            cv::circle(image,cv::Point(x,y),10,Scalar(0,255,0),1);
            cv::line(image,cv::Point(x,y),cv::Point(x,y-15),Scalar(0,255,0),1);
            cv::line(image,cv::Point(x,y),cv::Point(x,y+15),Scalar(0,255,0),1);
            cv::line(image,cv::Point(x,y),cv::Point(x-15,y),Scalar(0,255,0),1);
            cv::line(image,cv::Point(x,y),cv::Point(x+15,y),Scalar(0,255,0),1);
        }
        
        //end draw roi rect
        if(main->tld->currBB != NULL)
        {
            //if(confident){
            CvScalar rectangleColor = (confident) ? blue : yellow;
            int thinkness = (confident) ? 2 : 5;
            
            CvPoint topleft = cvPoint(main->tld->currBB->x, main->tld->currBB->y);
            CvPoint bottomRight = cvPoint(main->tld->currBB->x+main->tld->currBB->width, main->tld->currBB->y+main->tld->currBB->height);
            
            cv::Rect r = cv::Rect(topleft.x, topleft.y, bottomRight.x - topleft.x, bottomRight.y - topleft.y);
            r.x = r.x * display_size.width / resize_size.width;
            r.y = r.y * display_size.height / resize_size.height;
            r.width = r.width * display_size.width / resize_size.width;
            r.height = r.height * display_size.height / resize_size.height;
            
//            r.x = r.x * resize_size.width / videoView.frame.size.width;
//            r.y = r.y * resize_size.height / videoView.frame.size.height;
//            r.width = r.width * resize_size.width / videoView.frame.size.width;
//            r.height = r.height * resize_size.height / videoView.frame.size.height;
            
            //cvRectangle(img, main->tld->currBB->tl(), main->tld->currBB->br(), rectangleColor, 8, 8, 0);
            //cvRectangle(img, topleft, bottomRight, rectangleColor, 4, 8, 0);
            
            cv::rectangle(image, r, rectangleColor, thinkness);
            
            //CvPoint center = cvPoint(main->tld->currBB->x+main->tld->currBB->width/2, main->tld->currBB->y+main->tld->currBB->height/2);
            CvPoint center = cvPoint(r.x+r.width/2, r.y+r.height/2);
            //                cvLine(img, cvPoint(center.x-2, center.y-2), cvPoint(center.x+2, center.y+2), rectangleColor, 2);
            //                cvLine(img, cvPoint(center.x-2, center.y+2), cvPoint(center.x+2, center.y-2), rectangleColor, 2);
            
            cv::line(image, cvPoint(center.x-2, center.y-2), cvPoint(center.x+2, center.y+2), rectangleColor, 2);
            cv::line(image, cvPoint(center.x-2, center.y+2), cvPoint(center.x+2, center.y-2), rectangleColor, 2);
            //}
        }
    }
    
}
#endif

- (void)mouseDown:(NSEvent *)theEvent {
    
    if(theEvent.type != NSLeftMouseDown)
        return;
    
    displaySize = [self get_display_resize_size];
    NSPoint event_location = [theEvent locationInWindow];
    NSPoint point = [self.view convertPoint:event_location fromView:nil];
    
    //NSPoint point = [theEvent locationInWindow];
    NSRect viewFrameInWindowCoords = [videoView convertRect: [videoView bounds] toView: nil];
    
    roitopleft.x = point.x;
    roitopleft.y = point.y - (self.view.frame.size.height - videoView.frame.size.height);
    roitopleft.y = videoView.frame.size.height - roitopleft.y;
    //roitopleft.y = point.y;
    
//    //convert point on videoview
//    roitopleft.x = roitopleft.x * videoView.frame.size.width / self.view.frame.size.width;
//    roitopleft.y = roitopleft.y * videoView.frame.size.height / self.view.frame.size.height;
//    //convert point on image
//    roitopleft.x = roitopleft.x * displaySize.width / videoView.frame.size.width;
//    roitopleft.y = roitopleft.y * displaySize.height / videoView.frame.size.height;
    
    roibottomright = roitopleft;
    mousedrag = YES;
    
    NSLog(@"mouseDown videoView x:%f : y:%f : width:%f :height:%f", videoView.frame.origin.x, videoView.frame.origin.y, videoView.frame.size.width, videoView.frame.size.height);
    NSLog(@"mouseDown control view x:%f : y:%f width:%f : height:%f", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    
    NSLog(@"mouseDown videoView in window x:%f : y:%f", viewFrameInWindowCoords.origin.x, viewFrameInWindowCoords.origin.y);
    NSLog(@"mouseDown point x:%f : y:%f", point.x, point.y);
    NSLog(@"mouseDown videoView bound x:%f :  y:%f", videoView.bounds.origin.x, videoView.bounds.origin.y);
    
}

- (void)mouseDragged:(NSEvent *)theEvent {
    
    NSPoint event_location = [theEvent locationInWindow];
    NSPoint point = [self.view convertPoint:event_location fromView:nil];

    //NSPoint point = [theEvent locationInWindow];
    NSRect viewFrameInWindowCoords = [videoView convertRect: [videoView bounds] toView: nil];
    
    roibottomright.x = point.x;
    roibottomright.y = point.y - (self.view.frame.size.height - videoView.frame.size.height);
    roibottomright.y = videoView.frame.size.height - roibottomright.y;
    //roibottomright.y = point.y;
    
//    //convert point on videoview
//    roibottomright.x = roibottomright.x * videoView.frame.size.width / self.view.frame.size.width;
//    roibottomright.y = roibottomright.y * videoView.frame.size.height / self.view.frame.size.height;
//    //convert point on image
//    roibottomright.x = roibottomright.x * displaySize.width / videoView.frame.size.width;
//    roibottomright.y = roibottomright.y * displaySize.height / videoView.frame.size.height;
}

- (void)mouseUp:(NSEvent *)theEvent {
    
    //mousedrag = NO;
}


//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    //[self.videoSource stop];
//    UITouch *touch = [touches anyObject];
//    start_p = [touch locationInView:self.containerView];
//    
//    CGRect drawnFrame = backView.frame;
//    drawnFrame.origin.x = start_p.x;
//    drawnFrame.origin.y = start_p.y;
//    backView.frame = drawnFrame;
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    if(isObjectSelected){
//        //[backView setHidden:TRUE];
//        //backView.frame = CGRectMake(0,0,0,0);
//        return;
//    }
//    
//    UITouch *touch = [touches anyObject];
//    cocos2d::CGPoint p = [touch locationInView:self.containerView];
//    
//    cocos2d::CGRect drawnFrame = backView.frame;
//    drawnFrame.size.width = std::abs(start_p.x - p.x);
//    drawnFrame.size.height = std::abs(start_p.y - p.y);
//    backView.frame = drawnFrame;
//    
//    //cv::rectangle(currentImg,cvPoint(start_p.x, start_p.y), cvPoint(p.x, p.y), CV_RGB(255, 0, 0));
//    
//}
//
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event // (2)
//{
//    UITouch *touch = [touches anyObject];
//    start_p = [touch locationInView:self.containerView];
//    //[self.videoSource start];
//}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - public function

-(void)setObjectTracking:(NSInteger)isDo{
    
    if(isDo){
        
        isObjectSelected = 1;
        firstStep = 1;
        [backView setHidden:TRUE];
        
    }else{
        
        isObjectSelected = 0;
        [backView setHidden:FALSE];
        
    }
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

- (NSString*)get_display_resolution{
    
    NSString* rstring;
    NSInteger display_optionNo = [[NSUserDefaults standardUserDefaults] integerForKey:cdisplay_optionNo];
    
    switch (display_optionNo) {
        case 0:
            rstring = AVCaptureSessionPreset640x480;
            break;
        case 1:
            rstring = AVCaptureSessionPreset640x480;
            break;
        case 2:
            rstring = AVCaptureSessionPreset1280x720;
            break;
        case 3:
            rstring = AVCaptureSessionPreset640x480;
            break;
        case 4:
            rstring = AVCaptureSessionPreset640x480;
            break;
            
        default:
            rstring = AVCaptureSessionPreset640x480;
            
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
            rinteger = AVCaptureDevicePositionUnspecified;
            break;
        case 1:
            rinteger = AVCaptureDevicePositionUnspecified;
            break;
        case 2:
            rinteger = AVCaptureDevicePositionUnspecified;
            break;
            
        default:
            rinteger = AVCaptureDevicePositionUnspecified;
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


- (NSInteger)get_original_fps
{
    NSInteger rinteger;
    
    NSInteger orgFPS_optionNo = [[NSUserDefaults standardUserDefaults] integerForKey:corgFPS_optionNo];
    
    switch (orgFPS_optionNo) {
        case 0:
            rinteger = 15;
            break;
        case 6:
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


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
