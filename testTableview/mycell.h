//
//  mycell.h
//  testTableview
//
//  Created by Mac on 16/2/3.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "model.h"

@interface mycell : UITableViewCell

@property (nonatomic,retain) UIImageView *imageMyView;

@property (nonatomic,retain) UILabel *titlelabel;

@property (nonatomic,retain) UILabel *desctibtionLabel;

@property (nonatomic, strong) UIView *coverview;

@property (nonatomic,strong) model *midel;

-(void)starAnimate;

- (CGFloat)cellOffset ;

@end
