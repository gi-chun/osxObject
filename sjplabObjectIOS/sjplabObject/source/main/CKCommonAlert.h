//
//  CKCommonAlert.h
//  sjplab
//
//  Created by gclee on 2016. 3. 31..
//  Copyright © 2016년 sjplab. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CKCommonAlertDelegate;

@interface CKCommonAlert : UIView

@property (nonatomic, weak) id<CKCommonAlertDelegate> delegate;

- (id)initWithFrame:(CGRect)frame;
//- (void)releaseItem;
//- (id)initWithFrame:(CGRect)frame title:(NSString *)aTitle linkUrl:(NSString *)aLinkUrl;
//- (void)openUrl:(NSString *)url;
//- (void)stopLoading;
//- (void)setScrollTop;
//- (void)setScrollEnabled:(BOOL)isEnable;
//- (void)setShowsHorizontalScrollIndicator:(BOOL)isShow;
//- (void)setShowsVerticalScrollIndicator:(BOOL)isShow;

@end

@protocol CKCommonAlertDelegate <NSObject>
@optional
- (void)touchAlertDissmisView;
//- (void)productExchangeView:(CPCommonLayerPopupView *)view isLoading:(NSNumber *)loading;
//- (void)productExchangeView:(CPCommonLayerPopupView *)view scrollViewDidScroll:(UIScrollView *)scrollView;
@end