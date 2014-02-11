//
//  TYMProgressBarView.m
//  TYMProgressBarView
//
//  Created by Yiming Tang on 13-6-7.
//  Copyright (c) 2013 - 2014 Yiming Tang. All rights reserved.
//

#import "TYMProgressBarView.h"

void strokeRoundedRectInContext(CGContextRef context, CGRect rect, CGFloat lineWidth, CGFloat radius);
void fillRoundedRectInContext(CGContextRef context, CGRect rect, CGFloat radius);
void setRoundedRectPathInContext(CGContextRef context, CGRect rect, CGFloat radius);


@implementation TYMProgressBarView

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


- (void)setBarInnerBorderWidth:(CGFloat)barInnerBorderWidth
{
    _barInnerBorderWidth = barInnerBorderWidth;
    [self setNeedsDisplay];
}


- (void)setBarInnerBorderColor:(UIColor *)barInnerBorderColor
{
    _barInnerBorderColor = barInnerBorderColor;
    [self setNeedsDisplay];
}


- (void)setbarFillColor:(UIColor *)barFillColor
{
    _barFillColor = barFillColor;
    [self setNeedsDisplay];
}


#pragma mark - Class Methods

+ (UIColor *)defaultBarColor
{
    return [UIColor darkGrayColor];
}


#pragma mark - UIView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [self initialize];
    }
    return self;
}


- (id)initWithFrame:(CGRect)aFrame
{
    if ((self = [super initWithFrame:aFrame])) {
        [self initialize];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetAllowsAntialiasing(context, TRUE);
    
    CGRect currentRect = rect;
    CGFloat radius;
    CGFloat halfLineWidth;
    
    // Background
    if (self.backgroundColor) {
        radius = currentRect.size.height / 2;
        
        [self.barBackgroundColor setFill];
        fillRoundedRectInContext(context, currentRect, radius);
    }
    
    // Border
    if (self.barBorderColor && self.barBorderWidth > 0.0f) {
        // Inset, because a stroke is centered on the path
        // See http://stackoverflow.com/questions/10557157/drawing-rounded-rect-in-core-graphics
        halfLineWidth = self.barBorderWidth / 2;
        currentRect = CGRectInset(currentRect, halfLineWidth, halfLineWidth);
        radius = currentRect.size.height / 2;
        
        [self.barBorderColor setStroke];
        strokeRoundedRectInContext(context, currentRect, self.barBorderWidth, radius);
        
        currentRect = CGRectInset(currentRect, halfLineWidth, halfLineWidth);
    }
    
    // Padding
    currentRect = CGRectInset(currentRect, self.barInnerPadding, self.barInnerPadding);
    
    
    BOOL hasInnerBorder = NO;
    // Inner border
    if (self.barInnerBorderColor && self.barInnerBorderWidth > 0.0f) {
        hasInnerBorder = YES;
        halfLineWidth = self.barInnerBorderWidth / 2;
        currentRect = CGRectInset(currentRect, halfLineWidth, halfLineWidth);
        radius = currentRect.size.height / 2;
        
        // progress
        currentRect.size.width *= self.progress;
        currentRect.size.width = MAX(currentRect.size.width, 2 * radius);
        
        [self.barInnerBorderColor setStroke];
        strokeRoundedRectInContext(context, currentRect, self.barInnerBorderWidth, radius);
        
        currentRect = CGRectInset(currentRect, halfLineWidth, halfLineWidth);
    }
    
    // Fill
    if (self.barFillColor) {
        radius = currentRect.size.height / 2;
        
        // recalculate width
        if (!hasInnerBorder) {
            currentRect.size.width *= self.progress;
            currentRect.size.width = MAX(currentRect.size.width, 2 * radius);
        }
        
        [self.barFillColor setFill];
        fillRoundedRectInContext(context, currentRect, radius);
    }
    
    // Restore the context
    CGContextRestoreGState(context);
}


#pragma mark - Private

- (void)initialize
{
    self.contentMode = UIViewContentModeRedraw;
    self.backgroundColor = [UIColor clearColor];
    
    _progress = 0.0f;
    _barBorderWidth = 2.0f;
    _barBorderColor = [[self class] defaultBarColor];
    _barFillColor = self.barBorderColor;
    _barInnerBorderWidth = 0.0f;
    _barInnerBorderColor = nil;
    _barInnerPadding = 2.0f;
    _barBackgroundColor = [UIColor whiteColor];
}

@end

#pragma mark - Drawing Functions

void strokeRoundedRectInContext(CGContextRef context, CGRect rect, CGFloat lineWidth, CGFloat radius)
{
    CGContextSetLineWidth(context, lineWidth);
    setRoundedRectPathInContext(context, rect, radius);
    CGContextStrokePath(context);
}


void fillRoundedRectInContext(CGContextRef context, CGRect rect, CGFloat radius)
{
    setRoundedRectPathInContext(context, rect, radius);
    CGContextFillPath(context);
}


void setRoundedRectPathInContext(CGContextRef context, CGRect rect, CGFloat radius)
{
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMidY(rect));
    CGContextAddArcToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMidX(rect), CGRectGetMinY(rect), radius);
    CGContextAddArcToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMidY(rect), radius);
    CGContextAddArcToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMidX(rect), CGRectGetMaxY(rect), radius);
    CGContextAddArcToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMidY(rect), radius);
    CGContextClosePath(context);
}
