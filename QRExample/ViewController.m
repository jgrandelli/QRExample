//
//  ViewController.m
//  QRExample
//
//  Created by Jason Grandelli on 3/17/13.
//  Copyright (c) 2013 URBN. All rights reserved.
//

#import "ViewController.h"
#import <QRCodeGenerator.h>

@interface ViewController ()

@property (nonatomic, strong) UIImageView *qrImgView;
@property (nonatomic, strong) UILabel *lbl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.qrImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, 300.0)];
    [self.view addSubview:self.qrImgView];
    
    self.lbl = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 320.0, 300.0, 30.0)];
    _lbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_lbl];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10.0, 370.0, 300.0, 44.0);
    [btn setTitle:@"Generate QR Code" forState:UIControlStateNormal];
    [btn setTitle:@"Booya!" forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(generate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [self generate];
}

- (void)generate {
    NSMutableString *qrString = [[NSMutableString alloc] init];
    for ( int i = 0; i < 10; ++i ) {
        int rand = arc4random() % 10;
        qrString = [NSString stringWithFormat:@"%@%i", qrString, rand];
    }
    
    UIImage *img = [QRCodeGenerator qrImageForString:qrString imageSize:300.0];
    [_qrImgView setImage:img];

    _lbl.text = qrString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
