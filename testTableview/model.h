//
//  model.h
//  testTableview
//
//  Created by Mac on 16/2/4.
//  Copyright © 2016年 JS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface model : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *descriptions;
@property (nonatomic,copy) NSString *picUrl;

@property (nonatomic,copy) NSString *url;

-(void)setDic:(NSDictionary *)dic;

@end
