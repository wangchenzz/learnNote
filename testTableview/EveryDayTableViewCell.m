//
//  EveryDayTableViewCell.m
//  开眼
//
//  Created by juvham on 16/1/21.
//  Copyright © 2016年 juvham. All rights reserved.
//

#import "EveryDayTableViewCell.h"

@implementation EveryDayTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        
        self.clipsToBounds = YES;
        
        _picture = [[UIImageView alloc]initWithFrame:CGRectMake(0, -(736/1.7 -250)/2, 414, 736/1.7)];

        _picture.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.contentView  addSubview:_picture];
    }
    return self;
    
}

- (void)setModel:(EveryDayModel *)model{
    

}

- (CGFloat)cellOffset {

    CGRect centerToWindow = [self convertRect:self.bounds toView:self.window];
    CGFloat centerY = CGRectGetMidY(centerToWindow);
    
    CGPoint windowCenter = self.superview.center;
    

    
    /**
     *  cell 在 view 中的位置. 最小 y 值. centerY;  中心点的 y 值得差为 celloffset Y;
     */

    /**
     *  偏移中点的比例 offsetDig 是0到1之间的数字.
     */
    
    /**
     *  offset 则是图片多出来的部分 一半 * 比例;  有正负的;
     */
    
    /**
     *  刚出现的 cell  offset 是负值. 而且是由 超出比例来决定露出多少来,
     */
    
    /**
     *  返回值就是这个偏移值, 可能为负值;
     */
    CGFloat cellOffsetY = centerY - windowCenter.y;

    CGFloat offsetDig =  cellOffsetY / self.superview.frame.size.height *2;
    CGFloat offset =  -offsetDig * (736/1.7 - 250)/2;

    CGAffineTransform transY = CGAffineTransformMakeTranslation(0,offset);

    self.picture.transform = transY;

    return offset;
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
