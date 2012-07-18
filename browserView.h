//
//  browserView.h
//  TorqueTv
//
//  Created by Scott Cheezem on 7/16/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#define REMOTE_HOST @"http://theroyalwe.net/~user"
#define LOCAL_HOST @"http://ubunbox.local/~user"
#define XBMC_SERVICE @"/torqueTv/xbmcConnect.php"
#define STREAM_CONTROL @"/torqueTv/streamcontrol.php"


#import <UIKit/UIKit.h>
#import "NowPlayingViewController.h"
#import "Show.h"
#import "Episode.h"

@interface browserView : UITableViewController<UITableViewDelegate>{
    NSMutableArray* shows;
    NSMutableData *recievedData;
    
}
@property(nonatomic, retain)NSString* showdetailsId;
@end
