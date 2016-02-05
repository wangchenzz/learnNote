//
//  clickView.h
//  testTableview
//
//  Created by Mac on 16/2/4.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "model.h"

#import "mycell.h"

@interface clickView : UIView

@property (nonatomic,retain) model *model;

@property (nonatomic,retain) mycell *animaview;

@property (nonatomic,assign) CGFloat offsetY;

@property (nonatomic,assign) CGAffineTransform selftransfom;

@property (nonatomic,retain) UIVisualEffectView *backVisual;

-(instancetype)initWithFrame:(CGRect)frame withmodel:(model *)model andAniam:(CGAffineTransform )transform andOffset:(CGFloat)offset;

-(void)began;

-(void)end;

@end
