//
//  ViewController.h
//  sjplabObjectTrackingNew
//
//  Created by gclee on 2017. 3. 20..
//  Copyright © 2017년 SJPlab. All rights reserved.
//

//@import Foundation;
//@import AVFoundation;


#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//@class AVPlayer;
#import "AAPlPlayerView.h"

@interface ViewController : UIViewController

@property AVPlayer *player;
@property AVPlayerLayer* in_playerLayer;

@end

