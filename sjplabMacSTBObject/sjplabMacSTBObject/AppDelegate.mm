//
//  AppDelegate.m
//  sjplabMacSTBObject
//
//  Created by gclee on 2016. 10. 24..
//  Copyright © 2016년 sjplab. All rights reserved.
//

#ifdef __OBJC__
#import "AppDelegate.h"
#import "main_header.h"
#endif

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    //set default config
    if(![[NSUserDefaults standardUserDefaults] integerForKey:cfirstAppExe]){
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:cfirstAppExe];
        
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:cIsLogin];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:cMail];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:cPwd];
        [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:cdisplay_optionNo]; // ? 1280*720
        [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:cprocessing_optionNo]; // 640*480
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:ctrackingALG_keyPoints]; // 1: 사용
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:ctrackingALG_learning]; // 1: 사용
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:cinputType_optionNo]; // cam back
        [[NSUserDefaults standardUserDefaults] setInteger:12 forKey:corgFPS_optionNo]; // 15
        
        [[NSUserDefaults standardUserDefaults] setInteger:methodStream forKey:inputMethod];
        [[NSUserDefaults standardUserDefaults] setInteger:methodCMT forKey:processMethod];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    //end set default config
    
    //test
    [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:cdisplay_optionNo]; // 2: 1280 * 720 1: 640 * 480 : 3: 1920 * 1080
    [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:cprocessing_optionNo]; // 352 * 288 : 1 , 2: 640 * 480 4: 1280 * 720
    //[[NSUserDefaults standardUserDefaults] setInteger:methodStream forKey:inputMethod]; //methodStream, methodCam
    //[[NSUserDefaults standardUserDefaults] setInteger:methodCMT forKey:processMethod];

    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
