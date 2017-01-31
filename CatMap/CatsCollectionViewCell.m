//
//  CatsCollectionViewCell.m
//  CatMap
//
//  Created by Chris Jones on 2017-01-31.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "CatsCollectionViewCell.h"
#import "PhotoModel.h"

@implementation CatsCollectionViewCell

-(void)setPhotoModel:(PhotoModel *)photoModel {
    self.cellImage.image = photoModel.image;
    self.cellLabel.text = photoModel.title;
}

@end
