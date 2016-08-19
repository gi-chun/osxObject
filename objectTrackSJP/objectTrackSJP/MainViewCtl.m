//
//  LeftMenuViewCtl.m
//  objectTrackSJP
//
//  Created by gclee on 2016. 8. 18..
//  Copyright © 2016년 SJPlap. All rights reserved.
//

#import "MainViewCtl.h"

@interface MainViewCtl ()

@end

@implementation MainViewCtl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    
    [self.view setNeedsDisplay:true];
    
    NSTextField *updateTimeLabel = [[NSTextField alloc] initWithFrame:CGRectMake(84, 152, 76, 26)];
    [updateTimeLabel setBackgroundColor:[NSColor redColor]];
    [updateTimeLabel setFont:[NSFont fontWithName:@"Helvetica-Bold" size:13]];
    [updateTimeLabel setStringValue:@"test test gclee"];
    [self.view addSubview:updateTimeLabel];
}

- (void)viewWillDisappear {
    
}

@end
