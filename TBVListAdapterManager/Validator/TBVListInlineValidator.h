//
//  TBVListInlineValidator.h
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/10/2.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import "TBVListValidator.h"

NS_ASSUME_NONNULL_BEGIN
NS_SWIFT_NAME(ListInlineValidationBlock)
typedef NSString  * _Nullable (^TBVListInlineValidationBlock)(_Nullable id value,  NSString * _Nonnull name);
NS_SWIFT_NAME(ListInlineValidator)
@interface TBVListInlineValidator : TBVListValidator
@property (copy, nonatomic, nonnull) NSString  * _Nullable (^validationBlock)(_Nullable id value,  NSString * _Nonnull name);
- (instancetype)initWithValidationBlock:(nonnull TBVListInlineValidationBlock)validationBlock;
@end
NS_ASSUME_NONNULL_END
