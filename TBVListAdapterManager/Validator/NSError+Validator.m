//
//  NSError+Validator.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import "NSError+Validator.h"
#import "TBVListValidatorProtocol.h"

NSString *const TBVListAdapterValidationError = @"List Adapter Validation Error";
NSString *const TBVListAdapterValidationErrorDescriptionKey = @"TBVListAdapterValidationErrorDescriptionKey";
NSString *const TBVListAdapterValidationErrorValidatorKey = @"TBVListAdapterValidationErrorValidatorKey";
NSInteger const TBVListAdapterValidationErrorDefaultCode = -1;

@implementation NSError (Validator)
+ (instancetype)tbv_errorWithCode:(NSInteger)code message:(NSString *)message validator:(id <TBVListValidatorProtocol>)validator {
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[TBVListAdapterValidationErrorDescriptionKey] = message;
    userInfo[TBVListAdapterValidationErrorValidatorKey] = validator;
    return [self errorWithDomain:TBVListAdapterValidationError code:code userInfo:userInfo];
}

+ (instancetype)tbv_errorWithMessage:(NSString *)message validator:(id<TBVListValidatorProtocol>)validator {
    return [self tbv_errorWithCode:TBVListAdapterValidationErrorDefaultCode message:message validator:validator];
}

+ (instancetype)tbv_errorWithCode:(NSInteger)code message:(NSString *)message {
    return [self tbv_errorWithCode:code message:message validator:nil];
}

+ (instancetype)tbv_errorWithMessage:(NSString *)message {
    return [self tbv_errorWithCode:TBVListAdapterValidationErrorDefaultCode message:message];
}
@end
