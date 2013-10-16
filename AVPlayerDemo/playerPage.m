//
//  playerPage.m
//  AVPlayerDemo
//
//  Created by boai on 13-8-27.
//  Copyright (c) 2013年 bravetorun. All rights reserved.
//

#import "playerPage.h"

@interface playerPage ()

@end

@implementation playerPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidDisappear:(BOOL)animated
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //监听设备方向
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    NSURL *url = [NSURL URLWithString:@"http://v.youku.com/player/getM3U8/vid/XMzc0ODExMzEy/type/mp4/flv/v.m3u8"];
    if (url) {
        if (!self.videoPlayerViewController) {
            self.videoPlayerViewController = [VideoPlayerKit videoPlayerWithContainingViewController:self optionalTopView:nil hideTopViewWithControls:YES];
            self.videoPlayerViewController.delegate = self;
            self.videoPlayerViewController.allowPortraitFullscreen = NO;
        }
        [self.videoPlayerViewController.view setFrame:CGRectMake(0, 0, 320, 230)];
        [self.view addSubview:self.videoPlayerViewController.view];
        [self.videoPlayerViewController playVideoWithTitle:@"" URL:url videoID:nil shareURL:nil isStreaming:NO playInFullScreen:YES];
    }
}

- (void)fullScreen
{
    if (!self.videoPlayerViewController.fullScreenModeToggled) {
        [self.videoPlayerViewController launchFullScreen];
    } else {
        [self.videoPlayerViewController minimizeVideo];
    }
}

/**
 * @brief 横屏时自动进入全屏，竖屏时退出全屏
 */
- (void)orientationChanged:(NSNotification *)notification
{
    if ((UIInterfaceOrientationIsPortrait([[notification object] orientation])
         && self.videoPlayerViewController.fullScreenModeToggled)
        || (UIInterfaceOrientationIsLandscape([[notification object] orientation])
            && !self.videoPlayerViewController.fullScreenModeToggled)) {
            [self.videoPlayerViewController fullScreenButtonHandler];
        }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnPressed:(id)sender {
    
    if ([self.videoPlayerViewController isPlaying]) {
        [self.videoPlayerViewController.videoPlayer pause];
    }
    self.videoPlayerViewController.videoPlayer = nil;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
