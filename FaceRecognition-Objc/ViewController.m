//
//  ViewController.m
//  FaceRecognition-Objc
//
//  Created by lianjia on 2019/1/9.
//  Copyright © 2019 lianjia. All rights reserved.
//

#import "ViewController.h"
#import "NCNNWrapper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    UIImage *image = [UIImage imageNamed:@"test.png"];
    imageView.image = image;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    
    UIImage *newImage = [NCNNWrapper detectFace:image];
    dispatch_async(dispatch_get_main_queue(), ^{
        imageView.image = newImage;
    });
}


@end
