//
//  Comic.m
//  XKCD Comics
//
//  Created by Paul Solt on 1/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "Comic.h"

@implementation Comic

/*
{
  "month": "7",
  "num": 614,
  "link": "",
  "year": "2009",
  "news": "",
  "safe_title": "Woodpecker",
  "transcript": "",
  "alt": "If you don't have an extension cord I can get that too.  Because we're friends!  Right?",
  "img": "https://imgs.xkcd.com/comics/woodpecker.png",
  "title": "Woodpecker",
  "day": "24"
}
 */

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _num = [dictionary[@"num"] intValue];
        _month = [dictionary[@"month"] intValue];
        _day = [dictionary[@"day"] intValue];
        _year = [dictionary[@"year"] intValue];
        _news = dictionary[@"news"];
        _title = dictionary[@"title"];
        _safeTitle = dictionary[@"safe_title"];
        _transcript = dictionary[@"transcript"];
        _alt = dictionary[@"alt"];
        
        NSString *imageURLString = dictionary[@"img"];
        _imageURL = [NSURL URLWithString:imageURLString];
    }
    return self;
}

@end
