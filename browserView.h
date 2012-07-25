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
#define VIDEO_STREAM_URL @"/streaming/showstream.m3u8"


#import <UIKit/UIKit.h>
#import "AppDefaults.h"
#import "NowPlayingViewController.h"
#import "DetailViewController.h"
#import "Show.h"
#import "Episode.h"

@interface browserView : UITableViewController<UITableViewDelegate>{
    NSMutableArray* shows;
    NSMutableData *recievedData;
    NSIndexPath *selected;
    
}
@property(nonatomic, retain)NSString* showdetailsId;

-(void)sendPost:(NSString*)urlString :(NSString*)postString delegate:(id)delegate;

@end
