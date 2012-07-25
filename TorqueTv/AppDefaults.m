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
        
        defaults = [NSUserDefaults standardUserDefaults];
       
        NSLog(@"loaded remote with %d", [defaults boolForKey:@"remote"]);
        remote = [defaults boolForKey:@"remote"];
        NSLog(@"self.remote is now %d", remote);
        
        
        br = [defaults stringForKey:@"br"];        
        
        if([NSNumber numberWithBool:self.remote] == nil){
            self.remote = YES;
            
        }

        if(self.br == nil){
            self.br = @"64";
        }
        NSLog(@"loaded remote:%d. br:%@", self.remote, self.br);

        
    }
    return self;
}

-(void)setRemote:(BOOL)_remote{
    [defaults setBool:_remote forKey:@"remote"];
}

-(void)setBr:(NSString *)_br{
    [defaults setObject:_br forKey:@"br"];
}


+(AppDefaults*)appDefaults{
    static AppDefaults *appDefaults = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        appDefaults = [[self alloc]init];
    });
    
    return appDefaults;
}


@end
