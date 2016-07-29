//
//  NavigationManager.m
//  NavigationManager-OC
//
//  Created by Hantianyu on 16/7/29.
//  Copyright © 2016年 HTY. All rights reserved.
//

#import "NavigationManager.h"
#import "NavigationNode.h"
#import "UIViewController+NavigaitonNode.h"

#define tabChildViewControllerIdentifier @"tab"
#define navigationConfig @[@"123"]

@implementation NavigationManager
{
    NSMutableDictionary<NSString *, NavigationNode*> *_nodeDictionary;
}
-(instancetype)init
{
    self=[super init];
    
    if (self) {
        _nodeDictionary=[[NSMutableDictionary alloc]init];;
    }
    return self;
}
+(instancetype)manager
{
    static NavigationManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self new];
    });
    
    return manager;
}
-(void)configWithTabBarController:(UITabBarController *)tabBarController
{
    for (UINavigationController *navViewController in tabBarController.viewControllers) {
        if ([navViewController isKindOfClass:[UINavigationController class]]) {
            UIViewController *vc=navViewController.topViewController;
            NavigationNode *node=[[NavigationNode alloc]initWithViewController:vc identifier:[NSString stringWithFormat:@"%@%lu",tabChildViewControllerIdentifier,[tabBarController.viewControllers indexOfObject:navViewController]]];
   
            [_nodeDictionary setObject:node forKey:node.identifier];
            
        }
    }
}
-(void)addNavigationNode:(NavigationNode *)node
{
    [_nodeDictionary setObject:node forKey:node.identifier];
}
-(void)configNavigationPathWithString:(NSString *)path identifier:(NSString *)identifier
{
    NavigationNode *node=_nodeDictionary[identifier];
    node.nextNodePath=path;
}
-(void)pushWithUIViewController:(UIViewController *)viewController
{
    if (viewController.node.nextNodePath.length>0) {
        for (NSString *configString in navigationConfig) {
            NSMutableArray *array= [configString componentsSeparatedByString:@"=>"];
        }
    }
}
@end
