//
//  TBVValidatorProtocol.h
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 校验者协议
 */
NS_SWIFT_NAME(ListValidatorProtocol)
@protocol TBVListValidatorProtocol <NSObject>
+ (nonnull instancetype)validator;

/**
 验证特定值
 优先级 低
 @param value 特定值
 @param name 条目名
 @return 错误信息
 */
- (nullable NSError *)validateValue:(nullable id)value name:(nonnull NSString *)name;

@optional
/**
 验证提示信息
 优先级 中
 */
@property (strong, nonatomic, nullable) NSString *validatorMessage;

/**
 验证提示生成器
 优先级 高
 */
@property (strong, nonatomic, nullable) NSString *(^validatorMessageGenerateBlock)(id _Nullable  value,  NSString * _Nonnull name);

/**
 验证器优先级
 @return 验证器优先级
 */
- (NSUInteger)priority;
@end

typedef NS_ENUM(NSInteger, TBVListVerifiableGainStrategy) {
    TBVListVerifiableGainStrategyAll, /// 获取所有错误
    TBVListVerifiableGainStrategyFirst, /// 获取第一个错误
    TBVListVerifiableGainStrategyLast, /// 获取最后一个错误
};

/**
 可校验协议
 */
NS_SWIFT_NAME(ListVerifiableProtocol)
@protocol TBVListVerifiableProtocol <NSObject>
/**
 验证出发方法
 @return 所有的错误信息
 */
- (nullable NSArray <NSError *> *)validate:(TBVListVerifiableGainStrategy)strategy;
@end

NS_ASSUME_NONNULL_END
