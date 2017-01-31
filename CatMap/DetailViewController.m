//
//  DetailViewController.m
//  CatMap
//
//  Created by Chris Jones on 2017-01-31.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "DetailViewController.h"
#import "PhotoModel.h"

@interface DetailViewController ()

@property (strong, nonatomic) PhotoModel *photoModel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.photoModel.imageTitle;
    
    NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.geo.getLocation&api_key=2cefae6b9ce4007e1dae82b25d665dcf&photo_id=%@&format=json&nojsoncallback=1", self.photoModel.photoID]];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error) {
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *dict1 = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError.localizedDescription);
            return;
        }
        NSDictionary *dict2 = [dict1 valueForKey:@"photo"];
        NSDictionary *dict3 = [dict2 valueForKey:@"location"];
        NSString *latitude = [dict3 valueForKey:@"latitude"];
        NSString *longitude = [dict3 valueForKey:@"longitude"];
        
        
//        for (NSDictionary *photoElements in photoJSONArray) {
//            NSString *urlString = [NSString stringWithFormat:@"https://farm%ld.staticflickr.com/%@/%@_%@.jpg", [[photoElements valueForKey:@"farm"] integerValue], [photoElements valueForKey:@"server"], [photoElements valueForKey:@"id"], [photoElements valueForKey:@"secret"]];
//            
//            self.model.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]]];
//            self.model = [[PhotoModel alloc]initWithTitle:[photoElements valueForKey:@"title"]
//                                                    image:self.model.image];
//            [self.photosArray addObject:self.model];
//        }
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            [self.collectionView reloadData];
//        }];
//    }];
//    [dataTask resume];
//}


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayDetails: (PhotoModel *)model {
    if (_photoModel != model) {
        _photoModel = model;
    }
}

@end
