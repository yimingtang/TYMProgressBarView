//
//  YTProgressBarView.m
//  YTProgressBarViewDemo
//
//  Created by Yiming Tang on 13-6-7.
//  Copyright (c) 2013年 Yiming Tang. All rights reserved.
//

#import "YTProgressBarView.h"

@interface YTProgressBarView ()
- (void)_initialize;
@end

@implementation YTProgressBarView

#pragma mark - Accessors

- (void)setProgress:(CGFloat)newProgress
{
    _progress = fmaxf(0.0f, fminf(1.0f, newProgress));
    [self setNeedsDisplay];
}


- (void)setbarBorderWidth:(CGFloat)barBorderWidth
{
    _barBorderWidth = barBorderWidth;
    [self setNeedsDisplay];
}


- (void)setbarBorderColor:(UIColor *)barBorderColor
{
    _barBorderColor = barBorderColor;
    [self setNeedsDisplay];
}


- (void)setbarFillColor:(UIColor *)barFillColor
{
    _barFillColor = barFillColor;
    [self setNeedsDisplay];
}


- (void)setbarBackgroundColor:(UIColor *)barBackgroundColor
{
    _barBackgroundColor = barBackgroundColor;
    [self setNeedsDisplay];
}


#pragma mark - Class Methods

+ (UIColor *)defaultBarColor
{
    return [UIColor lightGrayColor];
}


#pragma mark - UIView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [self _initialize];
    }
    return self;
}


- (id)initWithFrame:(CGRect)aFrame
{
    if ((self = [super initWithFrame:aFrame])) {
        [self _initialize];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Save the context
    CGContextSaveGState(context);
    
    // Allow antialiasing
    CGContextSetAllowsAntialiasing(context, TRUE);
    
    // Border
    rect = CGRectInset(rect, 1.0f, 1.0f);
    CGFloat radius = 0.5f * rect.size.height;
    
    if (_barBorderColor) {
        [_barBorderColor setStroke];
        CGContextSetLineWidth(context, _barBorderWidth);
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMidY(rect));
        CGContextAddArcToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMidX(rect), CGRectGetMinY(rect), radius);
        CGContextAddArcToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMidY(rect), radius);
        CGContextAddArcToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMidX(rect), CGRectGetMaxY(rect), radius);
        CGContextAddArcToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMidY(rect), radius);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathStroke);
    }
    
    
    // Background
    rect = CGRectInset(rect, 1.0f + _barBorderWidth, 1.0f + _barBorderWidth);
    radius = 0.5f * rect.size.height;
    
    if (_barBackgroundColor) {
        [_barBackgroundColor setFill];
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMidY(rect));
        CGContextAddArcToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMidX(rect), CGRectGetMinY(rect), radius);
        CGContextAddArcToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMidY(rect), radius);
        CGContextAddArcToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMidX(rect), CGRectGetMaxY(rect), radius);
        CGContextAddArcToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMidY(rect), radius);
        CGContextClosePath(context);
        CGContextFillPath(context);
    }
    
    
    // Fill
    radius = 0.5f * rect.size.height;
    
    rect.size.width *= _progress;
    if (rect.size.width < 2 * radius) {
        rect.size.width = 2 * radius;
    }
    
    if (_barFillColor) {
        [_barFillColor setFill];
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMidY(rect));
        CGContextAddArcToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMidX(rect), CGRectGetMinY(rect), radius);
        CGContextAddArcToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMidY(rect), radius);
        CGContextAddArcToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMidX(rect), CGRectGetMaxY(rect), radius);
        CGContextAddArcToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMidY(rect), radius);
        CGContextClosePath(context);
        CGContextFillPath(context);
    }
    
    
    // Restore the context
    CGContextRestoreGState(context);
}


#pragma mark - Private

- (void)_initialize
{
    self.backgroundColor = [UIColor clearColor];
    
    self.progress = 0.0f;
    self.barBorderWidth = 2.0f;
    self.barBorderColor = [[self class] defaultBarColor];
    self.barFillColor = self.barBorderColor;
    self.barBackgroundColor = [UIColor clearColor];
}

@end
