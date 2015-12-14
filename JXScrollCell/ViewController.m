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
@property (nonatomic, strong) NSMutableArray *imageNameArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView registerClass:[CustomScrollCell class] forCellReuseIdentifier:@"CustomScrollCell"];
    [tableView reloadData];
    
    self.imageNameArray = [NSMutableArray array];
    for (NSInteger index = 0; index < 14; index ++) {
        [self.imageNameArray addObject:[NSString stringWithFormat:@"image%03ld.jpg",index]];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 14;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CustomScrollCell getHeight];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomScrollCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomScrollCell" forIndexPath:indexPath];
    [cell resetParallaxState];
    cell.headerImageView.image = [UIImage imageNamed:[self.imageNameArray objectAtIndex:indexPath.row]];
    [cell parallaxWithView:cell.headerImageView offsetUp:50 offsetDown:50];
    [cell parallaxWithView:cell.nameLabel offsetUp:10 offsetDown:10];
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
