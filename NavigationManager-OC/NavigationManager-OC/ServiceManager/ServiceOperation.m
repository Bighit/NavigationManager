//
//  ServiceOperation.m
//  NavigationManager-OC
//
//  Created by hty on 16/8/8.
//  Copyright © 2016年 HTY. All rights reserved.
//

#import "ServiceOperation.h"

@interface ServiceOperation ()
{
    BOOL _isExecuting;
    BOOL _isFinished;
    id<ServiceDelegate> _service;
}
@end
@implementation ServiceOperation
-(void)main
{
    [self willChangeValueForKey:@"isExecuting"];
    _isExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];
    
    if (self.runWithMainThread) {
        [self syncService];
        
    } else {
        
       [self asyncService];
        
    }
}
- (BOOL)isConcurrent
{
    if(self.runWithMainThread)
    {
       return NO;
    }else
    {
        return YES;
    }
    
}
-(void)finish
{
    if (_isFinished||!_isExecuting) {
        return;
    }
    [self willChangeValueForKey:@"isExecuting"];
    [self willChangeValueForKey:@"isFinished"];
    
    _isExecuting = NO;
    _isFinished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}
- (void)cancel
{
    [super cancel];
    if (!self.runWithMainThread && _service) {
        if ([_service respondsToSelector:@selector(cancelService)]) {
            [_service cancelService];
        }
    }
    [self finish];
}
-(instancetype)initWithService:(id<ServiceDelegate>)service
{
    self= [super init];
    if (self) {
        _service=service;
    }
    return self;
    
}
-(void)asyncService
{
    if (!_service) {
        [self finish];
        return;
    }
    if ([_service respondsToSelector:@selector(callService)]) {
        [_service callService];
    }
    if (self.completeBlock) {
        self.completeBlock(nil);
    }
}
-(void)syncService
{
    if (self.isCancelled) {
        <#statements#>
    }
}
@end
