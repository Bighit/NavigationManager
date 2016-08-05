//
//  CommonService.m
//  NavigationManager-OC
//
//  Created by Hantianyu on 16/8/5.
//  Copyright © 2016年 HTY. All rights reserved.
//

#import "CommonServiceOperator.h"
@interface CommonServiceOperator ()
{
    void(^_serviceCallback)();
}
@end
@implementation CommonServiceOperator
-(void)setService:(id<ServiceDelegate>)service
{
    self.service=service;
}
-(void)setServices:(NSArray<id<ServiceDelegate>> *)serviceArray
{
    for (id<ServiceDelegate>service in serviceArray) {
        <#statements#>
    }
}
-(void)callServiceWithCallback:(void (^)())block
{
    _serviceCallback=block;
    if (self.runWithMainThread) {
       dispatch_async(dispatch_get_main_queue(), ^{
           [self.service callService];
           _serviceCallback();
       });
    }else
    {
        dispatch_queue_t    queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_group_t    group = dispatch_group_create();
        dispatch_group_async(group, queue, ^{
            [self.service callService];
        });
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            _serviceCallback();
        });
    }
}
@end
