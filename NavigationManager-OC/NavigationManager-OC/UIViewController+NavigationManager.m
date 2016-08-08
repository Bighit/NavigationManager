//
//  UIViewController+NavigationManager.m
//  NavigationManager-OC
//
//  Created by Hantianyu on 16/8/8.
//  Copyright © 2016年 HTY. All rights reserved.
//

#import "UIViewController+NavigationManager.h"
#import "NavigationManager.h"
#import "UIViewController+NavigaitonNode.h"
@implementation UIViewController (NavigationManager)
-(void)nextViewController
{
    [[NavigationManager manager] pushWithViewController:self animated:YES];
}
-(void)previousViewController
{
    [[NavigationManager manager] popWithViewController:self to:nil animated:YES];
}
-(void)pushWithPath:(NSString *)path
{
    [[NavigationManager manager] configNavigationPathWithString:path identifier:self.node.identifier];
    [self nextViewController];
}
-(void)popWithClassName:(NSString *)VCName
{
    [[NavigationManager manager] popWithViewController:self to:VCName animated:YES];
}
@end
