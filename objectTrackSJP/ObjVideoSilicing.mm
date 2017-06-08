//
//  ObjVideoSilicing.m
//  objectTrackSJP
//
//  Created by gclee on 2016. 8. 18..
//  Copyright © 2016년 SJPlap. All rights reserved.
//

#import "ObjVideoSilicing.h"
#import "VideoSilicing.h"

@implementation ObjVideoSilicing

+ (void) objProcessVideoArea: (NSString*) fileName area:(NSRect)area {
    char const *p = [fileName UTF8String];
    
    VideoSilicing::processVideo(p);
}

+ (int) objGetVideoWidth: (NSString*) fileName {
    char const *p = [fileName UTF8String];
    return VideoSilicing::getVideoWidth(p);
}

+ (int) objGetVideoHeight: (NSString*) fileName {
    char const *p = [fileName UTF8String];
    return VideoSilicing::getVideoHeight(p);
} 

@end