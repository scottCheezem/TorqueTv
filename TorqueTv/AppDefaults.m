//
//  AppDefaults.m
//  TorqueTv
//
//  Created by Scott Cheezem on 7/23/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import "AppDefaults.h"

@implementation AppDefaults
@synthesize br;
@synthesize remote;


-(id)init{
    self = [super init];
    if(self != nil){
        self.remote = YES;
        self.br = @"64";
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.remote = [defaults boolForKey:@"remote"];
        self.br = [defaults stringForKey:@"br"];
        
    }
    
}

@end
