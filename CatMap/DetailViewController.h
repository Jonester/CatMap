//
//  DetailViewController.h
//  CatMap
//
//  Created by Chris Jones on 2017-01-31.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoModel;

@interface DetailViewController : UIViewController

-(void)displayDetails: (PhotoModel *)model;

@end
