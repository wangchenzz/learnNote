//
//  clickView.m
//  testTableview
//
//  Created by Mac on 16/2/4.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "clickView.h"

@implementation clickView


-(instancetype)initWithFrame:(CGRect)frame withmodel:(model *)model andAniam:(CGAffineTransform )transform andOffset:(CGFloat)offset{

    if (self = [super initWithFrame:frame]) {
        self.model = model;
        self.selftransfom = transform;
        
//        self.alpha = 0;
        self.offsetY = offset;
        
        _backVisual = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        _backVisual.frame = CGRectMake(0, self.offsetY, 414, 250);
        [self addSubview:_backVisual];
        
        _backVisual.alpha = 0;
        
        /**
         *  把模糊视图调到最底层, 不影响别的子视图;
         */
        [self sendSubviewToBack:_backVisual];

        self.animaview = [[mycell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        
        self.animaview.frame = CGRectMake(0, self.offsetY, 414, 250);
        
        [self.animaview.coverview removeFromSuperview];
        self.animaview.alpha = 0;
        
//        [self.animaview setBackgroundColor:[UIColor redColor]];
        
        [self addSubview:self.animaview];
        
        self.animaview.imageMyView.userInteractionEnabled = YES;
        
        self.animaview.imageMyView.transform = self.selftransfom;
        

    }
    return self;
}


-(void)began{
    
    /**
     *  开始动画
     */
    
    [UIView animateWithDuration:0.1 animations:^{
        
        
        
        self.animaview.alpha = 1;
        
        self.backVisual.alpha = 1;
        
    } completion:^(BOOL finished) {
       
        [UIView animateWithDuration:1 animations:^{
        
            self.animaview.frame = CGRectMake(0, 140, 414, 736);
            
            self.backVisual.frame = CGRectMake(0, 0, 414, 736);
            
       //     self.animaview.imageMyView.frame = CGRectMake(0, 0, 414, 736);
            
//            [self.animaview setBackgroundColor:[UIColor yellowColor]];
            
            self.animaview.imageMyView.transform = CGAffineTransformMakeTranslation(0, 100);
        } completion:^(BOOL finished) {
            
            
        }];
        
        
        
    }];
}


-(void)end{
    
    /**
     *  结束动画
     */

    [UIView animateWithDuration:1.5 animations:^{
        
        self.animaview.frame = CGRectMake(0, self.offsetY, 414, 250);
        
//        self.animaview.imageMyView.frame =  CGRectMake(0, -100, 414, 450);
        
        self.backVisual.frame = CGRectMake(0, self.offsetY, 414, 250);
        
        self.animaview.imageMyView.transform = self.selftransfom;
        
    } completion:^(BOOL finished) {
        
        
//        self.selftransfom = CGAffineTransformIdentity;
        
        
        [UIView animateWithDuration:0.1 animations:^{
            
            
            //self.animaview.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            
            [UIView animateWithDuration:1.5 animations:^{
            
                
//                [self.animaview starAnimate];
                
                
            }completion:^(BOOL finished) {
                
                
                [self removeFromSuperview];
                /**
                 *  这里干啥呢?
                 */
            }];
            
      
            
        }];
        
        
        
    }];
    
    
    
    

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [super touchesBegan:touches withEvent:event];
    
    [self end];

}

@end
