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
@property (strong, nonatomic, nullable) NSArray <TBVListValidatorProtocol> *validators;

- (NSArray <NSError *> *)validateValue:(nullable id)value name:(nonnull NSString *)name strategy:(TBVListVerifiableGainStrategy)strategy;
@end
NS_ASSUME_NONNULL_END
