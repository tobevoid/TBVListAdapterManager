//
//  TBVListValidationItem.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import "TBVListValidationItem.h"
#import "NSError+Validator.h"

@implementation TBVListValidationItem
- (NSArray<NSError *> *)validate:(TBVListVerifiableGainStrategy)strategy {
    return nil;
}

- (NSArray <NSError *> *)validateValue:(id)value name:(NSString *)name strategy:(TBVListVerifiableGainStrategy)strategy {
    NSMutableArray *errors = [NSMutableArray array];
    
    for (id <TBVListValidatorProtocol> validator in self.validators) {
        NSError *error = [validator validateValue:value name:name];
        
        if (!error) continue;
        
        NSInteger code = -1;
        if ([validator respondsToSelector:@selector(priority)]) {
            code = validator.priority;
        }
        
        if ([validator respondsToSelector:@selector(validatorMessage)] && validator.validatorMessage.length > 0) {
            error = [NSError tbv_errorWithCode:code message:validator.validatorMessage validator:validator];
        }
        
        if ([validator respondsToSelector:@selector(validatorMessageGenerateBlock)] && validator.validatorMessageGenerateBlock) {
            NSString *message = validator.validatorMessageGenerateBlock(value, name);
            if (message.length > 0) {
                error = [NSError tbv_errorWithCode:code message:message validator:validator];
            }
        }
        
        [errors addObject:error];
    }
    
    if (errors.count) {
        switch (strategy) {
            case TBVListVerifiableGainStrategyAll:
                return errors;
            case TBVListVerifiableGainStrategyFirst:
                return @[errors.firstObject];
            case TBVListVerifiableGainStrategyLast:
                return @[errors.lastObject];
        }
    }
    
    return nil;
}
@end
