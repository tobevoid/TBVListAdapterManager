//
//  TBVListValidator.h
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBVListValidatorProtocol.h"

NS_ASSUME_NONNULL_BEGIN
NS_SWIFT_NAME(ListValidator)
@interface TBVListValidator : NSObject <TBVListValidatorProtocol>
// override the method
- (nullable NSError *)validateValue:(nullable id)value name:(nonnull NSString *)name;
@end
NS_ASSUME_NONNULL_END
