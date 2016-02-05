//
//  model.m
//  testTableview
//
//  Created by Mac on 16/2/4.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "model.h"

@implementation model

-(void)setValue:(id)value forKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        self.descriptions = value;
    }else{
        
        
    [super setValue:value forKey:key];
    }
}

-(void)setDic:(NSDictionary *)dic{

    self.title = dic[@"title"];
    
    self.picUrl = dic[@"picUrl"];
    self.descriptions = dic[@"description"];
    self.url = dic[@"url"];
}

@end
