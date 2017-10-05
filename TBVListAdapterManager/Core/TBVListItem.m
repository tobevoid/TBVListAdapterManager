//
//  TBVListItem.m
//  IGListKitExamples
//
//  Created by tripleCC on 2017/6/15.
//  Copyright © 2017年 Instagram. All rights reserved.
//

#import "TBVListItem.h"
#import "TBVListItemBunch.h"

@implementation TBVListItem
- (instancetype)init {
    if (self = [super init]) {
        _cellSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 44.0f);
        _enableSelection = YES;
    }
    
    return self;
}

- (void)reloadAnimated:(BOOL)animated completion:(void (^)(BOOL))completion {
    [self.associatedBunch.collectionContext performBatchAnimated:animated updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
        [batchContext reloadInSectionController:self.associatedBunch atIndexes:[NSIndexSet indexSetWithIndex:self.index]];
    } completion:completion];
}

- (void)reloadAnimated:(BOOL)animated {
    [self reloadAnimated:animated completion:nil];
}

- (void)reload {
    [self reloadAnimated:NO];
}

- (NSInteger)index {
    return [self.associatedBunch.items indexOfObject:self];
}
@end
