//
//  STTabBarController.m
//  STTest
//
//  Created by 刘敏 on 16/5/30.
//  Copyright © 2016年 深圳市轩腾华兴科技开发有限公司. All rights reserved.
//

#import "STTabBarController.h"
#import "STNavigationController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "RootViewController.h"

@interface STTabBarController ()


@end


@implementation STTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化
    [self initializeTabBarController];
    
    //设置文字颜色
    self.tabBar.tintColor = [UIColor blackColor];

    //常规状态
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor blackColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    //选中状态
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor lightGrayColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
    
    self.selectedIndex = 0;
}

/*添加子控制器 */
- (void)initializeTabBarController{
    //主页
    FirstViewController *home = [[FirstViewController alloc] init];
    [self addChildViewController:home title:@"主页" image:@"tab_icon1_normal.png" selectedImage:@"tab_icon1_selcet.png"];
    
    //同好
    SecondViewController *rVC = [[SecondViewController alloc] init];
    [self addChildViewController:rVC title:@"同好" image:@"tab_icon2_normal.png" selectedImage:@"tab_icon2_selcet.png"];
    
    //我的
    RootViewController *userVC = [[RootViewController alloc] init];
    [self addChildViewController:userVC title:@"我的" image:@"tab_icon5_normal.png" selectedImage:@"tab_icon5_selcet.png"];
}

#pragma mark 添加子控制器的方法
- (void)addChildViewController:(UIViewController *)childVc
                         title:(NSString*)title
                         image:(NSString*)image
                 selectedImage:(NSString*)selectedImage {
    
    // 始终绘制图片原始状态，不使用Tint Color,系统默认使用了Tint Color（灰色）
    [childVc.tabBarItem setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [childVc.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];
    childVc.tabBarItem.title = title;
    
    STNavigationController *nav = [[STNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
