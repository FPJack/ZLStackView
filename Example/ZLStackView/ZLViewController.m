//
//  ZLViewController.m
//  ZLUIKitPlus
//
//  Created by fanpeng on 04/24/2026.
//  Copyright (c) 2026 fanpeng. All rights reserved.
//

#import "ZLViewController.h"
#import <ZLStackView/ZLStackView.h>
#import "ZLStackViewDemoVC.h"
#import "ZLStackViewBenchmarkVC.h"
#import "UIStackViewBenchmarkVC.h"
#import "MasonryBenchmarkVC.h"
#import "FrameBenchmarkVC.h"
#import "ZLStackView-Swift.h"
#import "ZLStackView_Example-Swift.h"

@interface ZLViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray<NSDictionary *> *demos;

@end

@implementation ZLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ZLUIKitPlus Demos";
    self.view.backgroundColor = UIColor.whiteColor;
    self.demos = @[
        @{@"title": @"⚡ ZLStackView Demo",   @"class": ZLStackViewDemoVC.class},
        @{@"title": @"⚡ ZLStackView swift DSL布局",        @"class": ZLSwiftViewController.class},
        @{@"title": @"⚡ UIStackView 性能测试",  @"class": UIStackViewBenchmarkVC.class},
        @{@"title": @"⚡ ZLStackView 性能测试",  @"class": ZLStackViewBenchmarkVC.class},
        @{@"title": @"⚡ Masonry 性能测试",       @"class": MasonryBenchmarkVC.class},
        @{@"title": @"⚡ Frame 性能测试",        @"class": FrameBenchmarkVC.class},
    ];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
    tableView.zl_layout.edgesZero();

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.demos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.demos[indexPath.row][@"title"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class cls = self.demos[indexPath.row][@"class"];
    UIViewController *vc = [[cls alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
