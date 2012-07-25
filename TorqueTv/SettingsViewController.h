//
//  SettingsViewController.h
//  TorqueTv
//
//  Created by Scott Cheezem on 7/20/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "AppDefaults.h"

@interface SettingsViewController : UIViewController{
    NSArray *qualityOptions;
}
@property (weak, nonatomic) IBOutlet UISwitch *remoteToggle;
@property (weak, nonatomic) IBOutlet UISegmentedControl *qualitySeg;

- (IBAction)remotetoggleAction:(id)sender;
- (IBAction)qualitySegAction:(id)sender;

@end
