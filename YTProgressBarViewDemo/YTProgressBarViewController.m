//
//  YTProgressBarViewController.m
//  YTProgressBarViewDemo
//
//  Created by Yiming Tang on 13-6-7.
//  Copyright (c) 2013年 Yiming Tang. All rights reserved.
//

#import "YTProgressBarViewController.h"
#import "YTProgressBarView.h"

@interface YTProgressBarViewController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) YTProgressBarView *progressBarView7;
@property (nonatomic, strong) YTProgressBarView *progressBarView8;
@end

@implementation YTProgressBarViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    YTProgressBarView *progressBarView1 = [[YTProgressBarView alloc] initWithFrame:CGRectMake(30.0f, 20.0f, 260.0f, 16.0f)];
    progressBarView1.progress = 0.25;
    [self.view addSubview:progressBarView1];
    
    YTProgressBarView *progressBarView2 = [[YTProgressBarView alloc] initWithFrame:CGRectMake(30.0f, 50.0f, 260.0f, 16.0f)];
    progressBarView2.progress = 0.50;
    [self.view addSubview:progressBarView2];
    
    YTProgressBarView *progressBarView3 = [[YTProgressBarView alloc] initWithFrame:CGRectMake(30.0f, 80.0f, 260.0f, 16.0f)];
    progressBarView3.progress = 0.75;
    [self.view addSubview:progressBarView3];
    
    YTProgressBarView *progressBarView4 = [[YTProgressBarView alloc] initWithFrame:CGRectMake(30.0f, 110.0f, 260.0f, 16.0f)];
    progressBarView4.progress = 1.0;
    [self.view addSubview:progressBarView4];
    
    YTProgressBarView *progressBarView5 = [[YTProgressBarView alloc] initWithFrame:CGRectMake(30.0f, 140.0f, 260.0f, 26.0f)];
    progressBarView5.progress = 0.33;
    [self.view addSubview:progressBarView5];
    
    YTProgressBarView *progressBarView6 = [[YTProgressBarView alloc] initWithFrame:CGRectMake(30.0f, 180.0f, 260.0f, 26.0f)];
    progressBarView6.progress = 0.66;
    [self.view addSubview:progressBarView6];
    
    _progressBarView7 = [[YTProgressBarView alloc] initWithFrame:CGRectMake(30.0f, 220.0f, 260.0f, 26.0f)];
    [self.view addSubview:_progressBarView7];
    
    _progressBarView8 = [[YTProgressBarView alloc] initWithFrame:CGRectMake(30.0f, 260.0f, 260.0f, 26.0f)];
    _progressBarView8.barBorderWidth = 0.0f;
    _progressBarView8.barBackgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:_progressBarView8];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(incrementProgress:) userInfo:nil repeats:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Timer

- (void)incrementProgress:(NSTimer *)timer
{
    _progressBarView7.progress = _progressBarView7.progress + 0.01;
    if (_progressBarView7.progress == 1.0f) {
        _progressBarView7.progress = 0.0;
    }
    
    _progressBarView8.progress = _progressBarView8.progress + 0.01;
    if (_progressBarView8.progress == 1.0f) {
        _progressBarView8.progress = 0.0;
    }
}

@end
