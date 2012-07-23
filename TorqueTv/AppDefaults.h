//
//  AppDefaults.h
//  TorqueTv
//
//  Created by Scott Cheezem on 7/23/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDefaults : NSObject
@property(nonatomic, retain)NSString* br;
@property(nonatomic)BOOL remote;
+(AppDefaults*)appDefaults;
@end
