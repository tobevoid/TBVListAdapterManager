//
//  TBVListLengthValidator.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//
#import "NSError+Validator.h"
#import "TBVListLengthValidator.h"

@interface TBVListLengthValidator()
@property (assign, nonatomic) NSUInteger min;
@property (assign, nonatomic) NSUInteger max;
@end

@implementation TBVListLengthValidator
- (instancetype)initWithMin:(NSUInteger)min {
    return [self initWithMin:min max:HUGE];
}

- (instancetype)initWithMax:(NSUInteger)max {
    return [self initWithMin:0 max:max];
}

- (instancetype)initWithMin:(NSUInteger)min max:(NSUInteger)max {
    if (self = [super init]) {
        _max = max;
        _min = min;
    }
    return self;
}

- (NSError *)validateValue:(id)value name:(NSString *)name {
    if ([value isKindOfClass:[NSString class]]) {
        NSString *message = nil;
        NSUInteger length = [value length];
        
        if (length < self.min) {
            return [NSError tbv_errorWithMessage:message = [NSString stringWithFormat:@"%@必须大于%ld位!", name, self.min] validator:self];
        }
        
        if (length > self.max) {
            return [NSError tbv_errorWithMessage:[NSString stringWithFormat:@"%@必须小于%ld位!", name, self.min] validator:self];
        }
    }
    
    return nil;
}
@end
