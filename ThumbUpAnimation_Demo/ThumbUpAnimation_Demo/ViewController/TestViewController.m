//
//  TestViewController.m
//  ThumbUpAnimation_Demo
//
//  Created by 洪冬介 on 2017/6/15.
//  Copyright © 2017年 YZL. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()
///点赞按钮
@property (nonatomic, strong) UIButton *thumbUpButton;
@end

@implementation TestViewController

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
    self.navigationItem.title = @"点赞效果测试";
    self.view.backgroundColor = [UIColor whiteColor];
    self.thumbUpButton.hidden = NO;
}

#pragma mark - SEL
- (void)thumbUpButtonClick:(UIButton *)sender {
    //1.改变按钮选中状态
    sender.selected = !sender.selected;
    //2.添加点击时触发的动画效果
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
    [sender.layer addAnimation:animation forKey:nil];
}

@end
