//
//  ViewController.m
//  XKCD Comics
//
//  Created by Paul Solt on 1/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "LSILog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//     Is there an interface for automated systems to access comics and metadata?
//    Yes. You can get comics through the JSON interface, at URLs like http://xkcd.com/info.0.json (current comic) and http://xkcd.com/614/info.0.json (comic #614).
    //    https://.xkcd.com/comics/worst_thing_that_could_happen.png
    // http://xkcd.com/info.0.json = 2261

    NSURL *baseURL = [NSURL URLWithString:@"https://xkcd.com/"];
//    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    int comicNumber = 2261;
    NSString *comicNumberString = [NSString stringWithFormat:@"%i", comicNumber];
    NSURL *url = [[baseURL URLByAppendingPathComponent:comicNumberString] URLByAppendingPathComponent:@"info.0.json"];


    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error) {
            NSLog(@"Error: %@", error);
            // TODO: Completion
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        NSLog(@"JSON: %@", json);

        
        
        
    }] resume];
}


@end
