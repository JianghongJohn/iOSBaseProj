//
//  JHHttpMock.m
//  mainPro
//
//  Created by rtour on 2020/4/17.
//  Copyright © 2020 rtour. All rights reserved.
//

#import "JHHttpMock.h"
#import <GYHttpMock/GYHttpMock.h>

@implementation JHHttpMock
+ (instancetype)sharedInstance {
    static JHHttpMock *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JHHttpMock alloc] init];
    });
    
    return instance;
}

- (void)setEnable:(BOOL)enable {
    _enable = enable;
    if (enable) {
        [self httpMock];
    }
}

/**
 *在此处使用mock的api将会直接获取json内的数据，而不需要去改相应的代码
 */
- (void)httpMock {
//    //replace
//    mockRequest(@"POST", @"(.*?)/main/replace.htm(.*?)".regex).andReturn(200).withJsonFilePath([[NSBundle mainBundle] pathForResource:@"replace" ofType:@"json"]);
    
}
@end
