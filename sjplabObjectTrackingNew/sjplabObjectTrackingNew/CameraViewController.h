//
//  CameraViewController.h
//  sjplabObjectTrackingNew
//
//  Created by gclee on 2017. 3. 23..
//  Copyright © 2017년 SJPlab. All rights reserved.
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

@interface CameraViewController : UIViewController

-(void)setROI;
-(void)setObjectTracking:(NSInteger)isDo;
-(void)setVideoType:(NSInteger)type;

@end
