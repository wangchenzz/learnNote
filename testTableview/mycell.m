//
//  mycell.m
//  testTableview
//
//  Created by Mac on 16/2/3.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "mycell.h"

#import <UIImageView+WebCache.h>

@implementation mycell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        
        self.imageMyView = [[UIImageView alloc] initWithFrame:CGRectMake(0, - 100, 414, 250 +200)];
        
        self.coverview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 414, 250)];
        
        [self.coverview setBackgroundColor:[UIColor colorWithWhite:0.1 alpha:0.3]];
        
        /**
         *  这个很关键, 不然会让图形到外面去;
         */
        
        self.clipsToBounds = YES;
        
        _imageMyView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.contentView addSubview:self.imageMyView];
        
        
        self.titlelabel = [[UILabel alloc] init];
        
        self.desctibtionLabel = [[UILabel alloc] init];
        
        [self.titlelabel setFrame:CGRectMake(0, 125, 414, 30)];
        
        [self.desctibtionLabel setFrame:CGRectMake(0, 150, 414, 30)];
        
        [self.titlelabel setFont:[UIFont boldSystemFontOfSize:16]];
        
        [self.desctibtionLabel setFont:[UIFont systemFontOfSize:14]];
        
        [self.titlelabel setTextColor:[UIColor whiteColor]];
        
        [self.desctibtionLabel setTextColor:[UIColor whiteColor]];
        
        [self.desctibtionLabel setNumberOfLines:0];
        
        [self.titlelabel setTextAlignment:NSTextAlignmentCenter];
        
        [self.desctibtionLabel setTextAlignment:NSTextAlignmentCenter];
        
        [self.contentView addSubview:self.coverview];
        
        [self.contentView addSubview:self.titlelabel];
        
        [self.contentView addSubview:self.desctibtionLabel];
        
        self.coverview.userInteractionEnabled = YES;

    }

    return self;
}

-(void)setMidel:(model *)midel{
    
//    [[SDImageCache  sharedImageCache] clearDisk];
// [[SDImageCache  sharedImageCache] clearMemory];
    if (_midel != midel) {
        _midel = midel;
        
        self.titlelabel.text = midel.title;
        
       // self.desctibtionLabel.text = midel.descriptions;
        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//           
//
//            
//            NSData *data = [NSData dataWithContentsOfURL:url];
//            
//            self.imageMyView.image = [UIImage imageWithData:data];
//            
//        });
           NSURL *url = [NSURL URLWithString:midel.picUrl];

        [self.imageMyView sd_setImageWithURL:url];
    }
    
}

-(void)starAnimate{

    /**
     *  self.superview.superview.superview === self.windows;
     */
    
    CGRect cellrect = [self convertRect:self.bounds toView:self.superview.superview.superview];
    
//    NSLog(@"%@",self.superview);
    
    CGPoint contentCenter = self.superview.center;
    
    CGFloat MINY = CGRectGetMidY(cellrect);
    
    CGFloat celloffset = MINY - contentCenter.y;
    
    CGFloat scale = celloffset / self.superview.frame.size.height * 2;
    
    CGFloat offset = scale * 100;
    
    CGAffineTransform picTransform = CGAffineTransformMakeTranslation(0, -offset);

    self.imageMyView.transform = picTransform;
    
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
    CGFloat offset =  -offsetDig * 100;
    
    CGAffineTransform transY = CGAffineTransformMakeTranslation(0,offset);
    
    self.imageMyView.transform = transY;
    
    return offset;
    
}
@end
