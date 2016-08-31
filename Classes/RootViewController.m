//
//  RootViewController.m
//  ScrollViewAndTableView
//
//  Created by 梁先华 on 16/8/26.
//  Copyright © 2016年 梁先华. All rights reserved.
//

#import "RootViewController.h"
#import "TestTableView.h"
#import "CustomScrollView.h"

@interface RootViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) CustomScrollView *myScrollView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initViews];
}

- (void)initViews
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    NSInteger count = 4;
    for (NSInteger i = 0; i < count; i ++) {
        if (i == count - 1) {
            TestTableView *tableView = [TestTableView initWithFrame:CGRectMake(width * i, 0, self.myScrollView.bounds.size.width, self.myScrollView.bounds.size.height) style:UITableViewStylePlain];
            [self.myScrollView addSubview:tableView];
        }
        else
        {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(width * i, 0, self.myScrollView.bounds.size.width, self.myScrollView.bounds.size.height)];
            UILabel *flagLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 200,view.bounds.size.width, 40)];
            flagLab.textAlignment = NSTextAlignmentCenter;
            flagLab.text = [NSString stringWithFormat:@"第%ld页",i + 1];
            [view addSubview:flagLab];
            [self.myScrollView addSubview:view];
        }
        
    }
    [self.myScrollView setContentSize:CGSizeMake(width * count, 0)];
    [self.view addSubview:self.myScrollView];
}


#pragma mark -
#pragma mark - ScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.myScrollView) {
        for (TestTableView *view in self.myScrollView.subviews) {
            if ([view isKindOfClass:[TestTableView class]]) {
                view.scrollEnabled = NO;
            }
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.myScrollView) {
        for (TestTableView *view in self.myScrollView.subviews) {
            if ([view isKindOfClass:[TestTableView class]]) {
                view.scrollEnabled = YES;
            }
        }
    }
}

- (CustomScrollView *)myScrollView
{
    if (!_myScrollView) {
        _myScrollView = [[CustomScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
        _myScrollView.pagingEnabled = YES;
        _myScrollView.delegate = self;
        _myScrollView.bounces = NO;
    }
    return _myScrollView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
