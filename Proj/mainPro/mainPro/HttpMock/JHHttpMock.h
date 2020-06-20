//
//  JHHttpMock.h
//  mainPro
//
//  Created by rtour on 2020/4/17.
//  Copyright © 2020 rtour. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHHttpMock : NSObject
+ (instancetype)sharedInstance;

@property (nonatomic, assign) BOOL enable;
@end

NS_ASSUME_NONNULL_END
