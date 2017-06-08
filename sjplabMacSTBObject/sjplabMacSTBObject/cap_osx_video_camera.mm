/*
 *  cap_ios_video_camera.mm
 *  For iOS video I/O
 *  by Eduard Feicho on 29/07/12
 *  by Alexander Shishkov on 17/07/13
 *  Copyright 2012. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 * EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

//#import "opencv2/videoio/cap_ios.h"
#import "cap_osx.h"
#include "precomp.hpp"
#import "main_header.h"
#include "ImAcq.h"
//#import <AssetsLibrary/AssetsLibrary.h>


static CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;}

#pragma mark - Private Interface




@interface CvVideoCamera ()
{
    ImAcq *imAcq;
    //cv::VideoCapture cap;
    //int getStreamBreak;
}

- (void)createVideoDataOutput;
- (void)createVideoFileOutput;


@property (nonatomic, retain) CALayer *customPreviewLayer;
@property (nonatomic, retain) AVCaptureVideoDataOutput *videoDataOutput;

@end



#pragma mark - Implementation



@implementation CvVideoCamera




@synthesize delegate;
@synthesize grayscaleMode;

@synthesize customPreviewLayer;
@synthesize videoDataOutput;

@synthesize recordVideo;
@synthesize rotateVideo;
//@synthesize videoFileOutput;
@synthesize recordAssetWriterInput;
@synthesize recordPixelBufferAdaptor;
@synthesize recordAssetWriter;



#pragma mark - Constructors

- (id)initWithParentView:(NSView*)parent;
{
    self = [super initWithParentView:parent];
    if (self) {
        self.useAVCaptureVideoPreviewLayer = NO;
        self.recordVideo = NO;
        self.rotateVideo = NO;
    }
    return self;
}



#pragma mark - Public interface


- (void)start;
{
    [super start];
    
//    if(self.inputMethod == methodStream){
//        
//        //imAcq = imAcqAlloc();
//        //imAcq->method = IMACQ_VID; // IMACQ_STREAM, IMACQ_VID
////        imAcq->imgPath = "/Volumes/BOOTCAMP/Users/gclee/Downloads/151127.mp4";
////        imAcq->imgPath = "/Users/gclee/Desktop/basketball(3).m4v";
//        //https://devimages.apple.com.edgekey.net/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8
//        //imAcq->imgPath = "https://devimages.apple.com.edgekey.net/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8";
//        //imAcqInit(imAcq);
//        
////        imAcq = imAcqAlloc();
////        imAcq->method = IMACQ_VID; // IMACQ_STREAM
////        imAcq->imgPath = "/Volumes/BOOTCAMP/Users/gclee/Downloads/151127.mp4";
////        //    imAcq->imgPath = "/Users/gclee/Desktop/basketball(4).m4v";
////        imAcqInit(imAcq);
//        
//        // start get stream data
////        [self performSelectorOnMainThread:@selector(getSteamData) withObject:nil waitUntilDone:NO];
//        [self performSelectorInBackground:@selector(getSteamData) withObject:nil];
////        [NSThread detachNewThreadSelector:@selector(getSteamData) toTarget:self withObject:nil];
////        [self performSelector:@selector(getSteamData) withObject:nil afterDelay:2.0];
////        [self getSteamData];
////        dispatch_queue_t queue = dispatch_queue_create("com.example.MyQueue", NULL);
////        dispatch_async(queue, ^{
////            [self getSteamData];
////        });
//        
//        
//
////        NSTimer *t = [NSTimer scheduledTimerWithTimeInterval: 0.05
////                                                      target: self
////                                                    selector:@selector(getSteamData:)
////                                                    userInfo: nil repeats:YES];
//        // end
//    }
    
    [self performSelectorInBackground:@selector(getSteamData) withObject:nil];
   
    if (self.recordVideo == YES) {
        NSError* error = nil;
        if ([[NSFileManager defaultManager] fileExistsAtPath:[self videoFileString]]) {
            [[NSFileManager defaultManager] removeItemAtPath:[self videoFileString] error:&error];
        }
        if (error == nil) {
            NSLog(@"[Camera] Delete file %@", [self videoFileString]);
        }
    }
}



- (void)stop;
{
    [super stop];

    //cap.release();
    
    self.videoDataOutput = nil;
    
//    if (videoDataOutputQueue) {
//        dispatch_release(videoDataOutputQueue);
//    }

    [self.customPreviewLayer removeFromSuperlayer];
    self.customPreviewLayer = nil;
}

#pragma mark - Private Interface

//- (void)getSteamData:(NSTimer *)timer
- (void)getSteamData
{
    cv::VideoCapture cap;
    
    switch (self.inputMethod) {
        case methodCam:
            cap.release();
            cap.open(0);
            break;
        case methodCam2:
            cap.release();
            cap.open(1);
            break;
        case methodStream:
            cap.release();
            cap.open("https://devimages.apple.com.edgekey.net/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8");
            break;
        default:
            break;
    }
//    //https://devimages.apple.com.edgekey.net/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8
////    cv::VideoCapture cap(0);
//    //cv::VideoCapture cap;
//    cap.open("https://devimages.apple.com.edgekey.net/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8");
//    //cv::VideoCapture cap("https://devimages.apple.com.edgekey.net/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8");
  
    cv::Mat frame;
    
    if(!cap.isOpened()){
        NSLog(@"cap no opened");
        
    }
    //while(imAcqHasMoreFrames(imAcq)){
    while(1){
        
        if(self.getStreamBreak){
            cap.release();
            break;
        }
        
        cap >> frame;
        if(frame.empty()){
            break;
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            cv::Mat image;
//            IplImage *img;
//            img = imAcqGetImg(imAcq);
//            
//            // delegate image processing to the delegate
//            image = cv::cvarrToMat(img, true, true, 1);
            
            //image = frame;
            cv::cvtColor(frame, image, CV_BGR2RGB);
            
            if ([self.delegate respondsToSelector:@selector(processImage:)]) {
                [self.delegate processImage:image];
            }
            
            // (create color space, create graphics context, render buffer)
//            CGBitmapInfo bitmapInfo;
//            CGColorSpaceRef colorSpace;
//            
//            // basically we decide if it's a grayscale, rgb or rgba image
//            if (image.channels() == 1) {
//                colorSpace = CGColorSpaceCreateDeviceGray();
//                bitmapInfo = kCGImageAlphaNone;
//            } else if (image.channels() == 3) {
//                colorSpace = CGColorSpaceCreateDeviceRGB(); //CGColorSpaceCreateDeviceRGB
//                bitmapInfo = kCGImageAlphaNone; //kCGImageAlphaNone
//                bitmapInfo |= kCGImageByteOrder32Big; //kCGImageByteOrder32Big
//                
//            } else {
//                colorSpace = CGColorSpaceCreateDeviceRGB();
//                bitmapInfo = kCGImageAlphaPremultipliedFirst;
//                bitmapInfo |= kCGImageByteOrder32Big;
//            }
            
            //kCGBitmapByteOrder32Little
            
            /////////////////////////////////////////////////////////////////
//            typedef CF_ENUM(uint32_t, CGImageAlphaInfo) {
//                kCGImageAlphaNone,               /* For example, RGB. */
//                kCGImageAlphaPremultipliedLast,  /* For example, premultiplied RGBA */
//                kCGImageAlphaPremultipliedFirst, /* For example, premultiplied ARGB */
//                kCGImageAlphaLast,               /* For example, non-premultiplied RGBA */
//                kCGImageAlphaFirst,              /* For example, non-premultiplied ARGB */
//                kCGImageAlphaNoneSkipLast,       /* For example, RBGX. */
//                kCGImageAlphaNoneSkipFirst,      /* For example, XRGB. */
//                kCGImageAlphaOnly                /* No color data, alpha data only */
//            };
            
//            if (image.channels() == 1) {
//                colorSpace = CGColorSpaceCreateDeviceGray();
//                bitmapInfo = kCGImageAlphaNone;
//            } else if (image.channels() == 3) {
//                colorSpace = CGColorSpaceCreateDeviceRGB();
//                bitmapInfo = kCGImageAlphaNone;
//                if (iOSimage) {
//                    bitmapInfo |= kCGBitmapByteOrder32Little;
//                } else {
//                    bitmapInfo |= kCGBitmapByteOrder32Big;
//                }
//            } else {
//                colorSpace = CGColorSpaceCreateDeviceRGB();
//                bitmapInfo = kCGImageAlphaPremultipliedFirst;
//                if (iOSimage) {
//                    bitmapInfo |= kCGBitmapByteOrder32Little;
//                } else {
//                    bitmapInfo |= kCGBitmapByteOrder32Big;
//                }
//            }
            
            
            NSData *data = [NSData dataWithBytes:image.data length:image.elemSize()*image.total()];
            CGColorSpaceRef colorSpace;
            CGBitmapInfo bitmapInfo;
            
            if (image.elemSize() == 1) {
                colorSpace = CGColorSpaceCreateDeviceGray();
                bitmapInfo = kCGImageAlphaNone | kCGBitmapByteOrderDefault;

            } else {
                colorSpace = CGColorSpaceCreateDeviceRGB(); //CGColorSpaceCreateCalibratedRGB, CGColorSpaceCreateDeviceRGB , CGColorSpaceCreateLab
//                colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceACESCGLinear);
                bitmapInfo = kCGBitmapByteOrder32Big | (image.elemSize() == 3? kCGImageAlphaNone : kCGImageAlphaNone); //kCGImageAlphaNone, kCGImageAlphaNoneSkipFirst
            }
            
            CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
            
            // Creating CGImage from cv::Mat
            CGImageRef imageRef = CGImageCreate(image.cols,                                 //width
                                                image.rows,                                 //height
                                                8,                                          //bits per component
                                                8 * image.elemSize(),                       //bits per pixel
                                                image.step[0],                            //bytesPerRow
                                                colorSpace,                                 //colorspace
                                                bitmapInfo,// bitmap info
                                                provider,                                   //CGDataProviderRef
                                                NULL,                                       //decode
                                                false,                                      //should interpolate
                                                kCGRenderingIntentDefault                   //intent
                                                );
            
            
            //kCGImageAlphaNone|kCGBitmapByteOrderDefault,// bitmap info

            // Getting UIImage from CGImage
            //CIImage *finalImage = [CIImage imageWithCGImage:imageRef];
            
            /////////////////////////////////////////////////////////////////////
            
//            NSData *data = [NSData dataWithBytes:image.data length:image.elemSize()*image.total()];
//            CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
//            
//            CGImage* dstImage;
//            // Creating CGImage from cv::Mat
//            dstImage = CGImageCreate(image.cols,                                 // width
//                                     image.rows,                                 // height
//                                     8,                                          // bits per component
//                                     8 * image.elemSize(),                       // bits per pixel 8 * image.elemSize()
//                                     image.step,                                 // bytesPerRow image.step
//                                     colorSpace,                                 // colorspace image.step
//                                     bitmapInfo,                                 // bitmap info
//                                     provider,                                   // CGDataProviderRef
//                                     NULL,                                       // decode
//                                     false,                                      // should interpolate
//                                     kCGRenderingIntentDefault                   // intent //kCGRenderingIntentDefault
//                                     );
//            
//            CGDataProviderRelease(provider);

//            NSImage *img = [[NSImage alloc] initWithCGImage:imageRef size:NSZeroSize];
            self.customPreviewLayer.contents = (__bridge id)imageRef;
//            self.customPreviewLayer.contents = img;

//            img = nil;
//            CGImageRelease(dstImage);
//            CGColorSpaceRelease(colorSpace);
            
            image.release();
            //cvReleaseImage(&img);
            
            CGImageRelease(imageRef);
            CGDataProviderRelease(provider);
            CGColorSpaceRelease(colorSpace);


        });
    }
    
}

- (void)updateProgress:(CGImage *)dstImage
{
    self.customPreviewLayer.contents = (__bridge id)dstImage;
}

- (void)createVideoDataOutput;
{
    // Make a video data output
    self.videoDataOutput = [AVCaptureVideoDataOutput new];

    // In grayscale mode we want YUV (YpCbCr 4:2:0) so we can directly access the graylevel intensity values (Y component)
    // In color mode we, BGRA format is used
    OSType format = self.grayscaleMode ? kCVPixelFormatType_420YpCbCr8BiPlanarFullRange : kCVPixelFormatType_32BGRA;

    self.videoDataOutput.videoSettings  = [NSDictionary dictionaryWithObject:[NSNumber numberWithUnsignedInt:format]
                                                                      forKey:(id)kCVPixelBufferPixelFormatTypeKey];

    // discard if the data output queue is blocked (as we process the still image)
    [self.videoDataOutput setAlwaysDiscardsLateVideoFrames:YES];

    if ( [self.captureSession canAddOutput:self.videoDataOutput] ) {
        [self.captureSession addOutput:self.videoDataOutput];
    }
    [[self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo] setEnabled:YES];


    // set default FPS
    if ([self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo].supportsVideoMinFrameDuration) {
        [self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo].videoMinFrameDuration = CMTimeMake(1, self.defaultFPS);
    }
    if ([self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo].supportsVideoMaxFrameDuration) {
        [self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo].videoMaxFrameDuration = CMTimeMake(1, self.defaultFPS);
    }

    //gclee
    // set video mirroring for front camera (more intuitive)
//    if ([self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo].supportsVideoMirroring) {
//        if (self.defaultAVCaptureDevicePosition == AVCaptureDevicePositionFront) {
//            [self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo].videoMirrored = YES;
//        } else {
//            [self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo].videoMirrored = NO;
//        }
//    }
    
    [self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo].videoMirrored = YES;

    // set default video orientation
    if ([self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo].supportsVideoOrientation) {
        [self.videoDataOutput connectionWithMediaType:AVMediaTypeVideo].videoOrientation = self.defaultAVCaptureVideoOrientation;
    }


    // create a custom preview layer
    self.customPreviewLayer = [CALayer layer];
    self.customPreviewLayer.bounds = CGRectMake(0, 0, self.parentView.frame.size.width, self.parentView.frame.size.height);
    NSLog(@"[Camera] layer width %f : height %f", self.parentView.frame.size.width, self.parentView.frame.size.height);
    [self layoutPreviewLayer];

    // create a serial dispatch queue used for the sample buffer delegate as well as when a still image is captured
    // a serial dispatch queue must be used to guarantee that video frames will be delivered in order
    // see the header doc for setSampleBufferDelegate:queue: for more information
    videoDataOutputQueue = dispatch_queue_create("VideoDataOutputQueue", DISPATCH_QUEUE_SERIAL);
    [self.videoDataOutput setSampleBufferDelegate:self queue:videoDataOutputQueue];


    NSLog(@"[Camera] created AVCaptureVideoDataOutput at %d FPS", self.defaultFPS);
}



- (void)createVideoFileOutput;
{
    /* Video File Output in H.264, via AVAsserWriter */
    NSLog(@"Create Video with dimensions %dx%d", self.imageWidth, self.imageHeight);

    NSDictionary *outputSettings
     = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:self.imageWidth], AVVideoWidthKey,
                                                  [NSNumber numberWithInt:self.imageHeight], AVVideoHeightKey,
                                                  AVVideoCodecH264, AVVideoCodecKey,
                                                  nil
     ];


    self.recordAssetWriterInput = [AVAssetWriterInput assetWriterInputWithMediaType:AVMediaTypeVideo outputSettings:outputSettings];


    int pixelBufferFormat = (self.grayscaleMode == YES) ? kCVPixelFormatType_420YpCbCr8BiPlanarFullRange : kCVPixelFormatType_32BGRA;

    self.recordPixelBufferAdaptor =
               [[AVAssetWriterInputPixelBufferAdaptor alloc]
                    initWithAssetWriterInput:self.recordAssetWriterInput
                    sourcePixelBufferAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:pixelBufferFormat], kCVPixelBufferPixelFormatTypeKey, nil]];

    NSError* error = nil;
    NSLog(@"Create AVAssetWriter with url: %@", [self videoFileURL]);
    self.recordAssetWriter = [AVAssetWriter assetWriterWithURL:[self videoFileURL]
                                                      fileType:AVFileTypeMPEG4
                                                         error:&error];
    if (error != nil) {
        NSLog(@"[Camera] Unable to create AVAssetWriter: %@", error);
    }

    [self.recordAssetWriter addInput:self.recordAssetWriterInput];
    self.recordAssetWriterInput.expectsMediaDataInRealTime = YES;

    NSLog(@"[Camera] created AVAssetWriter");
}

// TODO fix
- (void)layoutPreviewLayer;
{
    NSLog(@"layout preview layer");
    if (self.parentView != nil) {
        
        CALayer* layer = self.customPreviewLayer;
        CGRect bounds = self.customPreviewLayer.bounds;
        int rotation_angle = 0;
        bool flip_bounds = false;
        
        flip_bounds = true;
        
        if (flip_bounds) {
            NSLog(@"flip bounds");
            //NSLog(@"[flip bounds] layer width %f : height %f", self.parentView.frame.size.width, self.parentView.frame.size.height);
            NSLog(@"[flip bounds] layer width %f : height %f", bounds.size.width, bounds.size.height);
            //bounds = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
            bounds = CGRectMake(0, 0, self.parentView.frame.size.width, self.parentView.frame.size.height);
        }
        
        layer.position = CGPointMake(self.parentView.frame.size.width/2., self.parentView.frame.size.height/2.);
        //layer.position = CGPointMake(bounds.size.width/2., bounds.size.height/2.);
        //layer.position = CGPointMake(0., 0.);
        //layer.affineTransform = CGAffineTransformMakeRotation( DegreesToRadians(rotation_angle) );
        layer.bounds = bounds;
    }
    
}


- (void)createCaptureOutput;
{
//    if(self.inputMethod == methodCam){
//        [self createVideoDataOutput];
//        if (self.recordVideo == YES) {
//            [self createVideoFileOutput];
//        }
//    }else if(self.inputMethod == methodCam2){
//        [self createVideoDataOutput];
//        if (self.recordVideo == YES) {
//            [self createVideoFileOutput];
//        }
//    }else{
//        self.customPreviewLayer = [CALayer layer];
//        self.customPreviewLayer.bounds = CGRectMake(0, 0, self.parentView.frame.size.width, self.parentView.frame.size.height);
//        NSLog(@"[Camera] layer width %f : height %f", self.parentView.frame.size.width, self.parentView.frame.size.height);
//        [self layoutPreviewLayer];
//    }
    
    self.customPreviewLayer = [CALayer layer];
    self.customPreviewLayer.bounds = CGRectMake(0, 0, self.parentView.frame.size.width, self.parentView.frame.size.height);
    NSLog(@"[Camera] layer width %f : height %f", self.parentView.frame.size.width, self.parentView.frame.size.height);
    [self layoutPreviewLayer];

}

- (void)createCustomVideoPreview;
{
    [self.parentView setWantsLayer:YES];
    [self.parentView.layer addSublayer:self.customPreviewLayer];
}

- (CVPixelBufferRef) pixelBufferFromCGImage: (CGImageRef) image
{

    CGSize frameSize = CGSizeMake(CGImageGetWidth(image), CGImageGetHeight(image));
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:NO], kCVPixelBufferCGImageCompatibilityKey,
                             [NSNumber numberWithBool:NO], kCVPixelBufferCGBitmapContextCompatibilityKey,
                             nil];
    CVPixelBufferRef pxbuffer = NULL;
    CVReturn status = CVPixelBufferCreate(kCFAllocatorDefault, frameSize.width,
                                          frameSize.height,  kCVPixelFormatType_32ARGB, (CFDictionaryRef) CFBridgingRetain(options),
                                          &pxbuffer);
    NSParameterAssert(status == kCVReturnSuccess && pxbuffer != NULL);

    CVPixelBufferLockBaseAddress(pxbuffer, 0);
    void *pxdata = CVPixelBufferGetBaseAddress(pxbuffer);


    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pxdata, frameSize.width,
                                                 frameSize.height, 8, 4*frameSize.width, rgbColorSpace,
                                                 kCGImageAlphaPremultipliedFirst);

    CGContextDrawImage(context, CGRectMake(0, 0, CGImageGetWidth(image),
                                           CGImageGetHeight(image)), image);
    CGColorSpaceRelease(rgbColorSpace);
    CGContextRelease(context);

    CVPixelBufferUnlockBaseAddress(pxbuffer, 0);

    return pxbuffer;
}

#pragma mark - Protocol AVCaptureVideoDataOutputSampleBufferDelegate


- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection
{
    (void)captureOutput;
    (void)connection;
    if (self.delegate) {

        // convert from Core Media to Core Video
        CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
        CVPixelBufferLockBaseAddress(imageBuffer, 0);

        void* bufferAddress;
        size_t width;
        size_t height;
        size_t bytesPerRow;

        CGColorSpaceRef colorSpace;
        CGContextRef context;

        int format_opencv;

        OSType format = CVPixelBufferGetPixelFormatType(imageBuffer);
        if (format == kCVPixelFormatType_420YpCbCr8BiPlanarFullRange) {

            format_opencv = CV_8UC1;

            bufferAddress = CVPixelBufferGetBaseAddressOfPlane(imageBuffer, 0);
            width = CVPixelBufferGetWidthOfPlane(imageBuffer, 0);
            height = CVPixelBufferGetHeightOfPlane(imageBuffer, 0);
            bytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(imageBuffer, 0);

        } else { // expect kCVPixelFormatType_32BGRA

            format_opencv = CV_8UC4;

            bufferAddress = CVPixelBufferGetBaseAddress(imageBuffer);
            width = CVPixelBufferGetWidth(imageBuffer);
            height = CVPixelBufferGetHeight(imageBuffer);
            bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);

        }

        // delegate image processing to the delegate
        cv::Mat image((int)height, (int)width, format_opencv, bufferAddress, bytesPerRow);

        CGImage* dstImage;

        if ([self.delegate respondsToSelector:@selector(processImage:)]) {
            [self.delegate processImage:image];
        }

        // check if matrix data pointer or dimensions were changed by the delegate
        bool iOSimage = false;
        if (height == (size_t)image.rows && width == (size_t)image.cols && format_opencv == image.type() && bufferAddress == image.data && bytesPerRow == image.step) {
            iOSimage = true;
        }


        // (create color space, create graphics context, render buffer)
        CGBitmapInfo bitmapInfo;

        // basically we decide if it's a grayscale, rgb or rgba image
        if (image.channels() == 1) {
            colorSpace = CGColorSpaceCreateDeviceGray();
            bitmapInfo = kCGImageAlphaNone;
        } else if (image.channels() == 3) {
            colorSpace = CGColorSpaceCreateDeviceRGB();
            bitmapInfo = kCGImageAlphaNone;
            if (iOSimage) {
                bitmapInfo |= kCGBitmapByteOrder32Little;
            } else {
                bitmapInfo |= kCGBitmapByteOrder32Big;
            }
        } else {
            colorSpace = CGColorSpaceCreateDeviceRGB();
            bitmapInfo = kCGImageAlphaPremultipliedFirst;
            if (iOSimage) {
                bitmapInfo |= kCGBitmapByteOrder32Little;
            } else {
                bitmapInfo |= kCGBitmapByteOrder32Big;
            }
        }

        if (iOSimage) {
            context = CGBitmapContextCreate(bufferAddress, width, height, 8, bytesPerRow, colorSpace, bitmapInfo);
            dstImage = CGBitmapContextCreateImage(context);
            CGContextRelease(context);
        } else {

            NSData *data = [NSData dataWithBytes:image.data length:image.elemSize()*image.total()];
            CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);

            // Creating CGImage from cv::Mat
            dstImage = CGImageCreate(image.cols,                                 // width
                                     image.rows,                                 // height
                                     8,                                          // bits per component
                                     8 * image.elemSize(),                       // bits per pixel
                                     image.step,                                 // bytesPerRow
                                     colorSpace,                                 // colorspace
                                     bitmapInfo,                                 // bitmap info
                                     provider,                                   // CGDataProviderRef
                                     NULL,                                       // decode
                                     false,                                      // should interpolate
                                     kCGRenderingIntentDefault                   // intent
                                     );

            CGDataProviderRelease(provider);
        }


        // render buffer
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.customPreviewLayer.contents = (__bridge id)dstImage;
        });


//        if (self.recordVideo == YES) {
//            lastSampleTime = CMSampleBufferGetPresentationTimeStamp(sampleBuffer);
////			CMTimeShow(lastSampleTime);
//            if (self.recordAssetWriter.status != AVAssetWriterStatusWriting) {
//                [self.recordAssetWriter startWriting];
//                [self.recordAssetWriter startSessionAtSourceTime:lastSampleTime];
//                if (self.recordAssetWriter.status != AVAssetWriterStatusWriting) {
//                    NSLog(@"[Camera] Recording Error: asset writer status is not writing: %@", self.recordAssetWriter.error);
//                    return;
//                } else {
//                    NSLog(@"[Camera] Video recording started");
//                }
//            }
//
//            if (self.recordAssetWriterInput.readyForMoreMediaData) {
//                CVImageBufferRef pixelBuffer = [self pixelBufferFromCGImage:dstImage];
//                if (! [self.recordPixelBufferAdaptor appendPixelBuffer:pixelBuffer
//                                                  withPresentationTime:lastSampleTime] ) {
//                    NSLog(@"Video Writing Error");
//                }
//            }
//
//        }


        // cleanup
        CGImageRelease(dstImage);

        CGColorSpaceRelease(colorSpace);

        CVPixelBufferUnlockBaseAddress(imageBuffer, 0);
    }
}


- (void)updateOrientation;
{
    if (self.rotateVideo == YES)
    {
        NSLog(@"rotate..");
        self.customPreviewLayer.bounds = CGRectMake(0, 0, self.parentView.frame.size.width, self.parentView.frame.size.height);
        [self layoutPreviewLayer];
    }
}

- (NSURL *)videoFileURL;
{
    NSString *outputPath = [[NSString alloc] initWithFormat:@"%@%@", NSTemporaryDirectory(), @"output.mov"];
    NSURL *outputURL = [NSURL fileURLWithPath:outputPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:outputPath]) {
        NSLog(@"file exists");
    }
    return outputURL;
}



- (NSString *)videoFileString;
{
    NSString *outputPath = [[NSString alloc] initWithFormat:@"%@%@", NSTemporaryDirectory(), @"output.mov"];
    return outputPath;
}

@end
