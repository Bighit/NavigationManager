//
//  NavigationManager.h
//  NavigationManager-OC
//
//  Created by Hantianyu on 16/7/29.
//  Copyright © 2016年 HTY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NavigationNode.h"

@interface NavigationManager : NSObject
+(instancetype)manager;
-(void)configWithTabBarController:(UITabBarController *)tabBarController;
-(void)addNavigationNode:(NavigationNode *)node;
-(void)configNavigationPathWithString:(NSString *)path identifier:(NSString *)identifier;
-(void)pushWithViewController:(UIViewController *)viewController animated:(BOOL)animated;
-(void)popWithViewController:(UIViewController *)viewController to:(NSString *)className animated:(BOOL)animated;
@end
