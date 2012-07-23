//
//  DetailsViewController.h
//  TorqueTv
//
//  Created by Scott Cheezem on 7/23/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UITableViewController<UITableViewDelegate>{
    NSArray *details;
}
@property(nonatomic, retain)NSString* thumbUrl;
@property(nonatomic, retain)NSString* plot;

@end
