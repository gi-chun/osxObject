//
//  main_header.h
//  sjplabObject
//
//  Created by gclee on 2016. 10. 13..
//  Copyright © 2016년 sjplab. All rights reserved.
//

#ifndef main_header_h
#define main_header_h

//local noti
static NSString * showMenuViewNotification = @"showMenuViewNotification";
static NSString * showCommonAlertViewNotification = @"showCommonAlertViewNotification";
static NSString * showLoadingViewNotification = @"showLoadingViewNotification";
static NSString * showBackgroudViewNotification = @"showBackgroudViewNotification";
static NSString * showIntroViewNotification = @"showIntroViewNotification";

static NSString * showQuickButtonNotification = @"showQuickButtonNotification";
static NSString * showVisionButtonNotification = @"showVisionButtonNotification";

//local register
static NSString * const cfirstAppExe       = @"cfirstAppExe";

static NSString * const cIsLogin       = @"cIsLogin";
static NSString * const cMail       = @"cMail";
static NSString * const cPwd       = @"cPwd";

static NSString * const cdisplay_optionNo       = @"cdisplay_optionNo";
static NSString * const cprocessing_optionNo       = @"cprocessing_optionNo";
static NSString * const cinputType_optionNo       = @"cinputType_optionNo";
static NSString * const corgFPS_optionNo       = @"corgFPS_optionNo";
static NSString * const ctrackingALG_keyPoints       = @"ctrackingALG_keyPoints";
static NSString * const ctrackingALG_learning       = @"ctrackingALG_learning";

typedef NS_ENUM(NSInteger, CommonShowedFlag) {
    commonHide = 0,
    commonShow
};


#endif /* main_header_h */
