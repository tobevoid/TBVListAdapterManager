//
//  TBVListEmptyValidator.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//
#import "NSError+Validator.h"
#import "TBVListEmptyValidator.h"

@implementation TBVListEmptyValidator
- (NSError *)validateValue:(id)value name:(NSString *)name {
    if (!value) {
        return [NSError tbv_errorWithMessage:[NSString stringWithFormat:@"%@不能为空!", name] validator:self];
    }
    
    if ([value isKindOfClass:[NSString class]] && [value length] == 0) {
        return [NSError tbv_errorWithMessage:[NSString stringWithFormat:@"%@不能为空!", name] validator:self];
    }
    return nil;
}
@end
