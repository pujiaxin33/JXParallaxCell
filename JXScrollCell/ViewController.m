//
//  ViewController.m
//  JXScrollCell
//
//  Created by jiaxin on 15/12/11.
//  Copyright © 2015年 jiaxin. All rights reserved.
//

#import "ViewController.h"
#import "ParallaxCell.h"
#import "CustomScrollCell.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView registerClass:[CustomScrollCell class] forCellReuseIdentifier:@"CustomScrollCell"];
    [tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CustomScrollCell getHeight];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomScrollCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomScrollCell" forIndexPath:indexPath];
    [cell resetParallaxState];
    [cell parallaxWithView:cell.headerImageView offsetUp:70 offsetDown:50];
    [cell parallaxWithView:cell.nameLabel offsetUp:20 offsetDown:30];
    [cell updateViewFrameWithScrollView:tableView];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    for (CustomScrollCell *cell in self.tableView.visibleCells) {
        [cell updateViewFrameWithScrollView:scrollView];
    }
}

@end
