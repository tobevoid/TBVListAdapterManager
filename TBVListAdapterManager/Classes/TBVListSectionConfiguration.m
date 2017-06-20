//
//  TBVListSectionConfiguration.m
//  IGListKitExamples
//
//  Created by tripleCC on 2017/6/19.
//  Copyright © 2017年 Instagram. All rights reserved.
//

#import "TBVListSectionConfiguration.h"

@implementation TBVListSectionConfiguration
- (instancetype)initWithSupplementarySize:(CGSize)supplementarySize reusableClass:(Class)reusableClass configureBlock:(TBVListSectionConfigureBlock)configureBlock {
    if (self = [super init]) {
        _supplementarySize = supplementarySize;
        _reusableClass = reusableClass;
        _configureBlock = configureBlock;
    }
    
    return self;
}
@end
