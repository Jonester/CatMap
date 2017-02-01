//
//  CatsCollectionViewCell.h
//  CatMap
//
//  Created by Chris Jones on 2017-01-31.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoModel;

@interface CatsCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurEffect;
@property (strong, nonatomic) PhotoModel *photoModel;

@end
