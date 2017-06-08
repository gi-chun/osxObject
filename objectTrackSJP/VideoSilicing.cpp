//
//  VideoSilicing.cpp
//  objectTrackSJP
//
//  Created by gclee on 2016. 8. 18..
//  Copyright © 2016년 SJPlap. All rights reserved.
//

#include "VideoSilicing.h"
#include <opencv2/opencv.hpp>

int VideoSilicing::processVideo(char const *fileName){
    
    //to do code
    
    return 0;
}

int VideoSilicing::getVideoWidth(char const *fileName){
    int width = 0;
    
    //to do code
    
    return width;
}

int VideoSilicing::getVideoHeight(char const *fileName){
    cv::VideoCapture capture(fileName); // open file
    
    int height = 0;
    
    //to do code
    
    return height;
}