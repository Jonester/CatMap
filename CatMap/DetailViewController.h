//
//  DetailViewController.h
//  CatMap
//
//  Created by Chris Jones on 2017-01-31.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;
@class PhotoModel;

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *detailMap;

-(void)displayDetails: (PhotoModel *)model;

@end
