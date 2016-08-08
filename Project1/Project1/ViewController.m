//
//  ViewController.m
//  Project1
//
//  Created by Hantianyu on 16/8/1.
//  Copyright © 2016年 HTY. All rights reserved.
//

#import "ViewController.h"
#import "NavigationManagerFramework.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(50, 50, 100, 100)];
    button.backgroundColor=[UIColor whiteColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)buttonClick:(id)sender{
    [self pushWithPath:@"=>ViewController1=>ViewController1=>ViewController1=>ViewController1"];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
