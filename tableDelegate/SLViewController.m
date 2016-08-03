//
//  SLViewController.m
//  tableDelegate
//
//  Created by fengsonglin on 16/3/27.
//  Copyright © 2016年 fengsonglin. All rights reserved.
//

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height



#import "SLViewController.h"
#import "TableViewDelegateObj.h"

@interface SLViewController ()
@property(nonatomic,strong)TableViewDelegateObj *tableDelegate;
@property(nonatomic,strong)NSArray *dataList;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation SLViewController
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self createTableView];
        [self setupDelegateObj];
       
        
    }
    return self;
}

-(void)awakeFromNib{
        [self createTableView];
        [self setupDelegateObj];
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self createTableView];
        [self setupDelegateObj];

    }
    return self;
}

    
-(void)createTableView{
//    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor redColor];

}
-(NSArray *)dataList{
    if (!_dataList) {
        _dataList = [self createCustomerData];
    }
    return _dataList;
}
-(NSArray *)createCustomerData{
    NSMutableArray *dataArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < 20; i++) {
        [dataArray addObject:@(i)];
    }
    return dataArray;
}

-(void)setupDelegateObj{
    self.tableDelegate= [TableViewDelegateObj createTableViewDelegateWithDataList:self.dataList selectBlock:^(NSIndexPath *indexPath) {
        NSLog(@"点击了%ld行cell",(long)indexPath.row);
    }];
    self.tableView.delegate = self.tableDelegate;
    self.tableView.dataSource = self.tableDelegate;
    
}
@end
