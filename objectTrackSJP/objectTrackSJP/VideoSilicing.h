//
//  VideoSilicing.h
//  objectTrackSJP
//
//  Created by gclee on 2016. 8. 18..
//  Copyright © 2016년 SJPlap. All rights reserved.
//

#ifndef VideoSilicing_h
#define VideoSilicing_h

#include <stdio.h>

class VideoSilicing {
public:
    static int processVideo(char const *fileName);
    static int getVideoWidth(char const *fileName);
    static int getVideoHeight(char const *fileName);
};

#endif /* VideoSilicing_h */
