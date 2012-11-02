//
//  Episode.h
//  TorqueTv
//
//  Created by Scott Cheezem on 7/16/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Episode : NSObject
@property(nonatomic, retain)NSString* epTitle;
@property(nonatomic, retain)NSString* path;
@property(nonatomic, retain)NSString* epCode;
@property(nonatomic, retain)NSString* thumb;
@property(nonatomic, retain)NSString* plot;
@property(nonatomic, retain)NSString* watched;
@end
