//
//  ViewController.m
//  testTableview
//
//  Created by Mac on 16/2/3.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "ViewController.h"

#import "mycell.h"

#import "EveryDayTableViewCell.h"

#import "clickView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic,retain) NSMutableArray *dataArray;
@property (nonatomic,retain) NSMutableArray *ary;

@property (nonatomic,retain)  clickView *vie;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.ary = [NSMutableArray array];
    
    self.dataArray = [NSMutableArray array];
    
        NSURLSession *session = [NSURLSession sharedSession];
    
        NSURL *url = [NSURL URLWithString:@"http://api.huceo.com/meinv/other/?key=099054303f87dc602eb7750fe07443ed&num=10"];
    
        NSURLRequest *requset = [NSURLRequest requestWithURL:url];
        NSURLSessionTask *task = [session dataTaskWithRequest:requset completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
            NSArray *ary = dic[@"newslist"];
            
            for (NSDictionary *dic in ary) {
                
                model *mode = [[model alloc]init];
                
                [mode setDic:dic];
                
                [self.dataArray addObject:mode];
            }
            
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            [self.tableview reloadData];
        });
    
        }];
    
    [task resume];

    self.tabBarController.tabBar.hidden = YES;
    
    [self.tableview reloadData];
    
    self.tabBarController.tabBar.hidden = YES;
//
    self.navigationController.navigationBar.hidden = YES;
    
    self.tableview.separatorStyle = NO;
    
  //  [self performSelector:@selector(doititit) withObject:nil afterDelay:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - tableviewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    mycell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[mycell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    return cell;

}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSArray *cellary = [self.tableview visibleCells];
    
    for (mycell *cell in cellary) {
        
            [cell starAnimate];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    
    
    mycell *mh = (mycell *)cell;
    
    NSLog(@"%@",self.dataArray);
    
    mh.midel = self.dataArray[indexPath.row];
    
    [mh starAnimate];

    if (![_ary containsObject:@(indexPath.row)]) {
        CATransform3D rotation;//3D旋转
        
        rotation = CATransform3DMakeTranslation(0 ,50 ,20);
        //    rotation = CATransform3DMakeRotation( M_PI_4 , 0.0, 0.7, 0.4);
        //逆时针旋转
        
        rotation = CATransform3DScale(rotation, 0.9, .9, 1);
        
        rotation.m34 = 1.0/ -800;
        
        cell.layer.shadowColor = [[UIColor blackColor]CGColor];
        cell.layer.shadowOffset = CGSizeMake(10, 10);
        //        cell.alpha = 0;
        
        cell.layer.transform = rotation;
        
        [UIView beginAnimations:@"rotation" context:NULL];
        //旋转时间
        [UIView setAnimationDuration:0.6];
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
        [UIView commitAnimations];
    }
    
    [_ary addObject:@(indexPath.row)];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    return 250;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    mycell *cell = [self.tableview cellForRowAtIndexPath:indexPath];

    CGRect cellrect = [cell convertRect:cell.bounds toView:self.view];
    
    
    
    CGFloat offsety = cellrect.origin.y;
    
    model *mo = [self.dataArray objectAtIndex:indexPath.row];
    
    _vie = [[clickView alloc]initWithFrame:CGRectMake(0, 0, 414, 736) withmodel:mo andAniam:cell.imageMyView.transform andOffset:offsety];
    
    
    
    [[self.tableview superview] addSubview:_vie];
    
    _vie.animaview.imageMyView.image = cell.imageMyView.image;
    
    [_vie began];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(endd)];
    
    [_vie.animaview.imageMyView addGestureRecognizer:tap];
}

-(void)endd{

    [_vie end];

}

@end
