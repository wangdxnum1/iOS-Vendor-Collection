//
//  STChildViewController.m
//  STTest
//
//  Created by 刘敏 on 16/5/30.
//  Copyright © 2016年 深圳市轩腾华兴科技开发有限公司. All rights reserved.
//

#import "STChildViewController.h"
#import "STNavigationController.h"

@implementation STChildViewController


- (void)dealloc
{
    if (self)
    {
        //取消延迟执行
        [[STChildViewController class] cancelPreviousPerformRequestsWithTarget:self];
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    STNavBarView *navbar = [[STNavBarView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [STNavBarView barSize].width, [STNavBarView barSize].height)];
    _navbar = navbar;
    _navbar.viewCtrlParent = self;
    [self.view addSubview:_navbar];
    //设置导航栏背景颜色
    [self setNabbarBackgroundColor:[UIColor whiteColor]];
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_navbar && !_navbar.hidden)
    {
        [self.view bringSubviewToFront:_navbar];
    }
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

#pragma mark -
- (void)bringNavBarToTopmost
{
    if (_navbar)
    {
        [self.view bringSubviewToFront:_navbar];
    }
}


// 设置STNavBarView 颜色
- (void)setNabbarBackgroundColor:(UIColor *)color
{
    if (_navbar) {
        [_navbar setBackgroundColor:color];
    }
}

- (void)hideNavBar:(BOOL)bIsHide
{
    _navbar.hidden = bIsHide;
}

- (void)setNavBarTitle:(NSString *)strTitle
{
    if (_navbar)
    {
        [_navbar setTitle:strTitle];
    }
    else{
        NSLog(@"APP_ASSERT_STOP");
        NSAssert1(NO, @" \n\n\n===== APP Assert. =====\n%s\n\n\n", __PRETTY_FUNCTION__);
    }
}


- (void)setNavBarLeftBtn:(UIButton *)btn
{
    if (_navbar)
    {
        [_navbar setLeftBtn:btn];
    }
    else{
        NSLog(@"APP_ASSERT_STOP");
        NSAssert1(NO, @" \n\n\n===== APP Assert. =====\n%s\n\n\n", __PRETTY_FUNCTION__);
    }
}

- (void)setNavBarRightBtn:(UIButton *)btn
{
    if (_navbar)
    {
        [_navbar setRightBtn:btn];
    }
}


// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)canDragBack
{
    if (self.navigationController)
    {
        [((STNavigationController *)(self.navigationController)) navigationCanDragBack:canDragBack];
    }
}


// 重设scroll view的内容区域和滚动条区域
- (void)resetScrollView:(UIScrollView *)scrollView tabBar:(BOOL)hasTabBar
{
    if (scrollView)
    {
        UIEdgeInsets inset = scrollView.contentInset;
        UIEdgeInsets insetIndicator = scrollView.scrollIndicatorInsets;
        
        CGPoint ptContentOffset = scrollView.contentOffset;
        CGFloat fTopInset = 0.0f;
        CGFloat fTopIndicatorInset = 0.0f;
        
        CGFloat fBottomInset = hasTabBar ? Bottom_H : 0.0f;
        
        fTopInset += NaviBar_H - StatusBar_H;
        fTopIndicatorInset += NaviBar_H - StatusBar_H;
        
        inset.top += fTopInset;
        inset.bottom += fBottomInset;
        [scrollView setContentInset:inset];
        
        insetIndicator.top += fTopIndicatorInset;
        insetIndicator.bottom += fBottomInset;
        [scrollView setScrollIndicatorInsets:insetIndicator];
        
        ptContentOffset.y -= fTopInset;
        [scrollView setContentOffset:ptContentOffset];
    }
}


@end
