//
//  NowPlayingViewController.h
//  TorqueTv
//
//  Created by Scott Cheezem on 7/17/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "browserView.h"
@interface NowPlayingViewController : UIViewController{
    NSMutableData *recievedData;
}
@property(nonatomic, retain)NSString* path;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
- (IBAction)stopAction:(id)sender;





@property(nonatomic, retain)UIWebView* webVideo;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;
- (IBAction)refreshAction:(id)sender;



@end
