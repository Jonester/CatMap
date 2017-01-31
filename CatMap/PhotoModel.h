//
//  PhotoModel.h
//  CatMap
//
//  Created by Chris Jones on 2017-01-31.
//  Copyright © 2017 Jonescr. All rights reserved.
//

@import UIKit;
@import MapKit;

@interface PhotoModel : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSDictionary *jsonDict;
@property (assign, nonatomic) NSInteger farm;
@property (strong, nonatomic) NSString *photoID;
@property (strong, nonatomic) NSString *serverID;
@property (strong, nonatomic) NSString *secretID;
@property (strong, nonatomic) UIImage *image;
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;

- (instancetype)initWithTitle:(NSString*)title image:(UIImage *)image;

@end
