//
//  TBVListValidator.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import "TBVListValidator.h"

@implementation TBVListValidator
@synthesize validatorMessage = _validatorMessage;
@synthesize validatorMessageGenerateBlock = _validatorMessageGenerateBlock;

+ (instancetype)validator {
    return [[self alloc] init];
}

- (nullable NSError *)validateValue:(nullable id)value name:(nonnull NSString *)name {
    return nil;
}
@end
