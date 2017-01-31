//
//  PhotoModel.h
//  CatMap
//
//  Created by Chris Jones on 2017-01-31.
//  Copyright © 2017 Jonescr. All rights reserved.
//

@import UIKit;

@interface PhotoModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSDictionary *jsonDict;
@property (assign, nonatomic) NSInteger farm;
@property (strong, nonatomic) NSString *photoID;
@property (strong, nonatomic) NSString *serverID;
@property (strong, nonatomic) NSString *secretID;
@property (strong, nonatomic) UIImage *image;

- (instancetype)initWithTitle:(NSString*)title image:(UIImage *)image;

@end
