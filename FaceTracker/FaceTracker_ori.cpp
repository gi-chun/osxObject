
//#include <OpenCV/OpenCV.h>
#include <opencv2/opencv.hpp>

#include <cassert>
#include <iostream>


const char  * WINDOW_NAME  = "Face Tracker";
const CFIndex CASCADE_NAME_LEN = 2048;
      char    CASCADE_NAME[CASCADE_NAME_LEN] = "~/opencv/data/haarcascades/haarcascade_frontalface_alt2.xml";

using namespace std;

int main (int argc, char * const argv[])
{
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    const int scale = 2;

    // locate haar cascade from inside application bundle
    // (this is the mac way to package application resources)
    CFBundleRef mainBundle  = CFBundleGetMainBundle ();
    assert (mainBundle);
    CFURLRef    cascade_url = CFBundleCopyResourceURL (mainBundle, CFSTR("haarcascade_frontalface_alt2"), CFSTR("xml"), NULL);
    assert (cascade_url);
    Boolean     got_it      = CFURLGetFileSystemRepresentation (cascade_url, true,
                                                                reinterpret_cast<UInt8 *>(CASCADE_NAME), CASCADE_NAME_LEN);
    if (! got_it)
        abort ();

    // create all necessary instances
    cvNamedWindow (WINDOW_NAME, CV_WINDOW_AUTOSIZE);
    CvCapture * camera = cvCreateCameraCapture (CV_CAP_ANY);
    CvHaarClassifierCascade* cascade = (CvHaarClassifierCascade*) cvLoad (CASCADE_NAME, 0, 0, 0);
    CvMemStorage* storage = cvCreateMemStorage(0);
    assert (storage);

    // you do own an iSight, don't you ?!?
    if (! camera)
        abort ();

    // did we load the cascade?!?
    if (! cascade)
        abort ();

    // get an initial frame and duplicate it for later work
    IplImage *  current_frame = cvQueryFrame (camera);
    IplImage *  draw_image    = cvCreateImage(cvSize (current_frame->width, current_frame->height), IPL_DEPTH_8U, 3);
    IplImage *  gray_image    = cvCreateImage(cvSize (current_frame->width, current_frame->height), IPL_DEPTH_8U, 1);
    IplImage *  small_image   = cvCreateImage(cvSize (current_frame->width / scale, current_frame->height / scale), IPL_DEPTH_8U, 1);
    assert (current_frame && gray_image && draw_image);

    // as long as there are images ...
    while (current_frame = cvQueryFrame (camera))
    {
        // convert to gray and downsize
        cvCvtColor (current_frame, gray_image, CV_BGR2GRAY);
        cvResize (gray_image, small_image, CV_INTER_LINEAR);

        // detect faces
        CvSeq* faces = cvHaarDetectObjects (small_image, cascade, storage,
                                            1.1, 2, CV_HAAR_DO_CANNY_PRUNING,
                                            cvSize (30, 30));

        // draw faces
        cvFlip (current_frame, draw_image, 1);
        for (int i = 0; i < (faces ? faces->total : 0); i++)
        {
            CvRect* r = (CvRect*) cvGetSeqElem (faces, i);
            CvPoint center;
            int radius;
            center.x = cvRound((small_image->width - r->width*0.5 - r->x) *scale);
            center.y = cvRound((r->y + r->height*0.5)*scale);
            radius = cvRound((r->width + r->height)*0.25*scale);
            cvCircle (draw_image, center, radius, CV_RGB(0,255,0), 3, 8, 0 );
        }

        // just show the image
        cvShowImage (WINDOW_NAME, draw_image);

        // wait a tenth of a second for keypress and window drawing
//        int key = cvWaitKey (100);
//        int key = cvWaitKey (50);
//        if (key == 'q' || key == 'Q'){
//            break;
//        }
        
        if (cv::waitKey(50) >= 0)
            break;
    }

    // be nice and return no error
    return 0;
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
//    //Capture stream from webcam.
//    cv::VideoCapture capture(0);
//    
//    //Check if we can get the webcam stream.
//    if(!capture.isOpened())
//    {
//        std::cout << "Could not open camera" << std::endl;
//        return -1;
//    }
//    
//    //OpenCV saves detection rules as something called a CascadeClassifier which
//    //    can be used to detect objects in images.
//    cv::CascadeClassifier faceCascade;
//    
//    //We'll load the lbpcascade_frontalface.xml containing the rules to detect faces.
//    //The file should be right next to the binary.
//    if(!faceCascade.load("lbpcascade_frontalface.xml"))
//    {
//        std::cout << "Failed to load cascade classifier" << std::endl;
//        return -1;
//    }
//    
//    while (true)
//    {
//        //This variable will hold the image from the camera.
//        cv::Mat cameraFrame;
//        
//        //Read an image from the camera.
//        capture.read(cameraFrame);
//        
//        //This vector will hold the rectangle coordinates to a detection inside the image.
//        std::vector<cv::Rect> faces;
//        
//        //This function detects the faces in the image and
//        // places the rectangles of the faces in the vector.
//        //See the detectMultiScale() documentation for more details
//        // about the rest of the parameters.
//        
////        faceCascade.detectMultiScale(
////                                     cameraFrame,
////                                     faces,
////                                     1.09,
////                                     3,
////                                     0 | CV_HAAR_SCALE_IMAGE,
////                                     cv::Size(30, 30));
//        faceCascade.detectMultiScale(
//                                     cameraFrame,
//                                     faces,
//                                     1.09,
//                                     3);
//
//        
//        //Here we draw the rectangles onto the image with a red border of thikness 2.
//        for( size_t i = 0; i < faces.size(); i++ )
//            cv::rectangle(cameraFrame, faces[i], cv::Scalar(0, 0, 255), 2);
//        
//        //Here we show the drawn image in a named window called "output".
//        cv::imshow("output", cameraFrame);
//        
//        //Waits 50 miliseconds for key press, returns -1 if no key is pressed during that time
//        if (cv::waitKey(50) >= 0)
//            break;
//    }
//    
//    return 0;
}
