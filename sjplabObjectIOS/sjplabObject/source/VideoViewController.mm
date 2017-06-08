//
//  VideoViewController.m
//  sjplabObject
//
//  Created by gclee on 2016. 10. 10..
//  Copyright © 2016년 sjplab. All rights reserved.
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
#import "VideoViewController.h"
#import "main_header.h"
#endif


@interface VideoViewController ()<CvVideoCameraDelegate>
{
    //UIImageView *containerView;
    cv::Mat currentImg;
    CGPoint start_p;
    UIView *backView;
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
}

@property (nonatomic, strong) CvVideoCamera* videoSource;
@property (nonatomic, strong) UIImageView* containerView;


@end

@implementation VideoViewController : UIViewController

@synthesize videoSource;
@synthesize containerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    CGFloat marginX = 0.0;
//    marginX = (kScreenBoundsWidth-250)/2;
    
//    [self.view setBounds:CGRectMake(0,0,kScreenBoundsWidth, kScreenBoundsHeight)];
//    containerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenBoundsWidth, kScreenBoundsHeight)];
//    containerView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    containerView = [[UIImageView alloc] init];
//    [containerView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [containerView setBackgroundColor:[UIColor redColor]];
    [self.view setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:containerView];
    [containerView setFrame:self.view.frame];
    
    backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor greenColor];
    backView.userInteractionEnabled = YES;
    //backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    backView.alpha = 0.5;
    [self.view addSubview:backView];

//
//    // Width constraint, half of parent view width
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:containerView
//                                                          attribute:NSLayoutAttributeWidth
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeWidth
//                                                         multiplier:1.0
//                                                           constant:0]];
//    
//    // Height constraint, half of parent view height
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:containerView
//                                                          attribute:NSLayoutAttributeHeight
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeHeight
//                                                         multiplier:1.0
//                                                           constant:0]];
//    
//    // Center horizontally
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:containerView
//                                                          attribute:NSLayoutAttributeCenterX
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeCenterX
//                                                         multiplier:1.0
//                                                           constant:0.0]];
//    
//    // Center vertically
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:containerView
//                                                          attribute:NSLayoutAttributeCenterY
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeCenterY
//                                                         multiplier:1.0
//                                                           constant:0.0]];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    // register for orientation change notification
//    [[NSNotificationCenter defaultCenter] addObserver: self
//                                             selector: @selector(orientationWillChange:)
//                                                 name: UIApplicationWillChangeStatusBarOrientationNotification
//                                               object: nil];
//    [[NSNotificationCenter defaultCenter] addObserver: self
//                                             selector: @selector(orientationDidChange:)
//                                                 name: UIApplicationDidChangeStatusBarOrientationNotification
//                                               object: nil];

    //gclee ing
    self.videoSource = [[CvVideoCamera alloc] initWithParentView:containerView];
    self.videoSource.defaultAVCaptureDevicePosition = [self get_inputType];
    self.videoSource.defaultAVCaptureSessionPreset = [self get_display_resolution]; //AVCaptureSessionPreset640x480, AVCaptureSessionPreset1280x720
    self.videoSource.defaultFPS = (int)[self get_original_fps]; //30 (10 ~ 30) 25 ok, 20 best ok
//    self.videoSource.defaultFPS = 10; //30 (10 ~ 30) 25 ok, 20 best ok
    self.videoSource.delegate = self;
    self.videoSource.recordVideo = NO;
    self.videoSource.grayscaleMode = NO;
    
//    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
////    g_orientation = [[UIApplication sharedApplication] statusBarOrientation];
//    [self.videoSource adjustLayoutToInterfaceOrientation:(UIInterfaceOrientation)UIDeviceOrientationLandscapeLeft];
    
    //tld & cmt init
    main = new Main();
    gui = new Gui();
    
    main->gui = gui;
    
    srand(main->seed);
    
//    if(main->showOutput)
//    {
//        gui->init();
//    }
    
    firstStep = 1;
    //end
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
////    g_orientation = [[UIApplication sharedApplication] statusBarOrientation];
//    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
//    [self.videoSource adjustLayoutToInterfaceOrientation:(UIInterfaceOrientation)orientation];
    
    [self.videoSource start];
    
}

//- (void) orientationWillChange: (NSNotification *) note
//{
//    UIInterfaceOrientation current = [[UIApplication sharedApplication] statusBarOrientation];
//    
//    NSLog(@"orientationWillChange current %ld, g_orientation %ld", current, (long)g_orientation);
//    
//    
//    if ( current == g_orientation )
//        return;
//    
//    // direction and angle
//    CGFloat angle = 0.0;
//    switch ( current )
//    {
//        case UIInterfaceOrientationPortrait:
//        {
//            switch ( g_orientation )
//            {
//                case UIInterfaceOrientationPortraitUpsideDown:
//                    angle = (CGFloat)M_PI;  // 180.0*M_PI/180.0 == M_PI
//                    break;
//                case UIInterfaceOrientationLandscapeLeft:
//                    angle = (CGFloat)(M_PI*-90.0)/180.0;
//                    break;
//                case UIInterfaceOrientationLandscapeRight:
//                    angle = (CGFloat)(M_PI*90.0)/180.0;
//                    break;
//                default:
//                    return;
//            }
//            break;
//        }
//        case UIInterfaceOrientationPortraitUpsideDown:
//        {
//            switch ( g_orientation )
//            {
//                case UIInterfaceOrientationPortrait:
//                    angle = (CGFloat)M_PI;  // 180.0*M_PI/180.0 == M_PI
//                    break;
//                case UIInterfaceOrientationLandscapeLeft:
//                    angle = (CGFloat)(M_PI*90.0)/180.0;
//                    break;
//                case UIInterfaceOrientationLandscapeRight:
//                    angle = (CGFloat)(M_PI*-90.0)/180.0;
//                    break;
//                default:
//                    return;
//            }
//            break;
//        }
//        case UIInterfaceOrientationLandscapeLeft:
//        {
//            switch ( g_orientation )
//            {
//                case UIInterfaceOrientationLandscapeRight:
//                    angle = (CGFloat)M_PI;  // 180.0*M_PI/180.0 == M_PI
//                    break;
//                case UIInterfaceOrientationPortraitUpsideDown:
//                    angle = (CGFloat)(M_PI*-90.0)/180.0;
//                    break;
//                case UIInterfaceOrientationPortrait:
//                    angle = (CGFloat)(M_PI*90.0)/180.0;
//                    break;
//                default:
//                    return;
//            }
//            break;
//        }
//        case UIInterfaceOrientationLandscapeRight:
//        {
//            switch ( g_orientation )
//            {
//                case UIInterfaceOrientationLandscapeLeft:
//                    angle = (CGFloat)M_PI;  // 180.0*M_PI/180.0 == M_PI
//                    break;
//                case UIInterfaceOrientationPortrait:
//                    angle = (CGFloat)(M_PI*-90.0)/180.0;
//                    break;
//                case UIInterfaceOrientationPortraitUpsideDown:
//                    angle = (CGFloat)(M_PI*90.0)/180.0;
//                    break;
//                default:
//                    return;
//            }
//            break;
//        }
//    }
//    
//    CGAffineTransform rotation = CGAffineTransformMakeRotation( angle );
//    
//    [UIView beginAnimations: @"" context: NULL];
//    [UIView setAnimationDuration: 0.4];
//    self.view.transform = CGAffineTransformConcat(self.view.transform, rotation);
//    [UIView commitAnimations];
//    
////    containerView.frame = self.view.frame;
//    
////    [self.videoSource adjustLayoutToInterfaceOrientation:current];
////    g_orientation = current;
//}

- (void) deviceOrientationDidChange
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    containerView.frame = self.view.frame;
    
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


//- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
//{
//    [super didRotateFromInterfaceOrientation: fromInterfaceOrientation];
//    [self.videoSource adjustLayoutToInterfaceOrientation:self.interfaceOrientation];
//}

//- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
//        toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
//    {
//        [containerView setFrame:CGRectMake(0, 0, kScreenBoundsWidth, kScreenBoundsHeight)];
//    }
//    else
//    {
//        [containerView setFrame:CGRectMake(0, 0, kScreenBoundsHeight, kScreenBoundsWidth)];
//    }
//}

//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id)coordinator {
//    
//    // before rotation
//    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
//    
//    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
//    [self.videoSource adjustLayoutToInterfaceOrientation:orientation];
//    
//    NSLog(@"UIInterfaceOrientationPortrait width %f : height %f", size.width, size.height);
//
//    [self.view setFrame:CGRectMake(0,0 , size.width, size.height)];
//    [containerView setFrame:self.view.bounds];
//
//    
////    [coordinator animateAlongsideTransition:^(id   _Nonnull context) {
////        
////        //containerView.frame = self.view.bounds;
////        // during rotation: update our image view's bounds and centrefl
////        
////        
////        
////        // do whatever
//////        typedef NS_ENUM(NSInteger, UIInterfaceOrientation) {
//////            UIInterfaceOrientationUnknown            = UIDeviceOrientationUnknown,
//////            UIInterfaceOrientationPortrait           = UIDeviceOrientationPortrait,
//////            UIInterfaceOrientationPortraitUpsideDown = UIDeviceOrientationPortraitUpsideDown,
//////            UIInterfaceOrientationLandscapeLeft      = UIDeviceOrientationLandscapeRight,
//////            UIInterfaceOrientationLandscapeRight     = UIDeviceOrientationLandscapeLeft
//////        } __TVOS_PROHIBITED;
////
////        //kScreenBoundsHeight
////        [self.view setFrame:CGRectMake(0,0 , size.width, size.height)];
////        [containerView setFrame:self.view.frame];
////        
////        
////        
////        
//////        CGRect fullRect = self.view.window.frame;
//////        CGRect viewRect = fullRect;
//////        
//////        if ([UIApplication sharedApplication].statusBarHidden) {
//////            // set frame to full screen.
//////            viewRect = fullRect;
//////        } else {
//////            // set view frame back
//////            UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
//////            if( orientation == UIInterfaceOrientationPortrait )
//////            {
//////                viewRect = CGRectMake(0, 0, fullRect.size.width, fullRect.size.height*2);
//////            } else if( orientation == UIInterfaceOrientationPortraitUpsideDown )
//////            {
//////                viewRect = CGRectMake(0, 0, fullRect.size.width, fullRect.size.height - 20);
//////            } else if( orientation == UIInterfaceOrientationLandscapeLeft )
//////            {
//////                viewRect = CGRectMake(0, 0, fullRect.size.width - 20, fullRect.size.height);
//////            } else if( orientation == UIInterfaceOrientationLandscapeRight )
//////            {
//////                viewRect = CGRectMake(0, 0, fullRect.size.width - 20, fullRect.size.height);
//////            }
//////        }
//////        
//////        [UIView animateWithDuration:[UIApplication sharedApplication].statusBarOrientationAnimationDuration animations:^{
//////            self.view.frame = viewRect;
//////            containerView.frame = viewRect;
//////            
////////            [self.view setNeedsLayout];
////////            [self.view layoutIfNeeded];
//////        }];
//////
////        
////        
////        
//////        NSLog(@"super view x:%f y:%f width:%f height:%f", self.view.window.frame.origin.x, self.view.window.frame.origin.y, self.view.window.frame.size.width, self.view.window.frame.size.height);
//////        
//////        CGFloat width = self.view.window.frame.size.width;
//////        CGFloat height =  self.view.window.frame.size.height;
//////        
//////        switch (orientation) {
//////            case UIInterfaceOrientationPortrait:
//////                NSLog(@"UIInterfaceOrientationPortrait %f : %f", width, height);
//////                //[containerView setFrame:CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, size.width, size.height)];
//////                [containerView setFrame:CGRectMake(0, 0, width, height)];
//////                break;
//////            case UIInterfaceOrientationPortraitUpsideDown:
//////                NSLog(@"UIInterfaceOrientationPortraitUpsideDown %f : %f", width, height);
//////                [containerView setBounds:CGRectMake(0, 0, width, height)];
//////                break;
//////            case UIInterfaceOrientationLandscapeLeft:
//////                NSLog(@"UIInterfaceOrientationLandscapeLeft %f : %f", width, height);
//////                [containerView setBounds:CGRectMake(0, 0, height, width)];
//////                break;
//////            case UIInterfaceOrientationLandscapeRight:
//////                NSLog(@"UIInterfaceOrientationLandscapeRight %f : %f", width, height);
//////                [containerView setBounds:CGRectMake(0, 0, height, width)];
//////                break;
//////                
//////            default:
//////                break;
//////        }
//////       
//////        [self.view setNeedsLayout];
//////        [self.view layoutIfNeeded];
////        
////        r
////        
////    } completion:^(id  _Nonnull context) {
////        
////        // after rotation
////    }];
//}

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
    cv::Size resize_size = [self get_resize_size];
    cv::Size cmt_resize_size = [self get_resize_size];
    cv::Size display_size = [self get_display_resize_size];
    //get use algorithm
    NSInteger luseKeypoints, luseLearning;
    [self get_use_algorithim:luseKeypoints useLearning:luseLearning];
    //NSLog(@"luseKeypoints:%ld == luseLearning:%ld", luseKeypoints, luseLearning);

    resize(image, dst, cv::Size(480,240));
    resize(image, tldDst, cv::Size(resize_size.width,resize_size.height));
    resize(image, image, cv::Size(display_size.width, display_size.height));
    cmt_resize_size.width = 480;
    cmt_resize_size.height = 240;
    
    
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
                cv::Point2f initTopLeft(rTemp.x, rTemp.y);
                cv::Point2f initBottomDown(rTemp.x+rTemp.width,rTemp.y+rTemp.height);
                main->cmt_tracking = cmt.initialise(cmt_im_gray, initTopLeft, initBottomDown);
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
            
            cv::rectangle(image, topleft, bottomRight, rectangleColor);
        
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
            
            cv::line(image,topleft,topright,Scalar(255,255,255),1);
            cv::line(image,topright,bottomright,Scalar(255,255,255),1);
            cv::line(image,bottomright,bottomleft,Scalar(255,255,255),1);
            cv::line(image,bottomleft,topleft,Scalar(255,255,255),1);

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
    start_p = [touch locationInView:self.containerView];
    
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
    CGPoint p = [touch locationInView:self.containerView];

    CGRect drawnFrame = backView.frame;
    drawnFrame.size.width = std::abs(start_p.x - p.x);
    drawnFrame.size.height = std::abs(start_p.y - p.y);
    backView.frame = drawnFrame;
    
    //cv::rectangle(currentImg,cvPoint(start_p.x, start_p.y), cvPoint(p.x, p.y), CV_RGB(255, 0, 0));
  
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event // (2)
{
    UITouch *touch = [touches anyObject];
    start_p = [touch locationInView:self.containerView];
    //[self.videoSource start];
    isObjectSelected = 1;
    firstStep = 1;
    [backView setHidden:TRUE];
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
        [backView setHidden:FALSE];
        
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
