//
//  TestViewController.m
//  ThumbUpAnimation_Demo
//
//  Created by 洪冬介 on 2017/6/15.
//  Copyright © 2017年 YZL. All rights reserved.
//

#import "TestViewController.h"
//导入点赞动画分类
#import "UIView+Animation.h"

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
    //2.调用分类实现动画效果
    [sender makeWeiboThumbUpAnimation];
}


@end
