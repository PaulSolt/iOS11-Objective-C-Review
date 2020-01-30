//
//  Comic.h
//  XKCD Comics
//
//  Created by Paul Solt on 1/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Comic : NSObject

// primitive data types don't need copy
@property (nonatomic) int num;
@property (nonatomic) int month;
@property (nonatomic) int day;
@property (nonatomic) int year;

// mutable (var)
// immutable (let)

// mutable type NSMutableString (NSArray, NSDictionary, NSSet)
@property (nonatomic, copy) NSString *news;  // comic.news = @"...";
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *safeTitle;
@property (nonatomic, copy) NSString *transcript;
@property (nonatomic, copy) NSString *alt;
@property (nonatomic) NSURL *imageURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
