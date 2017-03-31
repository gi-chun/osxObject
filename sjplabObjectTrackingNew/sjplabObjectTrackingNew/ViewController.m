//
//  ViewController.m
//  sjplabObjectTrackingNew
//
//  Created by gclee on 2017. 3. 20..
//  Copyright © 2017년 SJPlab. All rights reserved.
//


#import "ViewController.h"

#define degreeToRadian(x) (M_PI * x / 180.0)
#define radianToDegree(x) (180.0 * x / M_PI)

@interface ViewController (){

    __weak IBOutlet AAPLPlayerView *myPlayerView;
    
}
@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden {
    
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //call splash viewcontroler
//    splashVC = [[SplashViewController alloc] init];
//    //self.navigationController.modalPresentationStyle = UIModalPresentationCurrentContext;
//    [self presentViewController:splashVC animated:YES completion:nil];
    
//    if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
//       
//    } else {
//        [self presentModalViewController:splashVC animated:NO];
//    }
    
//    splashVC.view.alpha = 0;
//    [UIView animateWithDuration:0.5 animations:^{
//        splashVC.view.alpha = 1;
//    }];
    
   
}

- (void)rotateVideoPlayerWithDegree:(CGFloat)degree {
    [_in_playerLayer setAffineTransform:CGAffineTransformMakeRotation(degreeToRadian(degree))];
}

- (void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(orientationChanged:)    name:UIDeviceOrientationDidChangeNotification  object:nil];
}

- (void)orientationChanged:(NSNotification *)notification{
    [self adjustViewsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
    //[self adjustViewsForOrientation:[[UIDevice currentDevice] orientation]];
}

- (void) adjustViewsForOrientation:(UIInterfaceOrientation) orientation {
    
    switch (orientation)
    {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
        {
            //load the portrait view
            NSLog(@"load the portrait view");
            //[self rotateVideoPlayerWithDegree:0];
            //in_playerLayer.frame = self.view.bounds;
        }
            
            break;
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
        {
            //load the landscape view
             NSLog(@"load the landscape view");
            //[self rotateVideoPlayerWithDegree:90];
            //in_playerLayer.frame = self.view.bounds;
        }
            break;
        case UIInterfaceOrientationUnknown:break;
    }
}


- (void)viewDidAppear:(BOOL)animated{
    
    NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"splash_sample" ofType:@"mp4"]];
    AVPlayer* player = [AVPlayer playerWithURL:videoURL];
    
//    AVPlayerLayer* playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
//    playerLayer.frame = self.view.bounds; //subView.bounds
//    playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill; //AVLayerVideoGravityResizeAspectFill
//    playerLayer.needsDisplayOnBoundsChange = YES;
//    in_playerLayer = playerLayer;
//    
//    [self->subView.layer addSublayer:playerLayer];
//    self->subView.layer.needsDisplayOnBoundsChange = YES;
    
    myPlayerView.player = _player = player;
    //myPlayerView.player = player;
    myPlayerView.playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieFinishedCallback:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
    
    [self.player play];

}

- (void)viewDidDisappear:(BOOL)animated{
    
    [self.player pause];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)movieFinishedCallback:(NSNotification*)aNotification
{
    
    [self showMainVC:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMainVC:(id)sender {
    
    
//        [self dismissViewControllerAnimated:YES completion:Nil];
//        self.player = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
    
    [self performSegueWithIdentifier:@"se_show_menu" sender:self];
    

}

@end
