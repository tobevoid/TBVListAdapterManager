//
//  NSError+Validator.h
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
NS_SWIFT_NAME(ListAdapterValidationError)
CF_EXPORT NSString *const TBVListAdapterValidationError;
NS_SWIFT_NAME(ListAdapterValidationErrorDescriptionKey)
CF_EXPORT NSString *const TBVListAdapterValidationErrorDescriptionKey;
NS_SWIFT_NAME(ListAdapterValidationErrorValidatorKey)
CF_EXPORT NSString *const TBVListAdapterValidationErrorValidatorKey;
NS_SWIFT_NAME(ListAdapterValidationErrorDefaultCode)
CF_EXPORT NSInteger const TBVListAdapterValidationErrorDefaultCode;

@protocol TBVListValidatorProtocol;
@interface NSError (Validator)
+ (instancetype)tbv_errorWithCode:(NSInteger)code message:(nullable NSString *)message validator:(nullable id <TBVListValidatorProtocol>)validator;
+ (instancetype)tbv_errorWithMessage:(nullable NSString *)message validator:(nullable id <TBVListValidatorProtocol>)validator;
+ (instancetype)tbv_errorWithCode:(NSInteger)code message:(nullable NSString *)message;
+ (instancetype)tbv_errorWithMessage:(nullable NSString *)message;
@end
NS_ASSUME_NONNULL_END
