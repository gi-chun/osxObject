//
//  ObjVideoSilicing.h
//  objectTrackSJP
//
//  Created by gclee on 2016. 8. 18..
//  Copyright © 2016년 SJPlap. All rights reserved.
//

#ifndef ObjVideoSilicing_h
#define ObjVideoSilicing_h

#import <Foundation/Foundation.h>

@interface ObjVideoSilicing : NSObject

+ (void) objProcessVideoArea:(NSString*)fileName area:(NSRect)area;

+ (int) objGetVideoWidth: (NSString*) fileName;
+ (int) objGetVideoHeight: (NSString*) fileName;


@end

#endif /* ObjVideoSilicing_h */
