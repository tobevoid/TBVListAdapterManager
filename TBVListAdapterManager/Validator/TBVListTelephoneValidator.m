//
//  TBVListTelephoneValidator.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/10/19.
//  Copyright © 2017年 tripleCC. All rights reserved.
//
#import "NSError+Validator.h"
#import "TBVListTelephoneValidator.h"

@implementation TBVListTelephoneValidator
- (NSError *)validateValue:(id)value name:(NSString *)name {
    if ([value isKindOfClass:[NSString class]] && [value length] > 0 && ![[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"((\\d{3,4})|\\d{3,4}-|\\s)?\\d{7,14}"] evaluateWithObject:value]) {
        return [NSError tbv_errorWithMessage:[NSString stringWithFormat:@"%@格式不正确!", name] validator:self];
    }
    return nil;
}
@end
