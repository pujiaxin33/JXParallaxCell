//
//  ScrollCell.h
//  JXScrollCell
//
//  Created by jiaxin on 15/12/11.
//  Copyright © 2015年 jiaxin. All rights reserved.
//

#import <UIKit/UIKit.h>

//初始化cell的时候记得先用注册哟！！！且仅针对cell的高度是一样的cell
@interface ParallaxCell : UITableViewCell

/**
 *  重置视差化状态，因为cell的重用机制，重用之后要刷新状态
 */
- (void)resetParallaxState;

/**
 *  设置可视差化的子视图，以及centerY上偏移的值和centerY下偏移的值
 *
 *  @param view   允许被可视差化的视图
 *  @param minNum centerY上偏移的值
 *  @param maxNum centerY下偏移的值
 */
- (void)parallaxWithView:(UIView *)view offsetUp:(CGFloat)offsetUp offsetDown:(CGFloat)offsetDown;

/**
 *  通过传入scrollview就更可以根据滚动的情况，更新之前需要视差化的视图的位置
 *
 *  @param scrollView scrollView
 */
- (void)updateViewFrameWithScrollView:(UIScrollView *)scrollView;

@end
