//
//  DetailViewController.m
//  TorqueTv
//
//  Created by Scott Cheezem on 7/25/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize thumbImage;
@synthesize plotText;
@synthesize thumbUrl, plot;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //lazy load image view
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{
        NSData *imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:self.thumbUrl]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            thumbImage.image = [UIImage imageWithData:imageData]; 
        });
    });
    
    
    //set text
    
    
    self.plotText.text = self.plot;
    
    
    
}

- (void)viewDidUnload
{
    [self setThumbImage:nil];
    [self setPlotText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;//(interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
