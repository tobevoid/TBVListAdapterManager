//
//  TBVListAdapterManager+Validator.h
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import "TBVListAdapterManager.h"
#import "TBVListValidatorProtocol.h"

@interface TBVListAdapterManager (Validator) <TBVListVerifiableProtocol>
- (nullable NSArray <NSError *> *)validate;
@end
