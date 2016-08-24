//
//  main.cpp
//  objectTrackingSJPlapOne
//
//  Created by gclee on 2016. 8. 18..
//  Copyright © 2016년 SJPlap. All rights reserved.
//

#include <iostream>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/core/core.hpp"

using namespace cv;

int main(int argc, const char * argv[]) {
//    insert code here...
//    std::cout << "Hello, World!\n";
//    return 0;
    
    VideoCapture cap(0);
    
    while (true){
        
        Mat Webcam;
        cap.read(Webcam);
        imshow("Webcam", Webcam);
    }
    
    
}
