//
//  test2Service.m
//  NavigationManager-OC
//
//  Created by Hantianyu on 16/8/8.
//  Copyright © 2016年 HTY. All rights reserved.
//

#import "test2Service.h"

@implementation test2Service
-(NSDictionary *)callService:(NSDictionary *)dic
{
//    NSLog(@"235234234234")
    NSString *string=[dic objectForKey:@"number"];
//    NSLog(@"test1Service run %f,%@",sqrt(100)+[string intValue],[NSThread currentThread]);
    return @{@"number":[NSString stringWithFormat:@"%f",sqrt(100)+[string intValue]]};
}
@end
