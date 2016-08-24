//
//  TopViewCtl.m
//  objectTrackSJP
//
//  Created by gclee on 2016. 8. 18..
//  Copyright © 2016년 SJPlap. All rights reserved.
//

#import "TopViewCtl.h"

@interface TopViewCtl ()

@end

@implementation TopViewCtl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self setupAVCapture];
    
//    NSTextField *updateTimeLabel = [[NSTextField alloc] initWithFrame:CGRectMake(84, 152, 76, 26)];
//    [updateTimeLabel setBackgroundColor:[NSColor redColor]];
//    [updateTimeLabel setFont:[NSFont fontWithName:@"Helvetica-Bold" size:13]];
////    [updateTimeLabel setValue:@"test test test" forKey:@"test"];
//    [updateTimeLabel setStringValue:@"test test gclee"];
//    [self.view addSubview:updateTimeLabel];
    
}

- (void)viewWillDisappear {

    [session stopRunning];
    [previewLayer removeFromSuperlayer];
    [previewLayer setSession:nil];
    //[session release];
    
}


- (BOOL)setupAVCapture
{
    NSError *error = nil;
    
    session = [AVCaptureSession new];
    [session setSessionPreset:AVCaptureSessionPresetPhoto];
    
    // Select a video device, make an input
    for (AVCaptureDevice *device in [AVCaptureDevice devices]) {
        if ([device hasMediaType:AVMediaTypeVideo] || [device hasMediaType:AVMediaTypeMuxed]) {
            AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
            if (error) {
                //[session release];
                NSLog(@"deviceInputWithDevice failed with error %@", [error localizedDescription]);
                return NO;
            }
            if ([session canAddInput:input])
                [session addInput:input];
            break;
        }
    }
    
    // Make a still image output
//    stillImageOutput = [AVCaptureStillImageOutput new];
//    if ([session canAddOutput:stillImageOutput])
//        [session addOutput:stillImageOutput];
    
    // Make a preview layer so we can see the visual output of an AVCaptureSession
    previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [previewLayer setFrame:[previewView bounds]];
    [[previewLayer connection] setAutomaticallyAdjustsVideoMirroring:NO];
    [[previewLayer connection] setVideoMirrored:YES];
    
    // add the preview layer to the hierarchy
    CALayer *rootLayer = [previewView layer];
    [rootLayer setBackgroundColor:CGColorGetConstantColor(kCGColorBlack)];
    [rootLayer addSublayer:previewLayer];
    
    // start the capture session running, note this is an async operation
    // status is provided via notifications such as AVCaptureSessionDidStartRunningNotification/AVCaptureSessionDidStopRunningNotification
    [session startRunning];
    
    return YES;
}


- (IBAction)cancelObjectAction:(id)sender {
}

@end
