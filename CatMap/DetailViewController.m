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
    self.title = self.photoModel.title;
    
    NSURL *url = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.geo.getLocation&api_key=d03d341e56d31ac876ad9eec528309d4&photo_id=%@&format=json&nojsoncallback=1", self.photoModel.photoID]];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error) {
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *dict1 = [NSJSONSerialization JSONObjectWithData:data
                                                              options:0
                                                                error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError.localizedDescription);
            return;
        }
        NSDictionary *dict2 = [dict1 valueForKey:@"photo"];
        NSDictionary *dict3 = [dict2 valueForKey:@"location"];
        NSString *latitude = [dict3 valueForKey:@"latitude"];
        NSString *longitude = [dict3 valueForKey:@"longitude"];

        self.photoModel.coordinate = CLLocationCoordinate2DMake([latitude intValue], [longitude intValue]);
        MKCoordinateSpan span = MKCoordinateSpanMake(.5f, .5f);
        self.detailMap.region = MKCoordinateRegionMake(self.photoModel.coordinate, span);
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.detailMap addAnnotation:self.photoModel];
            }];
    }];
    [dataTask resume];
    
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
