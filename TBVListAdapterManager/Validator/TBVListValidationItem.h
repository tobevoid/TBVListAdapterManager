//
//  TBVListValidationItem.h
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import "TBVListItem.h"
#import "TBVListValidatorProtocol.h"

NS_ASSUME_NONNULL_BEGIN
NS_SWIFT_NAME(ListValidationItem)
@interface TBVListValidationItem : TBVListItem <TBVListVerifiableProtocol>
/**
 校验者
 */
@property (strong, nonatomic, nullable) NSArray <TBVListValidatorProtocol> *validators;

/**
 根据获取错误策略，校验某个值
 
 在子类的 'validate:' 方法中，调用这个方法以校验某个值
 
 @param value 校验值
 @param name 提示名称
 @param strategy 获取策略
 @return 校验出现错误
 */
- (NSArray <NSError *> *)validateValue:(nullable id)value name:(nonnull NSString *)name strategy:(TBVListVerifiableGainStrategy)strategy;
@end
NS_ASSUME_NONNULL_END
