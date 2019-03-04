//
//  bottomTableViewCell.m
//  popBox
//
//  Created by 万烨 on 2019/3/4.
//  Copyright © 2019 wy. All rights reserved.
//

#import "bottomTableViewCell.h"

//宏定义获取屏幕宽
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//宏定义获取屏幕高
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//宏定义像素宽
#define KWIDTH [UIScreen mainScreen].bounds.size.width/750.0
@implementation bottomTableViewCell

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        
        self.hour_label = [[UILabel alloc]init];
        
        self.minute_label = [[UILabel alloc]init];
     
        
        
        //加载
        
        [self addSubview:self.hour_label];
        
        [self addSubview:self.minute_label];
        
        
        
       
        
        
    }
    
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
     CGFloat hour_labeX = 260 * KWIDTH;
    CGFloat hour_labeY = 0*KWIDTH;
    CGFloat hour_labeW = 90*KWIDTH;
    CGFloat hour_labeH =  77*KWIDTH;
    
    
    
    CGFloat minute_labelX = hour_labeW + hour_labeX + 100*KWIDTH;
    CGFloat minute_labelY = hour_labeY;
    CGFloat minute_labelW = hour_labeW;
    CGFloat minute_labelH = hour_labeH;
    
    
    
    
    
    
    
    
    
    
    //frame
    self.hour_label.frame = CGRectMake(hour_labeX,hour_labeY,hour_labeW,hour_labeH);
    self.minute_label.frame = CGRectMake(minute_labelX,minute_labelY,minute_labelW,minute_labelH);
    
    
    
    
    
    
    
    
    
}


//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
