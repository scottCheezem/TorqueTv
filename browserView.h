//
//  browserView.h
//  TorqueTv
//
//  Created by Scott Cheezem on 7/16/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Show.h"
#import "Episode.h"

@interface browserView : UITableViewController<UITableViewDelegate>{
    NSMutableArray* shows;
}

@end
