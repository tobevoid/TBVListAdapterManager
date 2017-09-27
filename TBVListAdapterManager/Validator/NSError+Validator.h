//
//  NSError+Validator.h
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
CF_EXPORT NSString *const TBVListAdapterValidationError;
CF_EXPORT NSString *const TBVListAdapterValidationErrorDescriptionKey;
CF_EXPORT NSString *const TBVListAdapterValidationErrorValidatorKey;
CF_EXPORT NSInteger const TBVListAdapterValidationErrorDefaultCode;

@protocol TBVListValidatorProtocol;
@interface NSError (Validator)
+ (instancetype)tbv_errorWithCode:(NSInteger)code message:(nullable NSString *)message validator:(nullable id <TBVListValidatorProtocol>)validator;
+ (instancetype)tbv_errorWithMessage:(nullable NSString *)message validator:(nullable id <TBVListValidatorProtocol>)validator;
+ (instancetype)tbv_errorWithCode:(NSInteger)code message:(nullable NSString *)message;
+ (instancetype)tbv_errorWithMessage:(nullable NSString *)message;
@end
NS_ASSUME_NONNULL_END
