//
//  DetailViewController.h
//  TorqueTv
//
//  Created by Scott Cheezem on 7/25/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController{
    
}

@property(nonatomic, weak)NSString* thumbUrl;
@property(nonatomic, weak)NSString* plot;

@property (weak, nonatomic) IBOutlet UIImageView *thumbImage;
@property (weak, nonatomic) IBOutlet UILabel *plotText;

@end
