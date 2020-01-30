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

// Private Outlets
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

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
    
    int comicNumber = 417; //2260;
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
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.titleLabel.text = comic.title;
        });

        [self downloadImage:comic.imageURL];
    
    }] resume];
}

- (void)downloadImage:(NSURL *)url {
    
    // Load an image synchronously (good for testing without async logic)
//    NSData *data = [NSData dataWithContentsOfURL:url];
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
            self.imageView.image = image;
        });
        
    }] resume];
}

@end
