//
//  CustomScrollCell.h
//  JXScrollCell
//
//  Created by jiaxin on 15/12/14.
//  Copyright © 2015年 jiaxin. All rights reserved.
//

#import "ParallaxCell.h"

@interface CustomScrollCell : ParallaxCell

@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *nameLabel;

+ (CGFloat)getHeight;

@end
