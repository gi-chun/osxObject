//
//  AppDelegate.m
//  sjplab
//
//  Created by gclee on 2016. 2. 26..
//  Copyright © 2016년 sjplab. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "UIImage+ImageWithColor.h"
#import "VCFloatingActionButton.h"
#import "CKMenuView.h"
#import "CKCommonAlert.h"
#import "CKLoadingView.h"
#import "CKBackgroudView.h"
#import "CKIntroView.h"
#import "VideoViewController.h"
#import "main_header.h"

@interface AppDelegate ()<CKMenuViewDelegate,
                        CKCommonAlertDelegate,
                        CKLoadingViewDelegate,
                        CKIntroViewDelegate,
                        ViewControllerDelegate>
{
    UIView *shadow;
    UIButton *btnCompose;
    VCFloatingActionButton *addButton;
    CKMenuView *menuView;
    CKCommonAlert *commonAlertView;
    CKLoadingView *loadingView;
    CKBackgroudView *backgroudView;
    CKIntroView *introView;
    NSInteger isShowedMenuView;
    NSInteger isShowedAlertView;
    NSInteger isShowedLoadingView;
    NSInteger isShowedBackgroudView;
    NSInteger isShowedIntroView;
    
    ViewController *mainViewCnr;
    VCFloatingActionButton *startTrackingButton;
    VCFloatingActionButton *settingROIButton;
    VCFloatingActionButton *homeButton;
    VCFloatingActionButton *inputTypeButton;
    VCFloatingActionButton *camInnerTypeButton;
    
    NSInteger isTracking; //0: no 1: yes
    NSInteger currentCamType;
    
    
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //gclee
    isTracking = 0;
    currentCamType = 0;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
    
    mainViewCnr = [[ViewController alloc] init];
    mainViewCnr.delegate = (id)self;
    
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:mainViewCnr];
    
    //    _navigation = [[UINavigationController alloc] initWithRootViewController:mainViewCnr];
    //    [_navigation setNavigationBarHidden:YES];
    //
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    //self.window.rootViewController = mainViewCnr;
    
    //set status bar
    //[application setStatusBarHidden:NO];
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    //set status bar end
    
//    // set navigaton ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Uncomment to change the background color of navigation bar
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGBA(0x000000, 1.0)]; //0x067AB5 , 0xcccccc, 0x000000 //UIColorFromRGBA(0x000000, 1.0)
    // Uncomment to change the color of back button
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setBackgroundColor:UIColorFromRGBA(0x000000, 1.0)];
    // Uncomment to assign a custom backgroung image
    //[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg_ios7.png"] forBarMetrics:UIBarMetricsDefault];
    // Uncomment to change the back indicator image
    //[[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back_btn.png"]];
    //[[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_btn.png"]];
    
    // Uncomment to change the font style of the title
//    NSShadow *shadow = [[NSShadow alloc] init];
//    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
//    shadow.shadowOffset = CGSizeMake(0, 1);
//    
//    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
//                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
//                                                           shadow, NSShadowAttributeName,
//                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
//    
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           nil, nil,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
    
//    // set navigation end ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //set default config
    if(![[NSUserDefaults standardUserDefaults] integerForKey:cfirstAppExe]){
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:cfirstAppExe];
        
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:cIsLogin];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:cMail];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:cPwd];
        [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:cdisplay_optionNo]; // 1280*720
        [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:cprocessing_optionNo]; // 640*380
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:ctrackingALG_keyPoints]; // 1: 사용
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:ctrackingALG_learning]; // 1: 사용
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:cinputType_optionNo]; // cam front
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:corgFPS_optionNo]; // 15
        
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    //end set default config
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    CGRect floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 44 - 20, [UIScreen mainScreen].bounds.size.height - 44 - 20, 44, 44);
    addButton = [[VCFloatingActionButton alloc]initWithFrame:floatFrame normalImage:[UIImage imageNamed:@"plus"] andPressedImage:[UIImage imageNamed:@"cross"] withScrollview:nil];
    
//    addButton.imageArray = @[@"fb-icon",@"twitter-icon",@"google-icon",@"linkedin-icon",@"google-icon",@"linkedin-icon"];
//    addButton.labelArray = @[@"ObjectTracking",@"Start",@"Stop",@"Setting", @"My Infor", @"Home"];
    
    addButton.imageArray = @[@"fb-icon"];
    addButton.labelArray = @[@"ObjectTracking"];

    
    addButton.hideWhileScrolling = YES;
    addButton.delegate = (id)self;
    
    //[self.view addSubview:addButton];
    [self.window addSubview:addButton];
    
    //[addButton setHidden:true];
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    CGSize btnImgSize = CGSizeMake(44, 44);
    CGFloat xMargin = 10.5;
    //startTrackingButton
    floatFrame = CGRectMake(xMargin, ([UIScreen mainScreen].bounds.size.height - btnImgSize.height/2)/2, btnImgSize.width, btnImgSize.height);
    startTrackingButton = [[VCFloatingActionButton alloc]initWithFrame:floatFrame normalImage:[UIImage imageNamed:@"plus"] andPressedImage:[UIImage imageNamed:@"cross"] withScrollview:nil];
    startTrackingButton.hideWhileScrolling = YES;
    startTrackingButton.hideBgView = YES;
    startTrackingButton.delegate = (id)self;
    [self.window addSubview:startTrackingButton];
    [startTrackingButton setHidden:true];
    startTrackingButton.kind = 0;
    
    //settingROIButton
//    floatFrame = CGRectMake(xMargin, CGRectGetMaxY(floatFrame)+10, btnImgSize.width, btnImgSize.height);
//    settingROIButton = [[VCFloatingActionButton alloc]initWithFrame:floatFrame normalImage:[UIImage imageNamed:@"plus"] andPressedImage:[UIImage imageNamed:@"cross"] withScrollview:nil];
//    settingROIButton.hideWhileScrolling = YES;
//    settingROIButton.hideBgView = YES;
//    settingROIButton.delegate = (id)self;
//    [self.window addSubview:settingROIButton];
//    [settingROIButton setHidden:true];
//    settingROIButton.kind = 1;
    
    //homeButton
    floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - btnImgSize.width - xMargin, xMargin, btnImgSize.width, btnImgSize.height);
    homeButton = [[VCFloatingActionButton alloc]initWithFrame:floatFrame normalImage:[UIImage imageNamed:@"plus"] andPressedImage:[UIImage imageNamed:@"cross"] withScrollview:nil];
    homeButton.hideWhileScrolling = YES;
    homeButton.hideBgView = YES;
    homeButton.delegate = (id)self;
    [self.window addSubview:homeButton];
    [homeButton setHidden:true];
    homeButton.kind = 2;
    
    //inputTypeButton
    floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - btnImgSize.width - xMargin, [UIScreen mainScreen].bounds.size.height - btnImgSize.height - xMargin, btnImgSize.width, btnImgSize.height);
    inputTypeButton = [[VCFloatingActionButton alloc]initWithFrame:floatFrame normalImage:[UIImage imageNamed:@"plus"] andPressedImage:[UIImage imageNamed:@"cross"] withScrollview:nil];
//    inputTypeButton.imageArray = @[@"fb-icon",@"twitter-icon",@"google-icon"];
//    inputTypeButton.labelArray = @[@"out cam",@"inner cam",@"wifi"];
    inputTypeButton.hideWhileScrolling = YES;
    inputTypeButton.delegate = (id)self;
    [self.window addSubview:inputTypeButton];
    [inputTypeButton setHidden:true];
    inputTypeButton.kind = 3;
    [inputTypeButton setHideBgView:1];
    
//    //camInnerTypeButton
//    floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - btnImgSize.width - xMargin, CGRectGetMinY(floatFrame) - btnImgSize.height - xMargin, btnImgSize.width, btnImgSize.height);
//    camInnerTypeButton = [[VCFloatingActionButton alloc]initWithFrame:floatFrame normalImage:[UIImage imageNamed:@"plus"] andPressedImage:[UIImage imageNamed:@"cross"] withScrollview:nil];
//    camInnerTypeButton.hideWhileScrolling = YES;
//    camInnerTypeButton.delegate = (id)self;
//    [self.window addSubview:camInnerTypeButton];
//    [camInnerTypeButton setHidden:true];
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // nemu vew
//    menuView = [[CKMenuView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    menuView.delegate = self;
//    
//    [self.window addSubview:menuView];
//    [menuView setHidden:false];
//    isShowedMenuView = 0;
    
    isShowedMenuView = commonHide;
    isShowedAlertView = commonHide;
    isShowedLoadingView = commonHide;
    isShowedBackgroudView = commonShow;
    isShowedIntroView = commonHide;
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showMenuView:)
                                                 name:showMenuViewNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideAlertView:)
                                                 name:showCommonAlertViewNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideLoadingView:)
                                                 name:showLoadingViewNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideBackgroudView:)
                                                 name:showBackgroudViewNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideIntroView:)
                                                 name:showIntroViewNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showQuickButton:)
                                                 name:showQuickButtonNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showVisionkButton:)
                                                 name:showVisionButtonNotification
                                               object:nil];
    
    //show Intro
    [[NSNotificationCenter defaultCenter] postNotificationName:showIntroViewNotification object:self];

    
    
    //create application main window - subview - global view
    
//    UIView* roundedView = [[UIView alloc] initWithFrame: CGRectMake(kScreenBoundsWidth-50, kScreenBoundsHeight-50, 50, 50)];
//    roundedView.layer.cornerRadius = 5.0;
//    roundedView.layer.masksToBounds = YES;
//    
//    UIView* shadowView = [[UIView alloc] initWithFrame: CGRectMake(kScreenBoundsWidth-50, kScreenBoundsHeight-50, 50, 50)];
//    shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
//    shadowView.layer.shadowRadius = 5.0;
//    shadowView.layer.shadowOffset = CGSizeMake(3.0, 3.0);
//    shadowView.layer.shadowOpacity = 1.0;
//    [shadowView addSubview: roundedView];
//    
//    //[[[UIApplication sharedApplication] keyWindow] addSubview:shadowView];
//    [self.window addSubview:shadowView];
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
//    shadow = [[UIView alloc]init];
//    shadow.layer.cornerRadius = 5.0;
//    shadow.layer.shadowColor = [[UIColor redColor] CGColor];
//    shadow.layer.shadowOpacity = 1.0;
//    shadow.layer.shadowRadius = 10.0;
//    shadow.layer.shadowOffset = CGSizeMake(0.0f, -0.5f);
//    
//    btnCompose = [[UIButton alloc]initWithFrame:CGRectMake(kScreenBoundsWidth-80, kScreenBoundsHeight-80, 80, 80)];
//    [btnCompose setUserInteractionEnabled:YES];
//    btnCompose.layer.cornerRadius = 30;
//    btnCompose.layer.masksToBounds = YES;
//    [btnCompose setImage:[UIImage imageNamed:@"location_icon"] forState:UIControlStateNormal];
//    [btnCompose setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x000000)] forState:UIControlStateHighlighted];
//    
//    [btnCompose addTarget:self action:@selector(btnCompose_click:) forControlEvents:UIControlEventTouchUpInside];
//    [shadow addSubview:btnCompose];
//    [self.window addSubview:shadow];
//    
//    UIButton *btnEmpty = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btnEmpty setFrame:CGRectMake(kScreenBoundsWidth-80, kScreenBoundsHeight-80, 80, 80)];
//    [btnEmpty setBackgroundColor:[UIColor clearColor]];
//    [btnEmpty addTarget:self action:@selector(btnCompose_click:) forControlEvents:UIControlEventTouchUpInside];
//    [self.window addSubview:btnEmpty];
    
    //[shadow setHidden:true];
    
//    UIButton *bannerImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [bannerImageButton setFrame:bannerImageView.frame];
//    [bannerImageButton setBackgroundColor:[UIColor clearColor]];
//    [bannerImageButton setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x000000)] forState:UIControlStateHighlighted];
//    [bannerImageButton addTarget:self action:@selector(touchBannerButton) forControlEvents:UIControlEventTouchUpInside];
//    [bannerImageButton setAlpha:0.3];
//    [containerView addSubview:bannerImageButton];
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////

    
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:showBackgroudViewNotification object:self];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Selectors

- (void)btnCompose_click:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"알림"
                                                    message:@"설정 > 개인 정보 보호 > 연락처 정보를 활성화 해주세요."
                                                   delegate:self
                                          cancelButtonTitle:NSLocalizedString(@"Confirm", nil)
                                          otherButtonTitles:nil];
    [alert setDelegate:self];
    [alert show];
    
    NSLog(@"친구 등록 실패: 권한이 없음");

}

#pragma mark - table
-(void) didSelectMenuOptionAtIndex:(NSInteger)kind : (NSInteger)row
{
    NSLog(@"Floating action tapped kind %tu index %tu",kind, row);
    
    //gclee temp
    if(kind == 0){
        [mainViewCnr showVideoControll:1];
        [self showQuickButton:1];
        [self showVisionButton:0];
        
    }
    
    if(kind == 3){
        
        if(currentCamType != row){
            [mainViewCnr setVideoType:row];
            currentCamType = row;
        }
    }
    
}

-(void) didSelectMainView:(NSInteger)kind
{
    NSLog(@"Floating action tapped Main View %tu",kind);
    
    switch (kind) {
        case 0: //tracking
            (isTracking == 0)?isTracking=1:isTracking=0;
            [mainViewCnr setObjectTracking:isTracking];
            if(isTracking){
                //[homeButton setHidden:FALSE];
                [homeButton setHideChildView:1];
            }
            break;
        case 1: //set ROI (un used)
            [mainViewCnr setROI];
            break;
        case 2: //go to home
            [mainViewCnr showVideoControll:0];
            
            [startTrackingButton setHidden:TRUE];
            //[settingROIButton setHidden:TRUE];
            [homeButton setHidden:TRUE];
            [homeButton setHideChildView:0];
            [inputTypeButton setHidden:TRUE];
            [inputTypeButton setHideChildView:0];
            
            [addButton setHidden:FALSE];

            break;
        case 3: //go to setting
            [mainViewCnr showVideoControll:0];
            [mainViewCnr showSettingControll:1];
            
            [startTrackingButton setHidden:TRUE];
            [homeButton setHidden:TRUE];
            [homeButton setHideChildView:0];
            [inputTypeButton setHidden:TRUE];
            [inputTypeButton setHideChildView:0];
            
            [addButton setHidden:TRUE];

            break;
            
        default:
            break;
    }
    if(kind == 2){
        
    }
}

#pragma mark - public
-(void) showQuickButton:(NSInteger)isShow
{
    NSLog(@"show quick button %tu",isShow);
    if(isShow == 1){
        [addButton setHidden:true];
    }else{
        [addButton setHidden:false];
    }
}

-(void) showVisionButton:(NSInteger)isShow
{
    NSLog(@"show vision button %tu",isShow);
    if(isShow == 1){
        [startTrackingButton setHidden:true];
        //[settingROIButton setHidden:true];
        [homeButton setHidden:true];
        [inputTypeButton setHidden:true];
        //[camInnerTypeButton setHidden:true];
    }else{
        [startTrackingButton setHidden:false];
        //[settingROIButton setHidden:false];
        [homeButton setHidden:false];
        [inputTypeButton setHidden:false];
        //[camInnerTypeButton setHidden:false];
    }
}


-(void) showMenuView:(NSInteger)isShow
{
    NSLog(@"show Menu view %tu",isShow);
    
    if(isShowedMenuView){
        isShowedMenuView = commonHide;
        
//        CGRect initalFrame = CGRectMake(0, 0, 0, menuView.frame.size.height);
//        initalFrame.origin.x = -initalFrame.size.width;
//        menuView.frame = initalFrame;
//        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveFromLeftOrRight:) userInfo:@1 repeats:NO];
        
//        CGRect frame = menuView.frame ;
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:5.0];
//        [UIView setAnimationDelay:0];
//        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//        menuView.frame = CGRectMake(frame.origin.x - 2*frame.size.width,menuView.frame.origin.y, menuView.frame.size.width, menuView.frame.size.height);
//        [UIView commitAnimations];
        
        [UIView animateWithDuration:0.4f
                         animations:^ {
                             CGRect frame = menuView.frame;
                             
// left to right
                             frame.origin.x = 0;
                             menuView.frame = frame;
                             menuView.frame = CGRectMake(frame.origin.x + 2*frame.size.width,frame.origin.y, frame.size.width, frame.size.height);
// right to left
//                             frame.origin.x = 0;
//                             menuView.frame = frame;
//                             menuView.frame = CGRectMake(frame.origin.x - 2*frame.size.width,frame.origin.y, frame.size.width, frame.size.height);
// top to buttom
//                             frame.origin.y = 0;
//                             menuView.frame = frame;
//                             menuView.frame = CGRectMake(frame.origin.x , frame.origin.y + 2*frame.size.height, frame.size.width, frame.size.height);
// buttom to top
//                             frame.origin.y = 0;
//                             menuView.frame = frame;
//                             menuView.frame = CGRectMake(frame.origin.x , frame.origin.y - 2*frame.size.height, frame.size.width, frame.size.height);
       
                             menuView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
                         }
                         completion:^(BOOL finished) {
                                
                             [UIView beginAnimations:nil context:nil];
                             [UIView setAnimationDuration:5.3];
                             [UIView commitAnimations];
                             
                             //        [menuView setHidden:true];
                             if (menuView) {
                                 for (UIView *subView in [menuView subviews]) {
                                     [subView removeFromSuperview];
                                 }
                                 
                                 [menuView removeFromSuperview];
                                 menuView = nil;
                             }

                         }];

        
        
    }
    else{// 0
        isShowedMenuView = commonShow;
//        menuView = [[CKMenuView alloc]initWithFrame:CGRectMake(0,0,0,kScreenBoundsHeight)];
        menuView = [[CKMenuView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        menuView.delegate = self;
        [self.window addSubview:menuView];
//        [menuView setHidden:false];
        
        CGRect initalFrame = menuView.frame;
        initalFrame.origin.x = initalFrame.size.width;
        menuView.frame = initalFrame;
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveFromLeftOrRight:) userInfo:@0 repeats:NO];
    }
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /*
    
    -(IBAction)rightClicked:(id)sender {
        CGRect initalFrame = self.baseView.frame;
        initalFrame.origin.x = initalFrame.size.width;
        self.baseView.frame = initalFrame;
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveFromLeftOrRight:) userInfo:@0 repeats:NO];
    }
    
    -(IBAction)leftClicked:(id)sender {
        CGRect initalFrame = self.baseView.frame;
        initalFrame.origin.x = -initalFrame.size.width;
        self.baseView.frame = initalFrame;
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveFromLeftOrRight:) userInfo:@1 repeats:NO];
    }
    
    -(void)moveFromLeftOrRight:(NSTimer *) timer {
        BOOL isLeft = [timer.userInfo boolValue];
        CGFloat bounceDistance = 10;
        CGFloat bounceDuration = 0.2;
        [UIView animateWithDuration:.2 delay:0.0 options:UIViewAnimationOptionAllowAnimatedContent
                         animations:^{
                             CGFloat direction = (isLeft ? 1 : -1);
                             self.baseView.center = CGPointMake(self.baseView.frame.size.width/2 + direction*bounceDistance, self.baseView.center.y);}
                         completion:^(BOOL finished){
                             [UIView animateWithDuration:bounceDuration animations:^{
                                 self.baseView.center = CGPointMake(self.baseView.frame.size.width/2, self.baseView.center.y);
                             }];
                         }];
    }

    
    */
    
    
    
}

-(void) hideIntroView:(NSInteger)isShow
{
    NSLog(@"show Intro view %tu",isShow);
    
    if(isShowedIntroView){
        isShowedIntroView = commonHide;
        
        if (introView) {
            for (UIView *subView in [introView subviews]) {
                [subView removeFromSuperview];
            }
            [introView removeFromSuperview];
            introView = nil;
        }
        
    }
    else{// 0
        isShowedIntroView = commonShow;
        introView = [[CKIntroView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        introView.delegate = self;
        [self.window addSubview:introView];
    }
}

-(void) hideBackgroudView:(NSInteger)isShow
{
    NSLog(@"show Backgroud view %tu",isShow);
    
    if(isShowedBackgroudView){
        isShowedBackgroudView = commonHide;
        
        if (backgroudView) {
            for (UIView *subView in [backgroudView subviews]) {
                [subView removeFromSuperview];
            }
            [backgroudView removeFromSuperview];
            backgroudView = nil;
        }
        
    }
    else{// 0
        isShowedBackgroudView = commonShow;
        backgroudView = [[CKBackgroudView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        backgroudView.delegate = (id)self;
        [self.window addSubview:backgroudView];
    }
}

-(void) hideLoadingView:(NSInteger)isShow
{
    NSLog(@"show Loding view %tu",isShow);
    
    if(isShowedLoadingView){
        isShowedLoadingView = commonHide;
        [loadingView stopAnimation];
        
        if (loadingView) {
            for (UIView *subView in [loadingView subviews]) {
                [subView removeFromSuperview];
            }
            [loadingView removeFromSuperview];
            loadingView = nil;
        }
        
    }else{// 0
        isShowedLoadingView = commonShow;
        
        loadingView = [[CKLoadingView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        loadingView.delegate = self;
        [self.window addSubview:loadingView];
        
        [loadingView startAnimation];
    }
}


-(void) hideAlertView:(NSInteger)isShow
{
    NSLog(@"show common Alert view %tu",isShow);
    
    if(isShowedAlertView){
        isShowedAlertView = commonHide;
       
//        [UIView animateWithDuration:0.4f
//                         animations:^ {
//                             CGRect frame = commonAlertView.frame;
//                             // left to right
//                             frame.origin.x = 0;
//                             commonAlertView.frame = frame;
//                             commonAlertView.frame = CGRectMake(frame.origin.x + 2*frame.size.width,frame.origin.y, frame.size.width, frame.size.height);
//                             commonAlertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
//                         }
//                         completion:^(BOOL finished) {
//                             
//                             [UIView beginAnimations:nil context:nil];
//                             [UIView setAnimationDuration:5.3];
//                             [UIView commitAnimations];
//                             
//                             //        [menuView setHidden:true];
//                             if (commonAlertView) {
//                                 for (UIView *subView in [commonAlertView subviews]) {
//                                     [subView removeFromSuperview];
//                                 }
//                                 
//                                 [commonAlertView removeFromSuperview];
//                                 commonAlertView = nil;
//                             }
//                             
//                         }];
        
        if (commonAlertView) {
            for (UIView *subView in [commonAlertView subviews]) {
                [subView removeFromSuperview];
            }
            
            [commonAlertView removeFromSuperview];
            commonAlertView = nil;
        }
        
    }
    else{// 0
        isShowedAlertView = commonShow;
        commonAlertView = [[CKCommonAlert alloc]initWithFrame:[UIScreen mainScreen].bounds];
        commonAlertView.delegate = self;
        [self.window addSubview:commonAlertView];
        
//        CGRect initalFrame = commonAlertView.frame;
//        initalFrame.origin.x = initalFrame.size.width;
//        commonAlertView.frame = initalFrame;
//        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveCommonAlert:) userInfo:@0 repeats:NO];
    }
}

#pragma mark - Intro Delegate Method

- (void)touchIntroDissmisView
{
    [self hideIntroView:0];
}

#pragma mark - Loading Delegate Method

- (void)touchLoadingDissmisView
{
    [self hideLoadingView:0];
}

#pragma mark - CommonAlert Delegate Method

- (void)touchAlertDissmisView
{
    [self hideAlertView:0];
}

#pragma mark - MenuView Delegate Method

- (void)touchDissmisView
{
    [self showMenuView:0];
}

-(void)moveFromLeftOrRight:(NSTimer *) timer {
    BOOL isLeft = [timer.userInfo boolValue];
    CGFloat bounceDistance = 0; //10
    CGFloat bounceDuration = 0.2;
    [UIView animateWithDuration:.2 delay:0.0 options:UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         //0:to left
                         //1:to right
                         //2:to top
                         //3:to buttom
                         CGFloat direction = (isLeft ? 1 : -1);
                         menuView.center = CGPointMake(menuView.frame.size.width/2 + direction*bounceDistance, menuView.center.y);}
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:bounceDuration animations:^{
                             menuView.center = CGPointMake(menuView.frame.size.width/2, menuView.center.y);
                         }];
                         
                     }];
}

-(void)moveCommonAlert:(NSTimer *) timer {
    BOOL isLeft = [timer.userInfo boolValue];
    CGFloat bounceDistance = 0; //10
    CGFloat bounceDuration = 0.2;
    [UIView animateWithDuration:.2 delay:0.0 options:UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         //0:to left
                         //1:to right
                         //2:to top
                         //3:to buttom
                         CGFloat direction = (isLeft ? 1 : -1);
                         commonAlertView.center = CGPointMake(commonAlertView.frame.size.width/2 + direction*bounceDistance, commonAlertView.center.y);}
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:bounceDuration animations:^{
                             commonAlertView.center = CGPointMake(commonAlertView.frame.size.width/2, commonAlertView.center.y);
                         }];
                         
                     }];
}

#pragma mark - ViewController Delegate Method

- (void)showMainButton:(NSInteger)show
{
    if(show){
        [addButton setHidden:FALSE];
        
        [startTrackingButton setHidden:TRUE];
        [homeButton setHidden:TRUE];
        [inputTypeButton setHidden:TRUE];
        
    }else{
        [addButton setHidden:TRUE];
        
        [startTrackingButton setHidden:FALSE];
        [homeButton setHidden:FALSE];
        [inputTypeButton setHidden:FALSE];
        [inputTypeButton setHideChildView:1];
    }
}

- (void)hideMainButton:(NSInteger)hide
{
    if(hide){
        [addButton setHidden:TRUE];
        
    }else{
        [addButton setHidden:FALSE];
    }
}




@end
