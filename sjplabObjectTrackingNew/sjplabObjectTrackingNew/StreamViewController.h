//
//  StreamViewController.h
//  sjplabObjectTrackingNew
//
//  Created by gclee on 2017. 3. 23..
//  Copyright © 2017년 SJPlab. All rights reserved.
//


#include <OpenGLES/ES2/glext.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

using namespace cv;

@interface StreamViewController : UIViewController

@property (readonly) AVPlayer *player;
//@property AVPlayer *player;
@property AVURLAsset *asset;

@end
