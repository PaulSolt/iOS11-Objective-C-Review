//
//  Comic.h
//  XKCDComics
//
//  Created by morse on 1/30/20.
//  Copyright © 2020 morse. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Comic : NSObject

@property int num;
@property int month;
@property int day;
@property int year;
@property NSString *news;
@property NSString *title;
@property NSString *safeTitle;
@property NSString *transcript;
@property NSString *alt;
@property NSURL *imageURL;

@end

NS_ASSUME_NONNULL_END
