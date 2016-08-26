//
//  TestTableView.m
//  ScrollViewAndTableView
//
//  Created by 梁先华 on 16/8/26.
//  Copyright © 2016年 梁先华. All rights reserved.
//

#import "TestTableView.h"

@interface TestTableView()<UITableViewDelegate,UITableViewDataSource>

@end

static NSString *const kTestCellID = @"TestTableViewCellID";
static const CGFloat kTestCellHeight = 50.f;

@implementation TestTableView

+ (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)tabelViewStyle
{
    TestTableView *testView = [[TestTableView alloc]initWithFrame:frame style:tabelViewStyle];
    [testView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTestCellID];
    testView.delegate = testView;
    testView.dataSource = testView;
    return testView;
}

#pragma mark -
#pragma mark - TableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTestCellID forIndexPath:indexPath];
    cell.textLabel.text = @"😁😁😁😁😁😁😁😁";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kTestCellHeight;
}

#pragma mark -
#pragma mark - edit slip
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

- (BOOL)tableView: (UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self setEditing:false animated:true];
}



@end
