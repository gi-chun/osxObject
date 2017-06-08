//
//  ViewController.m
//  sjplab
//
//  Created by gclee on 2016. 2. 26..
//  Copyright © 2016년 sjplab. All rights reserved.
//

#import "ViewController.h"
#import "MenuViewController.h"
#import "VideoViewController.h"
#import "SettingTableViewController.h"
#import "main_header.h"

typedef NS_ENUM(NSUInteger, MenuTags) {
    MenuLogin = 0,
    MenuTotal
};


@interface ViewController () <SettingTableViewDelegate>
{
    UIImage *screenshot;
    UITextField* currentEditingTextField;
    UILabel *inforLabel;
    UILabel *mailLabel;
    UITextField *mailText;
    UILabel *pwdLabel;
    UITextField *pwdText;
    UIButton* buttonLogin;
    
    VideoViewController* videoViewCtl;
    SettingTableViewController* settingViewCtl;
}
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated
{
    [self.delegate showMainButton:1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//    UIView *buttonContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
//    buttonContainer.backgroundColor = [UIColor clearColor];
//    UIToolbar *dummyBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
//    
//    UIBarButtonItem *b1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(doSomething:)];
//    
//    UIBarButtonItem *b2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(doSomething:)];
//    
//    NSArray *items = [[NSArray alloc] initWithObjects:b1, b2, nil];
//    
//    [dummyBar setItems:items];
//    
//    [buttonContainer addSubview:dummyBar];
    
    CGFloat xMargin = 30.0f;
    //////////////////////////////
    UIButton* buttonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonLeft setFrame:CGRectMake(xMargin, 10, 50, 50)];
    [buttonLeft setImage:[UIImage imageNamed:@"linkedin-icon.png"] forState:UIControlStateNormal];
    [buttonLeft setTitle:@"" forState:UIControlStateNormal];
    [buttonLeft addTarget:self action:@selector(doSomething:)forControlEvents:UIControlEventTouchUpInside];
    //[buttonLeft sizeToFit];
    //top,left bottom,right
    buttonLeft.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    [buttonLeft setTag:MenuLogin];
    
    UIBarButtonItem* barButtonItemLeft = [[UIBarButtonItem alloc] initWithCustomView:buttonLeft];
    self.navigationItem.leftBarButtonItem = barButtonItemLeft;
    
    UIButton* buttonRigth = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRigth setFrame:CGRectMake(kScreenBoundsWidth-xMargin-50, 10, 50, 50)];
    [buttonRigth setImage:[UIImage imageNamed:@"fb-icon.png"] forState:UIControlStateNormal];
    [buttonRigth setTitle:@"" forState:UIControlStateNormal];
    [buttonRigth addTarget:self action:@selector(doSomething:)forControlEvents:UIControlEventTouchUpInside];
    //[buttonRigth sizeToFit];
    [buttonRigth setTag:MenuTotal];
    buttonRigth.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    UIBarButtonItem* barButtonItemRight = [[UIBarButtonItem alloc] initWithCustomView:buttonRigth];
    self.navigationItem.rightBarButtonItem = barButtonItemRight;
    
    /*
     leftButton.imageEdgeInsets = UIEdgeInsetsMake(-2, 0, 0, 0);
     */
    
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    
//    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
//    
//    UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
//    
//    NSArray *actionButtonItems = @[shareItem, cameraItem];
//    self.navigationItem.rightBarButtonItems = actionButtonItems;
    
    // Uncomment to display a logo as the navigation bar title
    // self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"appcoda-logo.png"]];
    
    self.title = @"SJPLab ObjectTracking";
    
    CGFloat marginX = 0.0;
    marginX = (kScreenBoundsWidth-250)/2;
    
    inforLabel = [[UILabel alloc] initWithFrame:CGRectMake(marginX, 100, 250, 26)];
    [inforLabel setBackgroundColor:[UIColor clearColor]];
    [inforLabel setTextColor:UIColorFromRGB(0xffffff)]; //0x8c6239, 0x000000
    [inforLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [inforLabel setText:@"Please sign in !"]; // sign out
    [inforLabel setTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:inforLabel];
    
    //mail address
    mailLabel = [[UILabel alloc] initWithFrame:CGRectMake(marginX, CGRectGetMaxY(inforLabel.frame)+15, 100, 26)];
    [mailLabel setBackgroundColor:[UIColor clearColor]];
    [mailLabel setTextColor:UIColorFromRGB(0xffffff)]; //0x8c6239, 0x000000
    [mailLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [mailLabel setText:@"Mail address"]; // sign out
    [mailLabel setTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:mailLabel];
    
    mailText = [[UITextField alloc] initWithFrame:CGRectMake(marginX, CGRectGetMaxY(mailLabel.frame), 250, 25)];
    [mailText setKeyboardType:UIKeyboardTypeEmailAddress];
    [mailText setReturnKeyType:UIReturnKeyDone];
    [mailText.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [mailText.layer setBorderWidth:0.8];
    mailText.layer.cornerRadius = 5;
    mailText.clipsToBounds = YES;
    [mailText setDelegate:(id)self];
    [mailText setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [mailText setTextColor:[UIColor whiteColor]];
    [self.view addSubview:mailText];
    
    //password
    pwdLabel = [[UILabel alloc] initWithFrame:CGRectMake(marginX, CGRectGetMaxY(mailText.frame), 100, 26)];
    [pwdLabel setBackgroundColor:[UIColor clearColor]];
    [pwdLabel setTextColor:UIColorFromRGB(0xffffff)]; //0x8c6239, 0x000000
    [pwdLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [pwdLabel setText:@"Password"]; // sign out
    [pwdLabel setTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:pwdLabel];
    
    pwdText = [[UITextField alloc] initWithFrame:CGRectMake(marginX, CGRectGetMaxY(pwdLabel.frame), 250, 25)];
    [pwdText setKeyboardType:UIKeyboardTypeDefault];
    [pwdText setReturnKeyType:UIReturnKeyDone];
    [pwdText.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [pwdText.layer setBorderWidth:0.8];
    pwdText.layer.cornerRadius = 5;
    pwdText.clipsToBounds = YES;
    [pwdText setSecureTextEntry:YES];
    [pwdText setDelegate:(id)self];
    [pwdText setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [pwdText setTextColor:[UIColor whiteColor]];
    [self.view addSubview:pwdText];
    
    //login button
    buttonLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonLogin setFrame:CGRectMake(marginX, CGRectGetMaxY(pwdText.frame)+15, 250, 30)];
    [buttonLogin setTitle:@"Sign in" forState:UIControlStateNormal];
    [buttonLogin.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [buttonLogin setTitleColor:UIColorFromRGB(0x000000) forState:UIControlStateNormal];
    [buttonLogin setTitleColor:UIColorFromRGB(0x000000) forState:UIControlStateHighlighted];
    [buttonLogin setBackgroundImage:[UIImage imageNamed:@"total_menu_login_btn.png"] forState:UIControlStateNormal];
    [buttonLogin setBackgroundImage:[UIImage imageNamed:@"total_menu_login_btn_press.png"] forState:UIControlStateHighlighted];
    [buttonLogin addTarget:self action:@selector(doLoginButtonClick)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonLogin];
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:cIsLogin]){
        [mailLabel setHidden:true];
        [mailText setHidden:true];
        [pwdLabel setHidden:true];
        [pwdText setHidden:true];
        
        [inforLabel setText:[NSString stringWithFormat:@"Signed in as %@", [[NSUserDefaults standardUserDefaults] stringForKey:cMail]]];
        [buttonLogin setTitle:@"Sign out" forState:UIControlStateNormal];
        
        [buttonLogin setFrame:CGRectMake(marginX, CGRectGetMaxY(inforLabel.frame)+15, 250, 30)];
    }
    
    [self.view setBackgroundColor:UIColorFromRGBA(0x000000, 1.0f) ]; //0xcccccc
    
    
//gclee
//#define Appdelegate (((AppDelegate *)[[UIApplication sharedApplication] delegate]))
//#define Appdelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])
//                  ^----------------------parenthesis--------------------------^
    
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
//    [self.view addSubview:shadowView];
    
    
//    ////////////////////////////////////////////////////////////////////////////////////////////////////
//    UIView *shadow = [[UIView alloc]init];
//    shadow.layer.cornerRadius = 5.0;
//    shadow.layer.shadowColor = [[UIColor redColor] CGColor];
//    shadow.layer.shadowOpacity = 1.0;
//    shadow.layer.shadowRadius = 10.0;
//    shadow.layer.shadowOffset = CGSizeMake(0.0f, -0.5f);
//    
//    UIButton *btnCompose = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btnCompose setFrame:CGRectMake(kScreenBoundsWidth-80, kScreenBoundsHeight-80, 80, 80)];
//    //[btnCompose setUserInteractionEnabled:YES];
//    btnCompose.layer.cornerRadius = 30;
//    btnCompose.layer.masksToBounds = YES;
//    [btnCompose setImage:[UIImage imageNamed:@"location_icon"] forState:UIControlStateNormal];
//    [btnCompose addTarget:self action:@selector(btnCompose_click) forControlEvents:UIControlEventTouchUpInside];
//    [shadow addSubview:btnCompose];
//    [self.view addSubview:shadow];
//    
//    UIButton *btnEmpty = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btnEmpty setFrame:CGRectMake(kScreenBoundsWidth-80, kScreenBoundsHeight-80, 80, 80)];
//    [btnEmpty setBackgroundColor:[UIColor clearColor]];
//    [btnEmpty addTarget:self action:@selector(btnCompose_click) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btnEmpty];
//    ///////////////////////////////////////////////////////////////////////////////////////////////////
    
    //    UIButton *bannerImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [bannerImageButton setFrame:bannerImageView.frame];
    //    [bannerImageButton setBackgroundColor:[UIColor clearColor]];
    //    [bannerImageButton setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x000000)] forState:UIControlStateHighlighted];
    //    [bannerImageButton addTarget:self action:@selector(touchBannerButton) forControlEvents:UIControlEventTouchUpInside];
    //    [bannerImageButton setAlpha:0.3];
    //    [containerView addSubview:bannerImageButton];


    
    //return shadow;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - text delegate
// UITextField Protocol
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    currentEditingTextField = textField;
}
-(void)dateSave:(id)sender
{
    self.navigationItem.rightBarButtonItem=nil;
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    currentEditingTextField = NULL;
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self endEdit];
//}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self endEdit];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self textFieldValueIsValid:textField]) {
        [self endEdit];
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

// Own functions
-(void)endEdit
{
    if (currentEditingTextField) {
        [currentEditingTextField endEditing:YES];
        currentEditingTextField = NULL;
    }
}
// Override this in your subclass to handle eventual values that may prevent validation.
-(BOOL)textFieldValueIsValid:(UITextField*)textField
{
    return YES;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Selectors

- (void)btnCompose_click
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

    
    
    /////////////////////////////////////////////////

//    - (UIView*)putView:(UIView*)view insideShadowWithColor:(UIColor*)color andRadius:(CGFloat)shadowRadius andOffset:(CGSize)shadowOffset andOpacity:(CGFloat)shadowOpacity
//    {
//        CGRect shadowFrame; // Modify this if needed
//        shadowFrame.size.width = 0.f;
//        shadowFrame.size.height = 0.f;
//        shadowFrame.origin.x = 0.f;
//        shadowFrame.origin.y = 0.f;
//        UIView * shadow = [[UIView alloc] initWithFrame:shadowFrame];
//        shadow.userInteractionEnabled = NO; // Modify this if needed
//        shadow.layer.shadowColor = color.CGColor;
//        shadow.layer.shadowOffset = shadowOffset;
//        shadow.layer.shadowRadius = shadowRadius;
//        shadow.layer.masksToBounds = NO;
//        shadow.clipsToBounds = NO;
//        shadow.layer.shadowOpacity = shadowOpacity;
//        [view.superview insertSubview:shadow belowSubview:view];
//        [shadow addSubview:view];
//        return shadow;
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//+ (UIView *)genComposeButton:(UIViewController <UIComposeButtonDelegate> *)observer;
//{
//    UIView *shadow = [[UIView alloc]init];
//    shadow.layer.cornerRadius = 5.0;
//    shadow.layer.shadowColor = [[UIColor blackColor] CGColor];
//    shadow.layer.shadowOpacity = 1.0;
//    shadow.layer.shadowRadius = 10.0;
//    shadow.layer.shadowOffset = CGSizeMake(0.0f, -0.5f);
//    
//    UIButton *btnCompose = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,60, 60)];
//    [btnCompose setUserInteractionEnabled:YES];
//    btnCompose.layer.cornerRadius = 30;
//    btnCompose.layer.masksToBounds = YES;
//    [btnCompose setImage:[UIImage imageNamed:@"60x60"] forState:UIControlStateNormal];
//    [btnCompose addTarget:observer action:@selector(btnCompose_click:) forControlEvents:UIControlEventTouchUpInside];
//    [shadow addSubview:btnCompose];
//    return shadow;
//}

-(void)doLoginButtonClick
{
    CGFloat marginX = 0.0;
    marginX = (kScreenBoundsWidth-250)/2;
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:cIsLogin]){
    
        // login before
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:cIsLogin];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:cMail];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:cPwd];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [mailText setText:@""];
        [pwdText setText:@""];
        
        [mailLabel setHidden:false];
        [mailText setHidden:false];
        [pwdLabel setHidden:false];
        [pwdText setHidden:false];
        
        [inforLabel setText:[NSString stringWithFormat:@"Please sign in !"]];
        [buttonLogin setTitle:@"Sign in" forState:UIControlStateNormal];
        
        [buttonLogin setFrame:CGRectMake(marginX, CGRectGetMaxY(pwdText.frame)+15, 250, 30)];
        
    }else{ // no login before
        
        
        if( [[mailText text] isEqualToString:@""] ){
            UIAlertController * view=   [UIAlertController
                                         alertControllerWithTitle:@""
                                         message:@"mail address is empty "
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     //Do some thing here
                                     [view dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
            
            [view addAction:ok];
            [self presentViewController:view animated:YES completion:nil];
            
            [mailText becomeFirstResponder];
        }
        
        if( [[pwdText text] isEqualToString:@""] ){
            UIAlertController * view=   [UIAlertController
                                         alertControllerWithTitle:@""
                                         message:@"password is empty"
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     //Do some thing here
                                     [view dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
            
            [view addAction:ok];
            [self presentViewController:view animated:YES completion:nil];
            
            [pwdText becomeFirstResponder];
        }
           
        if( [[mailText text] isEqualToString:@"sjplab@gmail.com"] && [[pwdText text] isEqualToString:@"sjplab2016"] ){
            
            NSLog(@"sign in success !!!!!");
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:cIsLogin];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSUserDefaults standardUserDefaults] setObject:[mailText text] forKey:cMail];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSUserDefaults standardUserDefaults] setObject:[pwdText text] forKey:cPwd];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            //reinit
            [mailLabel setHidden:true];
            [mailText setHidden:true];
            [pwdLabel setHidden:true];
            [pwdText setHidden:true];
            
            [inforLabel setText:[NSString stringWithFormat:@"Signed in as %@", [[NSUserDefaults standardUserDefaults] stringForKey:cMail]]];
            [buttonLogin setTitle:@"Sign out" forState:UIControlStateNormal];
            
            [buttonLogin setFrame:CGRectMake(marginX, CGRectGetMaxY(inforLabel.frame)+15, 250, 30)];
        }else{
            
            UIAlertController * view=   [UIAlertController
                                         alertControllerWithTitle:@""
                                         message:@"Wrong password!"
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     //Do some thing here
                                     [view dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
//            UIAlertAction* cancel = [UIAlertAction
//                                     actionWithTitle:@"Cancel"
//                                     style:UIAlertActionStyleDefault
//                                     handler:^(UIAlertAction * action)
//                                     {
//                                         [view dismissViewControllerAnimated:YES completion:nil];
//                                         
//                                     }];
            
            
            [view addAction:ok];
//            [view addAction:cancel];
            [self presentViewController:view animated:YES completion:nil];
        }
    }
    
//    if(![[NSUserDefaults standardUserDefaults] boolForKey:cIsLogin]){
//       
//    }
    
    
}

#pragma mark - setting view controll delegate
-(void)hideMainButton:(NSInteger)hide
{
    [self.delegate hideMainButton:hide];
}

#pragma mark - navigaton bar click
-(void)doSomething:(id)sender
{
    NSLog(@"Button pushed");
    
    UIButton *button = (UIButton *)sender;
    
    if(button.tag == MenuLogin){
        
        //gclee
        //[[NSNotificationCenter defaultCenter] postNotificationName:showMenuViewNotification object:self];
        [[NSNotificationCenter defaultCenter] postNotificationName:showLoadingViewNotification object:self];
        
    }
    else if(button.tag == MenuTotal){
        
        // gclee
        //[[NSNotificationCenter defaultCenter] postNotificationName:showMenuViewNotification object:self];
        [[NSNotificationCenter defaultCenter] postNotificationName:showCommonAlertViewNotification object:self];
    }
    
    
    //screenshot = [self screenShot];
//    [self createScreenshotwithComleteAction:^{
//        //self.definesPresentationContext = YES; //self is presenting view controller
//        MenuViewController *viewController = [[MenuViewController alloc] init];
//        [viewController setParentScreenShot:screenshot];
//        [viewController setDelegate:self];
//        //viewController.view.backgroundColor = [UIColor clearColor];
//        
//        //viewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//        [self presentViewController:viewController animated:NO completion:nil];
//    }];
    
//    MYDetailViewController *dvc = [[MYDetailViewController alloc] initWithNibName:@"MYDetailViewController" bundle:[NSBundle mainBundle]];
//    [dvc setDelegate:self];
//    [dvc setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
//    [self presentViewController:dvc animated:YES completion:nil];
}

#pragma mark - screenshot

-(UIImage*)screenShot{
    //UIGraphicsBeginImageContext(self.view.bounds.size);
    UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:context];
    UIImage * screenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData * imageData = UIImageJPEGRepresentation(screenImage, SCREENSHOT_QUALITY);
    screenImage = [UIImage imageWithData:imageData];
    return screenImage;
}

-(UIImage*)screenShotOnScrolViewWithContentOffset:(CGPoint)offset{
//    UIGraphicsBeginImageContext(self.view.bounds.size);
    UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, -offset.x, -offset.y);
    [self.view.layer renderInContext:context];
    UIImage * screenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData * imageData = UIImageJPEGRepresentation(screenImage, SCREENSHOT_QUALITY);
    screenImage = [UIImage imageWithData:imageData];
    return screenImage;
}

-(void)createScreenshotwithComleteAction:(dispatch_block_t)completeAction{
    
    if ([self.view isKindOfClass:[UIScrollView class]]) {
        screenshot = [self screenShotOnScrolViewWithContentOffset:[(UIScrollView*)self.view contentOffset]];
    }else{
        screenshot = [self screenShot];
    }
    
    if (completeAction != nil) {
        completeAction();
    }
}

#pragma mark - public function

-(void)showVideoControll:(NSInteger)boolParam{
    
    if(boolParam){
        videoViewCtl = [[VideoViewController alloc] init];
        [self presentViewController:videoViewCtl animated:YES completion:nil];
        [self.delegate showMainButton:0];
        
    }else{
        [videoViewCtl dismissViewControllerAnimated:YES completion:nil];
        [self.delegate showMainButton:1];
        
    }
}

-(void)showSettingControll:(NSInteger)boolParam{
    
    if(boolParam){
        settingViewCtl = [[SettingTableViewController alloc] init];
        //[self presentViewController:settingViewCtl animated:YES completion:nil];
        settingViewCtl.delegate = (id)self;
        
        [self.navigationController pushViewController:settingViewCtl animated:YES];
        [self.delegate showMainButton:0];
        
    }else{
        //[settingViewCtl dismissViewControllerAnimated:YES completion:nil];
        [self.navigationController popToViewController:settingViewCtl animated:YES];
        [self.delegate showMainButton:1];
    }
}


-(void)setROI{
    
    [videoViewCtl setROI];
}

-(void)setObjectTracking:(NSInteger)isDo{
    
    [videoViewCtl setObjectTracking:isDo];
}

-(void)setVideoType:(NSInteger)type{
    [videoViewCtl setVideoType:type];
}


@end
