//
//  CustomScrollCell.m
//  JXScrollCell
//
//  Created by jiaxin on 15/12/14.
//  Copyright © 2015年 jiaxin. All rights reserved.
//

#import "CustomScrollCell.h"
#import <Masonry.h>

@interface CustomScrollCell ()
@property (nonatomic, weak) UIView *containerView;
@end

@implementation CustomScrollCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [[self class] getHeight])];
    containerView.clipsToBounds = YES;
    [self.contentView addSubview:containerView];
    self.containerView = containerView;
    
    self.headerImageView = [[UIImageView alloc] initWithFrame:containerView.bounds];
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.headerImageView.image = [UIImage imageNamed:@"Album4.png"];
    [containerView addSubview:self.headerImageView];
    self.contentView.clipsToBounds = YES;
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, [[self class] getHeight]/2 - 40, [UIScreen mainScreen].bounds.size.width - 40, 80)];
    self.nameLabel.numberOfLines = 0;
    self.nameLabel.font = [UIFont boldSystemFontOfSize:20];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.text = @"最美的不是风景，而是陪你看风景的人(*^__^*)";
    self.nameLabel.shadowColor = [UIColor grayColor];
    self.nameLabel.shadowOffset = CGSizeMake(1, 1);
    [self.contentView addSubview:self.nameLabel];
}

+ (CGFloat)getHeight
{
    return 150;
}
@end
