//
//  ViewController.m
//  ThumbUpAnimation_Demo
//
//  Created by YZL on 17/6/15.
//  Copyright © 2017年 YZL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
///点赞按钮
@property (nonatomic, strong) UIButton *thumbUpButton;
@end

@implementation ViewController
#pragma mark - lazy load
- (UIButton *)thumbUpButton {
    if (!_thumbUpButton) {
        _thumbUpButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 100 / 2, self.view.frame.size.height / 2 - 100 / 2, 100, 100)];
        [self.view addSubview:_thumbUpButton];
        [_thumbUpButton setImage:[UIImage imageNamed:@"icon_shopdetail_star_big_unselect"] forState:UIControlStateNormal];
        [_thumbUpButton setImage:[UIImage imageNamed:@"icon_shopdetail_star_big_select"] forState:UIControlStateSelected];
        [_thumbUpButton addTarget:self action:@selector(thumbUpButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _thumbUpButton;
}

#pragma mark - view Func
- (void)viewDidLoad {
    [super viewDidLoad];
    self.thumbUpButton.hidden = NO;
}


#pragma mark - SEL
- (void)thumbUpButtonClick:(UIButton *)sender {
    sender.selected = !sender.selected;//改变按钮状态
    //添加点击时触发的动画效果
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.6;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
    animation.values = values;
    [sender.layer addAnimation:animation forKey:nil];
}


@end
