//
//  TableViewDelegateObj.h
//  tableDelegate
//
//  Created by fengsonglin on 16/3/27.
//  Copyright © 2016年 fengsonglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^selectCell)(NSIndexPath *indexPath);

@interface TableViewDelegateObj : NSObject<UITableViewDataSource,UITableViewDelegate>

+(instancetype)createTableViewDelegateWithDataList:(NSArray *)dataList selectBlock:(selectCell)selectBlock;
@end
