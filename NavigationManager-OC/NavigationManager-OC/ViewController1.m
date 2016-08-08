//
//  ViewController1.m
//  NavigationManager-OC
//
//  Created by Hantianyu on 16/8/1.
//  Copyright © 2016年 HTY. All rights reserved.
//

#import "ViewController1.h"
#import "UIViewController+NavigationManager.h"
#import "NavigationManager.h"
#import "ServiceManager.h"
@implementation ViewController1
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor greenColor]];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(50, 50, 100, 100)];
    button.backgroundColor=[UIColor whiteColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setFrame:CGRectMake(200, 50, 100, 100)];
    button1.backgroundColor=[UIColor whiteColor];
    [button1 addTarget:self action:@selector(buttonClick1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)buttonClick:(id)sender{
    [self nextViewController];
}
-(void)buttonClick1:(id)sender{
//    [self previousViewController];
//    for(int i=0; i<1000 ;i++)
//    {
//        [ServiceManager loadService:@"test1Service" withCallBack:^{
//            NSLog(@"12312312");
//        }];
    NSDictionary *dic=[ServiceManager syncServiceData:@"test2Service" withParams:nil];
    NSLog(@"%@",dic);
//    }
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
