//
//  TBVListLengthValidator.h
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import "TBVListValidator.h"

NS_SWIFT_NAME(ListLengthValidator)
@interface TBVListLengthValidator : TBVListValidator
- (instancetype)initWithMin:(NSUInteger)min max:(NSUInteger)max;
- (instancetype)initWithMax:(NSUInteger)max;
- (instancetype)initWithMin:(NSUInteger)min;
@end
