//
//  ViewController.m
//  SnowAnimation
//
//  Created by Fancy on 16/2/29.
//  Copyright © 2016年 Fancy. All rights reserved.
//
//雪花飘落的效果
#import "ViewController.h"
@interface ViewController ()
{
    UIImage *flakeImage;
    NSTimer *time;
}

- (void)Timmer;
@end

@implementation ViewController

- (void)viewDidLoad {
    flakeImage = [UIImage imageNamed:@"2.png"];
    
    //创建定时器

    [NSTimer scheduledTimerWithTimeInterval:(0.05) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    [super viewDidLoad];
    
    [self performSelector:@selector(change) withObject:self afterDelay:4.0];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)onTimer
{    //创建图像视图对象
    UIImageView *flakeview =[[UIImageView alloc] initWithImage:flakeImage];
    //定义图像的开始和结束坐标的x值
    int  startX = round(random() %320);
    int endX= round(random() %320);
    double scale = 1/ round(random() %100) +1.0;
    double speed =1 /round(random() %100) +1.0;
    NSLog(@"开始的坐标x:%i，结束时的坐标：%i，大小：%f,速度：%f",startX,endX,scale,speed);
    flakeview.frame = CGRectMake(startX, -100.0, 25*scale, 25*scale);
    flakeview.alpha = 0.5;
    [self.view addSubview: flakeview];
    [UIView beginAnimations:nil context:(__bridge void *)(flakeview)];
    [UIView setAnimationDuration: 10*speed];
    flakeview.frame = CGRectMake(endX, 644.0, 25* scale, 25*scale);
    [UIView commitAnimations];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)change

{
    NSLog(@"我已经执行了");
    
    
}
@end
