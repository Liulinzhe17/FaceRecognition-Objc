//
//  ViewController.m
//  FaceRecognition-Objc
//
//  Created by lianjia on 2019/1/9.
//  Copyright © 2019 lianjia. All rights reserved.
//

#import "ViewController.h"
#import "NCNNWrapper.h"

#define IMAGE_HEIGHT [UIScreen mainScreen].bounds.size.height / 4
#define IMAGE_WIDTH  [UIScreen mainScreen].bounds.size.width - 100

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60, IMAGE_WIDTH, IMAGE_HEIGHT)];
    _imageView1.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView1];
    
    _imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60 + IMAGE_HEIGHT, IMAGE_WIDTH, IMAGE_HEIGHT)];
    _imageView2.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView2];
    
    _imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60 + IMAGE_HEIGHT * 2, IMAGE_WIDTH, IMAGE_HEIGHT)];
    _imageView3.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView3];
    
    UIButton *inputBtn = [[UIButton alloc] initWithFrame:CGRectMake(IMAGE_WIDTH + 10, _imageView1.frame.origin.y, 80, 40)];
    [inputBtn setTitle:@"录入人像" forState:UIControlStateNormal];
    [inputBtn setBackgroundColor:[UIColor greenColor]];
    [inputBtn addTarget:self action:@selector(inputBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:inputBtn];
    
    UIButton *detectBtn = [[UIButton alloc] initWithFrame:CGRectMake(IMAGE_WIDTH + 10, _imageView2.frame.origin.y, 80, 40)];
    [detectBtn setTitle:@"检测人像" forState:UIControlStateNormal];
    [detectBtn setBackgroundColor:[UIColor greenColor]];
    [detectBtn addTarget:self action:@selector(detectBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:detectBtn];
    
    UIButton *recognizeBtn = [[UIButton alloc] initWithFrame:CGRectMake(IMAGE_WIDTH + 10, _imageView3.frame.origin.y, 80, 40)];
    [recognizeBtn setTitle:@"识别人像" forState:UIControlStateNormal];
    [recognizeBtn setBackgroundColor:[UIColor greenColor]];
    [recognizeBtn addTarget:self action:@selector(recognizeBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:recognizeBtn];
    
}

- (void)inputBtnClicked {
    UIImage *image = [UIImage imageNamed:@"Trump.png"];
    [NCNNWrapper inputImage:image];
    dispatch_async(dispatch_get_main_queue(), ^{
        self->_imageView1.image = image;
    });
}

- (void)detectBtnClicked {
    UIImage *image = [UIImage imageNamed:@"test1"];
    UIImage *newImage = [NCNNWrapper detectFace:image];
    dispatch_async(dispatch_get_main_queue(), ^{
        self->_imageView2.image = newImage;
    });
}

- (void)recognizeBtnClicked {
    UIImage *image = [UIImage imageNamed:@"test"];
    UIImage *newImage = [NCNNWrapper recognizeFace:image];
    dispatch_async(dispatch_get_main_queue(), ^{
        self->_imageView3.image = newImage;
    });
}

@end
