



//宏定义获取屏幕宽
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//宏定义获取屏幕高
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//宏定义像素宽
#define KWIDTH [UIScreen mainScreen].bounds.size.width/750.0 
#import "ViewController.h"
#import "operationRecord.h"
@interface ViewController ()
{
    operationRecord *viewTr;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    
    
    
    
    
    
    
    
}


- (IBAction)push:(UIButton *)sender {
    
    viewTr = [[operationRecord alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width,0)];
    // viewTr.backgroundColor = [UIColor yellowColor];
    viewTr.userInteractionEnabled = YES;//交互
    [self.view addSubview:viewTr];
    CGRect originalRect = CGRectMake(0,  [UIScreen mainScreen].bounds.size.height ,SCREEN_WIDTH,518*KWIDTH);
    
    CGRect targetRect = CGRectMake(0, SCREEN_HEIGHT - originalRect.size.height, SCREEN_WIDTH, 518*KWIDTH);
    //初始位置
    viewTr.frame = originalRect;
    
    
    
    
    
    //动画
    [UIView animateWithDuration:.3 animations:^{
        viewTr.frame = targetRect;
    }];
    
    
    
    
    
}



@end
