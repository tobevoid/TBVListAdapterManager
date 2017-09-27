//
//  TBVListAdapterManager+Validator.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import "TBVListAdapterManager+Validator.h"
#import "TBVListSection+Validator.h"

@implementation TBVListAdapterManager (Validator)
- (NSArray<NSError *> *)validate {
    return [self validate:TBVListVerifiableGainStrategyFirst];
}

- (nullable NSArray <NSError *> *)validate:(TBVListVerifiableGainStrategy)strategy {
    NSMutableArray *array = [NSMutableArray array];
    for (TBVListSection *section in self.sections) {
        NSArray *errors = [section validate:strategy];
        if (errors.count > 0) {
            switch (strategy) {
                case TBVListVerifiableGainStrategyAll:
                    [array addObjectsFromArray:errors];
                    break;
                case TBVListVerifiableGainStrategyFirst:
                    [array addObject:errors.firstObject];
                    break;
                case TBVListVerifiableGainStrategyLast:
                    [array addObject:errors.lastObject];
                    break;
            }
        }
    }
    return array;
}
@end
