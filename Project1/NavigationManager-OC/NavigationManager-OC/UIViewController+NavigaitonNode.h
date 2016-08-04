//
//  UIViewController+NavigaitonNode.h
//  NavigationManager-OC
//
//  Created by Hantianyu on 16/7/29.
//  Copyright © 2016年 HTY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationNode.h"
static const NSString *nodekey=@"navigationNodeKey";
@interface UIViewController (NavigaitonNode)


@property(nonatomic,strong)NavigationNode *node;
@end


