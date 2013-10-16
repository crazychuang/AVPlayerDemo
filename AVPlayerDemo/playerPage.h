//
//  playerPage.h
//  AVPlayerDemo
//
//  Created by boai on 13-8-27.
//  Copyright (c) 2013年 bravetorun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoPlayerKit.h"

@interface playerPage : UIViewController <VideoPlayerDelegate>

@property (retain, nonatomic) VideoPlayerKit *videoPlayerViewController;

- (IBAction)backBtnPressed:(id)sender;
@end
