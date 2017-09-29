//
//  TBVListTraversableProtocol.h
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/29.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ListTraversableProtocol)
/**
 遍历block
 carrier 载体
 value 上一个载体输出的值
 */
@protocol TBVListTraversableProtocol <NSObject>
@property (strong, nonatomic) _Nullable id (^traversalBlock)(_Nonnull id carrier, _Nullable id value);

/**
 执行遍历

 @param value 上一个载体输出值
 @return 给下一个载体的值
 */
- (nullable id)excuteTraverse:(nullable id)value;
@end
NS_ASSUME_NONNULL_END
