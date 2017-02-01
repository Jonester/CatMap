//
//  SearchViewController.h
//  CatMap
//
//  Created by Chris Jones on 2017-01-31.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;

@protocol UserInputDelegate <NSObject>

-(void)searchTags:(NSString *)parsedInput;

@end

@interface SearchViewController : UIViewController

@property (strong, nonatomic) id<UserInputDelegate> userInputDelegate;

@end
