//
//  SearchViewController.m
//  CatMap
//
//  Created by Chris Jones on 2017-01-31.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButton:(UIBarButtonItem *)sender {
    NSString *parsedInput = self.searchTextField.text;
    [self.userInputDelegate searchTags:parsedInput];
    [self dismissViewControllerAnimated:YES completion:nil];
}


//- (MKAnnotationView *)mapView: (MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
//    if (annotation == self.dvc.detailMap.userLocation) {
//        return nil;
//    }
//}

@end
