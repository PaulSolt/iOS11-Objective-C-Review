//
//  ViewController.m
//  XKCD Comics
//
//  Created by Paul Solt on 1/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "LSILog.h"
#import "LSIErrors.h"
#import "Comic.h"

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
        
        if (!data) {
            NSError *dataError = errorWithMessage(@"Data is missing", LSIDataNilError);
            NSLog(@"Error: %@", dataError);
            // TODO: Completion
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        NSLog(@"JSON: %@", json);

        Comic *comic = [[Comic alloc] initWithDictionary:json];
        
        NSLog(@"Comic: %@", comic.imageURL);
        
        [self downloadImage:comic.imageURL];
        
//        [self downloadImage:[NSURL URLWithString:@"https://apod.nasa.gov/apod/image/2001/C2017T2_2020-01-24-26-28_posta.jpg"]];
        
        NSURL *testImageURL = [[NSBundle mainBundle] URLForResource:@"comic" withExtension:@"png"];
        NSLog(@"testImage; %@", testImageURL);
        
        
        NSData *data1 = [NSData dataWithContentsOfURL:testImageURL];
        NSLog(@"data1: %@", data1);
        UIImage *image = [UIImage imageWithContentsOfFile:testImageURL.path];
        NSLog(@"image: %@", image);
        
        // Download image
        // UI Update

        
    }] resume];
}

- (void)downloadImage:(NSURL *)url {
    
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    NSLog(@"Data2: %@", data);
//    UIImage *image = [UIImage imageWithData:data];
//    NSLog(@"Image: %@", image);

    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if (error) {
            NSLog(@"Error: %@", error);
            // TODO: Completion
        }

        if (!data) {
            NSError *dataError = errorWithMessage(@"Data is missing", LSIDataNilError);
            NSLog(@"Error: %@", dataError);
            // TODO: Completion
        }
        
        UIImage *image = [UIImage imageWithData:data];
        NSLog(@"Image: %@", image);

//        NSLog(@"Response: %@", response);
        
        dispatch_async(dispatch_get_main_queue(), ^{
//            self.imageView.image = image;
        });
        
    }] resume];
}

@end
