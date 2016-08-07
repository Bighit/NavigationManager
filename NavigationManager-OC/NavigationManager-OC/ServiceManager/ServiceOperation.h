//
//  ServiceOperation.h
//  NavigationManager-OC
//
//  Created by hty on 16/8/8.
//  Copyright © 2016年 HTY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceDelegate.h"
typedef void (^ ServiceCompleteBlock)( NSDictionary * _Nullable result);

@interface ServiceOperation : NSOperation
@property(nonatomic,assign)BOOL runWithMainThread;
@property(nonatomic,copy,nullable)ServiceCompleteBlock completeBlock;

-(nullable instancetype )initWithService:(nonnull id<ServiceDelegate>)service;
@end
