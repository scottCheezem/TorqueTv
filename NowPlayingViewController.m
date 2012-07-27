//
//  NowPlayingViewController.m
//  TorqueTv
//
//  Created by Scott Cheezem on 7/17/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import "NowPlayingViewController.h"

@interface NowPlayingViewController ()

@end

@implementation NowPlayingViewController

@synthesize webVideo;
@synthesize refreshButton;

@synthesize stopButton, path;

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
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setStopButton:nil];
    

    [self setRefreshButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewDidAppear:(BOOL)animated{
    
    
    if(![self.view.subviews containsObject:webVideo]){
//        NSString *urlString = ([[AppDefaults appDefaults]remote])?REMOTE_HOST:LOCAL_HOST;
//        NSURL *videoUrl = [[NSURL alloc]initWithString:[urlString stringByAppendingString:VIDEO_STREAM_URL]];
//        NSString* html = [NSString stringWithFormat:@"<video src='%@' width=%d height=%d controls autoplay></video>", videoUrl, 320, 230];
//        webVideo = [[UIWebView alloc]initWithFrame:CGRectMake(-5, 0, self.view.frame.size.width, 230)];
//        //webVideo.frame = CGRectMake(-5, 0, self.view.frame.size.width, 230);
//        
//
//        [self.view addSubview:webVideo];
//        [webVideo loadHTMLString:html baseURL:nil];
        
        
        [self refreshPlayer];
        
    }


    
    
   
    
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}


-(void)stopStream{
    
    //send post to stop stream
    //UINavigationController *nc = (UINavigationController*)[self.tabBarController.viewControllers objectAtIndex:0];
    browserView *browser = [[browserView alloc]init];//[nc.viewControllers objectAtIndex:1];
    NSString *host = ([[AppDefaults appDefaults]remote])?REMOTE_HOST:LOCAL_HOST;
    [browser sendPost:[host stringByAppendingString:STREAM_CONTROL] :@"act=stop" delegate:self];
    
    
    
}

-(void)refreshPlayer{
    [webVideo removeFromSuperview];
    
    webVideo = nil;
    NSString *urlString = ([[AppDefaults appDefaults]remote])?REMOTE_HOST:LOCAL_HOST;
    NSURL *videoUrl = [[NSURL alloc]initWithString:[urlString stringByAppendingString:VIDEO_STREAM_URL]];
    NSString* html = [NSString stringWithFormat:@"<video src='%@' width=%d height=%d controls></video>", videoUrl, 320, 230];
    webVideo = [[UIWebView alloc]initWithFrame:CGRectMake(-5, 0, self.view.frame.size.width, 230)];
    //webVideo.frame = CGRectMake(-5, 0, self.view.frame.size.width, 230);
    
    
    [self.view addSubview:webVideo];
    [webVideo loadHTMLString:html baseURL:nil];
}


-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"npvc - recieved Response %@", response);
}

-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data{    
    NSLog(@"npvc - recieved data %@", data);    

}

-(void)connectionDidFinishLoading:(NSURLConnection*) connection{
    NSLog(@"now playing - connection finished");
    
}


- (IBAction)stopAction:(id)sender {
    [self stopStream];
}
- (IBAction)refreshAction:(id)sender {
    [self refreshPlayer];
}
@end
