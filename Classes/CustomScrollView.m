//
//  CustomScrollView.m
//  ScrollViewAndTableView
//
//  Created by 梁先华 on 16/8/26.
//  Copyright © 2016年 梁先华. All rights reserved.
//

#import "CustomScrollView.h"

@implementation CustomScrollView

/** 为了解决部分侧滑删除手势冲突*/
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return gestureRecognizer.state != 0 ? YES : NO;
}


@end
