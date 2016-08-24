//
//  TopViewCtl.h
//  objectTrackSJP
//
//  Created by gclee on 2016. 8. 18..
//  Copyright © 2016년 SJPlap. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>


@interface TopViewCtl : NSViewController
{
    IBOutlet NSView *previewView;
    AVCaptureSession *session;
    AVCaptureVideoPreviewLayer *previewLayer;
    IBOutlet NSButton *cancelObject;
}

- (IBAction)cancelObjectAction:(id)sender;

@end
