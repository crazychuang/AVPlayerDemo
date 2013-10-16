//
//  ViewController.m
//  AVPlayerDemo
//
//  Created by boai on 13-8-27.
//  Copyright (c) 2013年 bravetorun. All rights reserved.
//

#import "ViewController.h"
#import "playerPage.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)player:(id)sender {
    playerPage *_player = [[playerPage alloc] init];
    [self.navigationController pushViewController:_player animated:YES];
}
@end
