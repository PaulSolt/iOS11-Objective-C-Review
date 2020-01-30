//
//  ViewController.m
//  XKCDComics
//
//  Created by morse on 1/30/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import "ViewController.h"
#import "Comic.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *baseURL = [NSURL URLWithString:@"http://xkcd.com"];
//    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES]
    
    int comicNumber = 2261;
    NSString *comicNumberString = [NSString stringWithFormat:@"%i", comicNumber];
    NSURL *url = [[baseURL URLByAppendingPathComponent:comicNumberString] URLByAppendingPathComponent:@"info.0.json"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Data!");
        
    }] resume];
    
    
    
//    /614/info.0.json
    
    
    
    
    
    
    
    
}


@end
