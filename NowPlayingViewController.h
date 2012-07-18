//
//  NowPlayingViewController.h
//  TorqueTv
//
//  Created by Scott Cheezem on 7/17/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NowPlayingViewController : UIViewController
@property(nonatomic, retain)NSString* path;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;

@end
