//
//  ViewController.m
//  XKCDComics
//
//  Created by morse on 1/30/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "ViewController.h"
#import "Comic.h"
#import "LSILog.h"
#import "LSIErrors.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *baseURL = [NSURL URLWithString:@"https://xkcd.com"];
//    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES]
    
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
    
    
    
//    /614/info.0.json
    
    
    
    
    
    
    
    
}


@end
