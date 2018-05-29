//
//  XLsn0wOnce.m
//  XLsn0wXib
//
//  Created by ginlong on 2018/5/29.
//  Copyright © 2018年 XLsn0w. All rights reserved.
//

#import "XLsn0wOnce.h"

@implementation XLsn0wOnce

+ (XLsn0wOnce *)shared {
    
    static dispatch_once_t onceToken;
    static XLsn0wOnce *once = nil;
    
    dispatch_once(&onceToken, ^{
        once = [[self alloc] init];
    });
    
    return once;
}

- (void)remoteNotificationDictionary:(NSDictionary *)dict naviController:(UINavigationController*)naviController {
    // 根据字典字段反射出我们想要的类，并初始化控制器
    Class class = NSClassFromString(dict[@"className"]);
    UIViewController *vc = [[class alloc] init];
    // 获取参数列表，使用枚举的方式，对控制器属性进行KVC赋值
    NSDictionary *parameter = dict[@"propertys"];
    [parameter enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        // 在属性赋值时，做容错处理，防止因为后台数据导致的异常
        if ([vc respondsToSelector:NSSelectorFromString(key)]) {
            [vc setValue:obj forKey:key];
        }
    }];
    [naviController pushViewController:vc animated:YES];
    // 从字典中获取方法名，并调用对应的方法
    SEL selector = NSSelectorFromString(dict[@"method"]);
    // 如果想消除黄色警告，可以通过clang编译指令消除
    [vc performSelector:selector];
}

- (void)testRemoteNotification {
    // 模拟远程通知的调用
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSDictionary *dict = @{
                               // 类名
                               @"className" : @"UserInfoViewController",
                               // 数据参数
                               @"propertys" : @{@"name": @"liuxiaozhuang",
                                                @"age": @3},
                               // 调用方法名
                               @"method" : @"refreshUserInformation"};
        

        
    });
}



@end
