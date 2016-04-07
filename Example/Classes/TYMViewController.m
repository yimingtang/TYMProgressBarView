//
//  TYMViewController.m
//  TYMProgressBarView
//
//  Created by Yiming Tang on 6/7/13.
//  Copyright (c) 2013 - 2016 Yiming Tang. All rights reserved.
//

#import "TYMViewController.h"
#import <TYMProgressBarView/TYMProgressBarView.h>

@interface TYMViewController ()
@property (nonatomic) NSTimer *timer;
@property (nonatomic) TYMProgressBarView *progressBarView7;
@property (nonatomic) TYMProgressBarView *progressBarView8;
@end

@implementation TYMViewController

#pragma mark - Accessors

@synthesize timer = _timer;
@synthesize progressBarView7 = _progressBarView7;
@synthesize progressBarView8 = _progressBarView8;

- (void)setTimer:(NSTimer *)timer {
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = timer;
}


- (TYMProgressBarView *)progressBarView7 {
    if (!_progressBarView7) {
        _progressBarView7 = [[TYMProgressBarView alloc] initWithFrame:CGRectZero];
        _progressBarView7.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    return _progressBarView7;
}


- (TYMProgressBarView *)progressBarView8 {
    if (!_progressBarView8) {
        _progressBarView8 = [[TYMProgressBarView alloc] initWithFrame:CGRectZero];
        _progressBarView8.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _progressBarView8.barBorderWidth = 0.0;
        _progressBarView8.barInnerPadding = 0.0;
    }
    return _progressBarView8;
}


#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat offsetX = 30.0;
    CGFloat offsetY = 40.0;
    CGFloat width = (self.view.bounds.size.width - offsetX * 2);
    
    TYMProgressBarView *progressBarView1 = [[TYMProgressBarView alloc] initWithFrame:CGRectMake(offsetX, offsetY, width, 16.0)];
    progressBarView1.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    progressBarView1.progress = 0.25f;
    [self.view addSubview:progressBarView1];
    
    offsetY += 30.0;
    TYMProgressBarView *progressBarView2 = [[TYMProgressBarView alloc] initWithFrame:CGRectMake(offsetX, offsetY, width, 16.0)];
    progressBarView2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    progressBarView2.progress = 0.50f;
    [self.view addSubview:progressBarView2];
    
    offsetY += 30.0;
    TYMProgressBarView *progressBarView3 = [[TYMProgressBarView alloc] initWithFrame:CGRectMake(offsetX, offsetY, width, 16.0)];
    progressBarView3.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    progressBarView3.progress = 0.75f;
    [self.view addSubview:progressBarView3];
    
    offsetY += 30.0;
    TYMProgressBarView *progressBarView4 = [[TYMProgressBarView alloc] initWithFrame:CGRectMake(offsetX, offsetY, width, 16.0)];
    progressBarView4.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    progressBarView4.progress = 1.0;
    [self.view addSubview:progressBarView4];
    
    offsetY += 30.0;
    TYMProgressBarView *progressBarView5 = [[TYMProgressBarView alloc] initWithFrame:CGRectMake(offsetX, offsetY, width, 26.0)];
    progressBarView5.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    progressBarView5.progress = 0.33f;
    [self.view addSubview:progressBarView5];
    
    offsetY += 40.0;
    TYMProgressBarView *progressBarView6 = [[TYMProgressBarView alloc] initWithFrame:CGRectMake(offsetX, offsetY, width, 26.0)];
    progressBarView6.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    progressBarView6.progress = 0.66f;
    [self.view addSubview:progressBarView6];
    
    offsetY += 40.0;
    self.progressBarView7.frame = CGRectMake(offsetX, offsetY, width, 26.0);
    [self.view addSubview:self.progressBarView7];
    
    offsetY += 40.0;
    self.progressBarView8.frame = CGRectMake(offsetX, offsetY, width, 26.0);
    
    [self.view addSubview:self.progressBarView8];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(incrementProgress:) userInfo:nil repeats:YES];
}


#pragma mark - Timer

- (void)incrementProgress:(NSTimer *)timer {
    self.progressBarView7.progress = self.progressBarView7.progress + 0.01f;
    if (self.progressBarView7.progress == 1.0) {
        self.progressBarView7.progress = 0.0;
    }
    
    self.progressBarView8.progress = self.progressBarView8.progress + 0.01f;
    if (self.progressBarView8.progress == 1.0) {
        self.progressBarView8.progress = 0.0;
    }
}

@end
