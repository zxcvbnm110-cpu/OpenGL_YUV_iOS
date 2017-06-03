//
//  ViewController.m
//  OpenGL_YUV_detec
//
//  Created by Ruiwen Feng on 2017/5/19.
//  Copyright © 2017年 Ruiwen Feng. All rights reserved.
//

#import "ViewController.h"

#import "YUVView.h"

/* 该视频长度。 176x144 */


@interface ViewController ()
@property (strong,nonatomic)     YUVView * playView;
@end

@implementation ViewController {
    FILE * file;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"file" ofType:@"yuv"];
    
    file = fopen(path.UTF8String, "r");
    
    self.playView = [[YUVView alloc]initWithFrame:CGRectMake(0, 0, 176, 144)];
    [self.playView setUp];
    [self.view addSubview:self.playView];
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(draw)];
    [self.view addGestureRecognizer:tap];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)draw {
    if (feof(file)) {
        return;
    }
    size_t yuv_length = 176*144*3/2;
    Byte buf[yuv_length];
    fread(buf, 1, yuv_length, file);
    NSLog(@"%@",[NSData dataWithBytes:buf length:yuv_length]);
    [self.playView displayYUVI420Data:buf width:176 height:144];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self draw];
    });
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
