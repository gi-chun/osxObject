//
//  ViewController.h
//  sjplab
//
//  Created by gclee on 2016. 2. 26..
//  Copyright © 2016년 sjplab. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllerDelegate;

@interface ViewController : UIViewController

@property (nonatomic, weak) id<ViewControllerDelegate> delegate;

-(void)showVideoControll:(NSInteger)boolParam;
-(void)setROI;
-(void)setObjectTracking:(NSInteger)isDo;
-(void)setVideoType:(NSInteger)type;
-(void)showSettingControll:(NSInteger)boolParam;

@end

@protocol ViewControllerDelegate <NSObject>
@optional
- (void)showMainButton:(NSInteger)show;
- (void)hideMainButton:(NSInteger)hide;
@end
