
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#include <opencv2/core.hpp>
#include <opencv2/opencv.hpp>
#include <opencv2/features2d/features2d.hpp>
#include <opencv2/nonfree/nonfree.hpp>
#include <opencv2/nonfree/features2d.hpp>
#include <opencv2/ml/ml.hpp>

using namespace std;
using namespace cv;

int main (int argc, char * const argv[])
{
    
    // -------------------------------------------------------------------------
    // webcam routine
    cv::VideoCapture capture(0);
    
    if( !capture.isOpened() ) {
        std::cerr << "Could not open camera" << std::endl;
        return 0;
    }
    
    // create a window
    cv::namedWindow("webcam",1);
    
    // -------------------------------------------------------------------------
    // SIFT configuration
    if ( argc != 2 ) {
        std::cerr << "usage: ocv_cam_sift filename" << std::endl;
        return 0;
    }
    
    cv::Mat db_original = cv::imread(argv[1],CV_LOAD_IMAGE_GRAYSCALE);
    cv::Mat db;
    
    cv::resize( db_original, db, cv::Size(db_original.cols/2,
                                          db_original.rows/2),0,0,CV_INTER_NN);
    
    // SIFT feature detector and feature extractor
    cv::SiftFeatureDetector detector( 0.05, 5.0 );
    cv::SiftDescriptorExtractor extractor( 3.0 );
    
    // Feature detection
    std::vector<cv::KeyPoint> kps_db;
    detector.detect( db, kps_db );
    
    // Feature description
    cv::Mat dscr_db;
    extractor.compute( db, kps_db, dscr_db );
    
    while (true) {
        bool frame_valid = true;
        
        cv::Mat frame_original;
        cv::Mat frame;
        
        try {
            capture >> frame_original; // get a new frame from webcam
            cv::resize(frame_original,frame,cv::Size(frame_original.cols/2,
                                                     frame_original.rows/2),0,0,CV_INTER_NN); // downsample 1/2x
        } catch(cv::Exception& e) {
            std::cerr << "Exception occurred. Ignoring frame... " << e.err
            << std::endl;
            frame_valid = false;
        }
        
        if (frame_valid) {
            try {
                // convert captured frame to gray scale & equalize
                cv::Mat grayframe;
                cv::cvtColor(frame, grayframe, CV_BGR2GRAY);
                cv::equalizeHist(grayframe,grayframe);
                
                // -------------------------------------------------------------
                // face detection routine
                
                // keypoint detection
                std::vector<cv::KeyPoint> kps_frame;
                detector.detect( grayframe, kps_frame);
                
                // keypoint description
                cv::Mat dscr_frame;
                extractor.compute( grayframe, kps_frame, dscr_frame);
                
                // matching using FLANN matcher
                cv::FlannBasedMatcher matcher;
                std::vector<cv::DMatch> matches;
                matcher.match(dscr_db, dscr_frame, matches);
                
                double max_dist = 0.0, min_dist = 100.0;
                
                for(int i=0; i<matches.size(); i++) {
                    double dist = matches[i].distance;
                    if ( dist < min_dist ) min_dist = dist;
                    if ( dist > max_dist ) max_dist = dist;
                }
                
                // drawing only good matches (dist less than 2*min_dist)
                std::vector<cv::DMatch> good_matches;
                
                for (int i=0; i<matches.size(); i++) {
                    if (matches[i].distance <= 2*min_dist) {
                        good_matches.push_back( matches[i] );
                    }
                }
                
                cv::Mat img_matches;
                cv::drawMatches(db, kps_db, frame, kps_frame, good_matches,
                                img_matches, cv::Scalar::all(-1), cv::Scalar::all(-1),
                                std::vector<char>(),
                                cv::DrawMatchesFlags::NOT_DRAW_SINGLE_POINTS);
                
                // print the output
                cv::imshow("webcam", img_matches);
                
            } catch(cv::Exception& e) {
                std::cerr << "Exception occurred. Ignoring frame... " << e.err
                << std::endl;
            }
        }
        if (cv::waitKey(30) >= 0) break;
    }
    
    // VideoCapture automatically deallocate camera object
    return 0;
}
