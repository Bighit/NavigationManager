+//
//  NavigationManager.m
//  NavigationManager-OC
//
//  Created by Hantianyu on 16/7/29.
//  Copyright © 2016年 HTY. All rights reserved.
//

#import "NavigationManager.h"
#import "UIViewController+NavigaitonNode.h"

#define tabChildViewControllerIdentifier @"tab"
#define navigationConfig @[@"ViewController=>ViewController1=>ViewController4",@"ViewController2=>ViewController4"]

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
-(void)pushWithViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (!viewController.node.nextNodePath) {
        for (NSString *configString in navigationConfig) {
            NSMutableArray *array= [NSMutableArray arrayWithArray:[configString componentsSeparatedByString:@"=>"]];
            for (NSString *className in array) {
                [array removeObjectAtIndex:0];
                if ([className isEqualToString:NSStringFromClass(viewController.class)]) {
                    viewController.node.nextNodePath=[NSString stringWithFormat:@"=>%@",[array componentsJoinedByString:@"=>"]];
                }
                break;
            }
            
        }
        
        
    }
    if ([viewController.node getViewController]) {
        NavigationNode *nextNode=[viewController.node getNextNode];
        [_nodeDictionary setObject:nextNode forKey:nextNode.identifier];
        [viewController.navigationController pushViewController:[nextNode getViewController] animated:animated];
        NSLog(@"%@",nextNode.description);
    }
    
}
-(void)popWithViewController:(UIViewController *)viewController to:(NSString *)className animated:(BOOL)animated
{
    if (viewController.node.previousNode&&[viewController.node getViewController]) {
        if (className.length>0) {
            NavigationNode * node=viewController.node.previousNode;
            while  (![className isEqualToString:NSStringFromClass([viewController.node.previousNode getViewController].class)]&&node.previousNode)   {
                node=node.previousNode;
            }
            [_nodeDictionary setObject:node forKey:node.identifier];
            _nodeDictionary[node.identifier]=node;
            NSLog(@"%@",node.description);
            [viewController.navigationController popToViewController:[node getViewController] animated:animated];
        }else{
            [_nodeDictionary setObject:viewController.node.previousNode forKey:viewController.node.previousNode.nextNodePath];
            NSLog(@"%@",viewController.node.previousNode.description);
            [viewController.navigationController popViewControllerAnimated:animated];
        }
    }
}
@end
