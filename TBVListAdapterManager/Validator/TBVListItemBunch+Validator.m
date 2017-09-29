//
//  TBVListItemBunch+Validator.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/27.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import "TBVListValidationItem.h"
#import "TBVListItemBunch+Validator.h"

@implementation TBVListItemBunch (Validator)
- (NSArray<NSError *> *)validate:(TBVListVerifiableGainStrategy)strategy {
    NSMutableArray *array = [NSMutableArray array];
    for (TBVListItem *item in self.items) {
        if ([item isKindOfClass:[TBVListValidationItem class]]) {
            NSArray *errors = [(TBVListValidationItem *)item validate:strategy];
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
    }
    return array.count > 0 ? array : nil;
}
@end
