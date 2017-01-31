//
//  CatsCollectionViewController.m
//  CatMap
//
//  Created by Chris Jones on 2017-01-31.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "CatsCollectionViewController.h"
#import "CatsCollectionViewCell.h"
#import "PhotoModel.h"
#import "DetailViewController.h"

@interface CatsCollectionViewController ()

@property (strong, nonatomic) NSMutableArray *photosArray;
@property (strong, nonatomic) PhotoModel *model;

@end

@implementation CatsCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photosArray = [NSMutableArray new];
    
    NSURL *url = [[NSURL alloc]initWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=d03d341e56d31ac876ad9eec528309d4&tags=cat&has_geo=1&extras=url_m&format=json&nojsoncallback=1"];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *mainJSONDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError.localizedDescription);
            return;
        }
        NSDictionary *interiorDict = [mainJSONDict valueForKey:@"photos"];
        NSArray *photoJSONArray = [interiorDict valueForKey:@"photo"];
        
        for (NSDictionary *photoElements in photoJSONArray) {
            NSString *urlString = [NSString stringWithFormat:@"https://farm%ld.staticflickr.com/%@/%@_%@.jpg", [[photoElements valueForKey:@"farm"] integerValue], [photoElements valueForKey:@"server"], [photoElements valueForKey:@"id"], [photoElements valueForKey:@"secret"]];
            
            self.model.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]]];
            self.model = [[PhotoModel alloc]initWithTitle:[photoElements valueForKey:@"title"]
                                                    image:self.model.image];
            [self.photosArray addObject:self.model];
        }
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.collectionView reloadData];
            }];
        }];
        [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.photosArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CatsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    self.model = self.photosArray[indexPath.row];
    [cell setPhotoModel:self.model];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"DetailViewController"]) {
        CatsCollectionViewCell *customCell = (CatsCollectionViewCell *)sender;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:customCell];
        
        PhotoModel *model = self.photosArray[indexPath.row];
        DetailViewController *dvc = [segue destinationViewController];
        [dvc displayDetails:model];
    }
}

#pragma mark <UICollectionViewDelegate>


@end
