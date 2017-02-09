//
//  MenuViewController.h
//  sjplab
//
//  Created by gclee on 2016. 3. 30..
//  Copyright © 2016년 sjplab. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuViewControllerDelegate;

@interface MenuViewController : UIViewController

@property (nonatomic, weak) id<MenuViewControllerDelegate> delegate;

- (void)setParentScreenShot:(UIImage *)aScreenShot;

@end

@protocol MenuViewControllerDelegate <NSObject>
@optional
//- (void)didTouchBackButton;
//- (void)didTouchMainAD;
@end
