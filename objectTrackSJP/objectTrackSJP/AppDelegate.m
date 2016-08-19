//
//  AppDelegate.m
//  objectTrackSJP
//
//  Created by gclee on 2016. 8. 17..
//  Copyright © 2016년 SJPlap. All rights reserved.
//

#ifdef __cplusplus
#include <iostream>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/core/core.hpp"

using namespace cv;
#endif

#import "AppDelegate.h"
#import "MainViewCtl.h"
#import "TopViewCtl.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (nonatomic,strong) IBOutlet TopViewCtl *topViewCtl;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    
//    self.masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil];
//    
//    // 2. Add the view controller to the Window's content view
//    [self.window.contentView addSubview:self.masterViewController.view];
//    self.masterViewController.view.frame = ((NSView*)self.window.contentView).bounds;
    
//    MainViewCtl *mainViewCnr = [[MainViewCtl alloc] init];
//    self.window
//    [self.window.contentView addSubview:mainViewCnr.view];
//    mainViewCnr.view.frame = ((NSView*)self.window.contentView).bounds;
    
    
    // 1. Create the master View Controller
    self.topViewCtl = [[TopViewCtl alloc] initWithNibName:@"TopViewCtl" bundle:nil];
    
    // 2. Add the view controller to the Window's content view
    [self.window.contentView addSubview:self.topViewCtl.view];
    self.topViewCtl.view.frame = ((NSView*)self.window.contentView).bounds;
    
    
    

    
    
    // Insert code here to initialize your application
    
//    VideoCapture cap(0);
//    
//    while (true){
//        
//        cv::Mat Webcam;
//        cv::cap.read(Webcam);
//        cv::imshow("Webcam", Webcam);
//    }

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
