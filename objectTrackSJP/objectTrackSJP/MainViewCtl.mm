//
//  LeftMenuViewCtl.m
//  objectTrackSJP
//
//  Created by gclee on 2016. 8. 18..
//  Copyright © 2016년 SJPlap. All rights reserved.
//

#include <iostream>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/core/core.hpp"

#import "MainViewCtl.h"

@interface MainViewCtl ()

@end

@implementation MainViewCtl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    
//    NSTextField *updateTimeLabel = [[NSTextField alloc] initWithFrame:CGRectMake(84, 152, 76, 26)];
//    [updateTimeLabel setBackgroundColor:[NSColor redColor]];
//    [updateTimeLabel setFont:[NSFont fontWithName:@"Helvetica-Bold" size:13]];
////    [updateTimeLabel setValue:@"test test test" forKey:@"test"];
//    [updateTimeLabel setStringValue:@"test test gclee"];
//    [self.view addSubview:updateTimeLabel];
    
    
    cv::VideoCapture cap(0);
    
    while (true){
        
        cv::Mat Webcam;
        cap.read(Webcam);
        cv::imshow("objectTrackSJP", Webcam);
    }

    
}

- (void)viewWillDisappear {
    
}

@end
