//
//  UIView+Animation.m
//  ThumbUpAnimation_Demo
//
//  Created by YZL on 17/6/16.
//  Copyright © 2017年 YZL. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)
- (void)makeWeiboThumbUpAnimation {
    //添加点击时触发的动画效果
    CAKeyframeAnimation *animation;//使用关键帧动画
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];//获取以transform创建的CAKeyframeAnimation对象
    animation.duration = 0.6;//设置动画时间为0.6秒
    
    //根据需要调整动画的缩放比例 先缩小，后放大，再回归成正常比例
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    //将动画加到视图的layer层
    [self.layer addAnimation:animation forKey:nil];
}
@end
