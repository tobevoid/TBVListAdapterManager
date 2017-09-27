//
//  TBVListMobileValidator.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//
#import "NSError+Validator.h"
#import "TBVListMobileValidator.h"

@implementation TBVListMobileValidator
- (NSError *)validateValue:(id)value name:(NSString *)name {
    if ([value isKindOfClass:[NSString class]] && [value length] > 0 && ![[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$"] evaluateWithObject:value]) {
        return [NSError tbv_errorWithMessage:[NSString stringWithFormat:@"%@格式不正确!", name] validator:self];
    }
    return nil;
}
@end
