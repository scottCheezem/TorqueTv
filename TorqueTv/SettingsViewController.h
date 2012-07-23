//
//  SettingsViewController.h
//  TorqueTv
//
//  Created by Scott Cheezem on 7/20/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *remoteToggle;
@property (weak, nonatomic) IBOutlet UISegmentedControl *qualitySeg;


@end
