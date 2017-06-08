//
//  VideoViewController.h
//  sjplabObject
//
//  Created by gclee on 2016. 10. 10..
//  Copyright © 2016년 sjplab. All rights reserved.
//
#ifdef __cplusplus
//#import <opencv2/highgui/cap_ios.h>
#import <opencv2/videoio/cap_ios.h>
#endif

#ifdef __OBJC__
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#endif

using namespace cv;

@interface VideoViewController : UIViewController

-(void)setROI;
-(void)setObjectTracking:(NSInteger)isDo;
-(void)setVideoType:(NSInteger)type;

@end
