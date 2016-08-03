//
//  TableViewDelegateObj.m
//  tableDelegate
//
//  Created by fengsonglin on 16/3/27.
//  Copyright © 2016年 fengsonglin. All rights reserved.
//

#import "TableViewDelegateObj.h"

@interface TableViewDelegateObj()

@property(nonatomic,strong)NSArray *dataList;
@property(nonatomic,copy)selectCell selectBlock;

@end
@implementation TableViewDelegateObj

+(instancetype)createTableViewDelegateWithDataList:(NSArray *)dataList selectBlock:(selectCell)selectBlock{
    return [[[self class]alloc] initTableViewDelegateWithDataList:dataList selectBlock:(selectCell)selectBlock];
}
-(instancetype)initTableViewDelegateWithDataList:(NSArray *)dataList selectBlock:(selectCell)selectBlock{
    self = [super init];
    if (self) {
        self.dataList = dataList;
        self.selectBlock = selectBlock;
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSNumber *number = self.dataList[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[number stringValue]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.selectBlock(indexPath);
}


@end
