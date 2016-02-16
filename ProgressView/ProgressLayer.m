//
//  ProgressLayer.m
//  ProgressView
//
//  Created by huixinming on 2/15/16.
//  Copyright © 2016 huixinming. All rights reserved.
//

#import "ProgressLayer.h"
#import <UIKit/UIKit.h>

@implementation ProgressLayer
{
    CAShapeLayer *backgroundLayer;
    CGFloat localProgress;
}
@dynamic customProgress;

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if([key isEqualToString:@"customProgress"])
    {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        
        //[self addSublayer:backgroundLayer];
    }
    return self;
}

- (id<CAAction>)actionForKey:(NSString *)key
{
    if ([key isEqualToString:@"customProgress"])
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.fromValue = @([self customProgress]);
        //animation.toValue = @([self.presentationLayer customProgress]);
        //self.customProgress = [self.presentationLayer customProgress];
        return animation;
    }
    return [super actionForKey:key];
}

- (void)display
{
    CGFloat progress = [self.presentationLayer customProgress];
    NSLog(@"progress:%f",progress);
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx, 1, 0 , 0, 1);
    CGContextSetLineWidth(ctx, 4);
    CGContextMoveToPoint(ctx, 0, self.frame.size.height/2);
    CGContextAddLineToPoint(ctx, self.frame.size.width * progress, self.frame.size.height/2);
   CGContextStrokePath(ctx);
    //set backing image
    self.contents = (id)UIGraphicsGetImageFromCurrentImageContext().CGImage;
    UIGraphicsEndImageContext();
}

@end
