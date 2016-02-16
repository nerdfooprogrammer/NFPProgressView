//
//  ProgressView.m
//  ProgressView
//
//  Created by huixinming on 2/15/16.
//  Copyright © 2016 huixinming. All rights reserved.
//

#import "ProgressView.h"
#import "ProgressLayer.h"
@interface ProgressView()

@property(nonatomic,strong)ProgressLayer *progressLayer;

@end

@implementation ProgressView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (Class)layerClass
{
    return [ProgressLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, self.frame.size.height/2-2, self.frame.size.width , 4)];
        CAShapeLayer *backgroundLayer = [CAShapeLayer layer];
        backgroundLayer.frame = self.bounds;
        backgroundLayer.path = path.CGPath;
        //backgroundLayer.lineWidth = 4;
        backgroundLayer.strokeColor = [UIColor grayColor].CGColor;
        [self.layer addSublayer:backgroundLayer];
        self.progressLayer = [ProgressLayer layer];
        self.progressLayer.frame = self.bounds;
        [self.layer addSublayer:self.progressLayer];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    self.progressLayer.customProgress = progress;
    [self.progressLayer setNeedsDisplay];
}

@end
