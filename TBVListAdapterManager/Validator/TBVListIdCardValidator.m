//
//  TBVListIdCardValidator.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//
#import "NSError+Validator.h"
#import "TBVListIdCardValidator.h"

@implementation TBVListIdCardValidator
- (NSError *)validateValue:(id)value name:(NSString *)name {
    if ([value isKindOfClass:[NSString class]] && [value length] > 0 && ![[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)"] evaluateWithObject:value]) {
        return [NSError tbv_errorWithMessage:[NSString stringWithFormat:@"%@格式不正确!", name] validator:self];
    }
    return nil;
}
@end
