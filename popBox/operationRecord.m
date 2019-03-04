//
//  operationRecord.m
//  wyMindor
//
//  Created by 万烨 on 2019/3/1.
//  Copyright © 2019 wy. All rights reserved.
//
//宏定义获取屏幕宽
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//宏定义获取屏幕高
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//宏定义像素宽
#define KWIDTH [UIScreen mainScreen].bounds.size.width/750.0
//判断当前手机型号是否iPhone5 iPhone5：w:640 h:1136
#define IS_IPHONE_5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//默认沙盒路径
#define userInfoFile(filePath) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:filePath]

// 宏定义iPhoneX 宽 375 高812
#define IS_iPhoneX ([UIScreen mainScreen].bounds.size.width == 375 && [UIScreen mainScreen].bounds.size.height == 812)

#define color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#import "operationRecord.h"

#import "UIColor+ColorChange.h"

#import "bottomTableViewCell.h"





#define m_top  150*KWIDTH

@implementation operationRecord


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
        self.userInteractionEnabled  = YES;
        // self.
        
        _tableViewMe = [[UITableView alloc]initWithFrame:CGRectMake(0,0*KWIDTH,SCREEN_WIDTH,518*KWIDTH) style:UITableViewStyleGrouped];
        _tableViewMe.separatorColor = color(238, 238, 238);
        _tableViewMe.delegate =self;
        _tableViewMe.scrollEnabled = NO;
        
        _tableViewMe.dataSource = self;
        _tableViewMe.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableViewMe.separatorInset = UIEdgeInsetsMake(0,10, 70, 10);        // 设置端距，这里表示separator离左边和右边均80像素
        
        if (@available(iOS 11.0, *)) {
            self.tableViewMe.estimatedRowHeight = 0;
            self.tableViewMe.estimatedSectionHeaderHeight = 0;
            self.tableViewMe.estimatedSectionFooterHeight = 0;
        }
        [self addSubview:_tableViewMe];
        
       
        
        
        
        
        
    }
    return self;
    
    
    
    
    
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 77*KWIDTH;
}
//上边距
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return m_top;
    }
    return 1*KWIDTH;
    // return ;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section  == 0){
     
        
        UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0,0*KWIDTH,self.bounds.size.width,m_top)];
        header.backgroundColor = color(229, 229, 229);
        //cancel
        
        CGFloat x  = 30*KWIDTH;
        CGFloat w =  90*KWIDTH;
        CGFloat y = header.frame.origin.y + header.frame.size.height *2/7;
        CGFloat h =  header.frame.size.height *  3/7;
        UIButton *cancelBtn  = [[UIButton alloc]initWithFrame:CGRectMake(x,y,w,h)];
        [cancelBtn setTitle:@"清除" forState:0];
        
        cancelBtn.titleLabel.textAlignment =NSTextAlignmentCenter;
      //  [cancelBtn.titleLabel setTintColor:colorWithHexString(@"616161")];
       // [cancelBtn setTitleColor:colorWithHexString(@"616161") forState:0];
        [cancelBtn setTitleColor:[UIColor grayColor] forState:0];
        [cancelBtn addTarget:self action:@selector(clear:) forControlEvents:1 << 6];

        [header addSubview:cancelBtn];
       
        
        
        
        
        //开启时间:
        
        CGFloat historyTxtW =  300*KWIDTH;
        CGFloat historyTxtX = header.frame.size.width  *0.5  - historyTxtW *0.5  ;
        CGFloat historyTxtY = header.frame.origin.y + 5*KWIDTH;
        
        
        CGFloat historyTxtH =   header.frame.size.height  - (2 * historyTxtY);
        UILabel *historyTxt  = [[UILabel alloc]initWithFrame:CGRectMake(historyTxtX,historyTxtY,historyTxtW,historyTxtH)];
        historyTxt.text = @"开启时间";
        
        
        
        
        
        
        
        
       // historyTxt.backgroundColor = [UIColor purpleColor];
        
        historyTxt.font = [UIFont systemFontOfSize:53*KWIDTH];
        historyTxt.textAlignment = NSTextAlignmentCenter;
        historyTxt.textColor  = [UIColor blackColor];
        [header addSubview:historyTxt];
        
        
       
        //收起
         UIButton *cut_out_Btn  = [[UIButton alloc]initWithFrame:CGRectMake(header.frame.size.width - x - w ,y,w,h)];
        [cut_out_Btn setTitle:@"完成" forState:0];
        [cut_out_Btn setTitleColor:[UIColor redColor] forState: 0];
        
        cut_out_Btn.titleLabel.textAlignment =NSTextAlignmentCenter;
        //  [cancelBtn.titleLabel setTintColor:colorWithHexString(@"616161")];
        [cut_out_Btn setTitleColor:[UIColor grayColor] forState:0];
        [cut_out_Btn addTarget:self action:@selector( retract:) forControlEvents:1 << 6];
        
        [header addSubview:cut_out_Btn];
        
        
        
        
        
        
        
        
        [self.tableViewMe addSubview:header];
        
    }
    return 0;
}
-(void)clear:(UIButton*)clear{
    
    NSLog(@"清除");
    
    
}
-(void)retract:(UIButton*)outView{
    //收起
    NSLog(@"sd");
    [UIView animateWithDuration:.3 animations:^{
        
        CGRect Q  = self.frame;
        Q.origin.y +=  518*KWIDTH ;
        self.frame = Q;
        
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"it's cell data";
    bottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        //初始化
        cell = [[bottomTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;//设置cell不能点击
        
        
       
        
        
        
        
        
        
        
    }
    
    cell.hour_label.textColor = [UIColor grayColor];
    
    cell.minute_label.textColor = [UIColor grayColor];
    
    
    
    
    
    if(indexPath.row == 0){
        cell.hour_label.text = @"05";
        cell.minute_label.text = @"06";
    }else if (indexPath.row ==   1){
        cell.hour_label.text = @"18";
        cell.minute_label.text = @"19";
        
    }else if (indexPath.row ==  2){
        cell.hour_label.textColor = [UIColor blackColor];
        cell.minute_label.textColor = [UIColor blackColor];
        
        UILabel *hour_unit =  [[UILabel alloc]initWithFrame:CGRectMake(330*KWIDTH,0,40*KWIDTH,77*KWIDTH)];
        hour_unit.text = @"时";
        hour_unit.textColor = [UIColor grayColor];
        //hour_unit.backgroundColor = [UIColor purpleColor];
        
        
        
        [cell.contentView addSubview:hour_unit];
        
        
       
        
        
        
        
        
        
        
        UILabel *minute_unit =  [[UILabel alloc]initWithFrame:CGRectMake(530*KWIDTH,0,40*KWIDTH,77*KWIDTH)];
        minute_unit.text = @"分";
        //minute_unit.backgroundColor = [UIColor redColor];
        
        
        minute_unit.textColor = [UIColor grayColor];
        [cell.contentView addSubview:minute_unit];
        
        
        
        
        
        
        
        
        
        
        
        cell.hour_label.font =  [UIFont systemFontOfSize:50*KWIDTH weight:40*KWIDTH];
        cell.minute_label.font = [UIFont systemFontOfSize:50*KWIDTH weight:40*KWIDTH];
        cell.hour_label.text = @"07";
        cell.minute_label.text = @"20";
    }
    else if (indexPath.row ==  3){
        cell.hour_label.text = @"08";
        cell.minute_label.text = @"21";
    }
    else if (indexPath.row ==  4){
        cell.hour_label.text = @"09";
        cell.minute_label.text = @"22";
    }
   
    return cell;
    
    
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableViewMe deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%ld",(long)indexPath.row);
    //继续做页面跳转操作
    
    if(indexPath.row == 0){
        
    }else if (indexPath.row == 1){
        
    }else if (indexPath.row ==  2){
        
    }else if (indexPath.row ==  3){
        
        
        
        
        
    }
    
}


@end
