//
//  CommonService.h
//  NavigationManager-OC
//
//  Created by Hantianyu on 16/8/5.
//  Copyright © 2016年 HTY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceDelegate.h"
@interface CommonServiceOperator : NSObject
@property(nonatomic,copy,readonly,nonnull)NSArray<id<ServiceDelegate>>* serviceArray;
@property(nonatomic,assign)BOOL runWithMainThread;
-(void)setService:(nonnull id<ServiceDelegate>)service;
-(void)setServices:(nonnull NSArray<id<ServiceDelegate>>*)serviceArray;
-(void)callServiceWithCallback:(nullable void(^)())block;
@end
