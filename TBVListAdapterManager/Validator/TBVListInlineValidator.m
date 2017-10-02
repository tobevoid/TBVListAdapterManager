//
//  TBVListInlineValidator.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/10/2.
//  Copyright © 2017年 tripleCC. All rights reserved.
//
#import "NSError+Validator.h"
#import "TBVListInlineValidator.h"

@implementation TBVListInlineValidator
- (instancetype)initWithValidationBlock:(TBVListInlineValidationBlock)validationBlock {
    if (self = [super init]) {
        _validationBlock = validationBlock;
    }
    return self;
}

- (NSError *)validateValue:(id)value name:(NSString *)name {
    if (self.validationBlock) {
        NSString *message = self.validationBlock(value, name);
        
        if (message.length > 0) {
            return [NSError tbv_errorWithMessage:message validator:self];
        }
    }
    
    return nil;
}
@end
