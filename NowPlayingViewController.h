//
//  NowPlayingViewController.h
//  TorqueTv
//
//  Created by Scott Cheezem on 7/17/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "browserView.h"
@interface NowPlayingViewController : UIViewController{
    NSMutableData *recievedData;
}
@property(nonatomic, retain)NSString* path;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
- (IBAction)stopAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *mpcontainer;
@property(nonatomic, retain)UIWebView* webVideo;

@property(nonatomic, retain)MPMoviePlayerViewController *player;
-(void)enterFullScreen;
-(void)exitFullScreen;
@end
