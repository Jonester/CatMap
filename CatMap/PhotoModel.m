//
//  PhotoModel.m
//  CatMap
//
//  Created by Chris Jones on 2017-01-31.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "PhotoModel.h"

@implementation PhotoModel

- (instancetype)initWithTitle:(NSString*)title image:(UIImage *)image
{
    self = [super init];
    if (self) {
        _title = title;
        _image = image;
        
    }
    return self;
}

@end
