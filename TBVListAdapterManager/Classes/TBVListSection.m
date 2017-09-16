//
//  TBVListSection.m
//  IGListKitExamples
//
//  Created by tripleCC on 2017/6/15.
//  Copyright © 2017年 Instagram. All rights reserved.
//
#import "TBVListSection.h"
#import "TBVListAdapterManager.h"
#import "TBVListItemBunch.h"
#import "TBVListItem.h"

@interface TBVListSection() <TBVListItemBunchViewSource>
@property (strong, nonatomic, readonly) NSMutableArray <TBVListItemBunch *> *mItemBunches;
@end

@implementation TBVListSection
#pragma mark - init
- (instancetype)init {
    if (self = [super init]) {
        _mItemBunches = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - TBVListItemBunchViewSource
- (NSArray<NSString *> *)supportedElementKindsForBunch:(TBVListItemBunch *)bunch {
    NSMutableArray *kinds = [NSMutableArray array];
    
    if (bunch == self.mItemBunches.firstObject && self.headerConfiguration) {
        [kinds addObject:UICollectionElementKindSectionHeader];
    }
    
    if (bunch == self.mItemBunches.lastObject && self.footerConfiguration) {
        [kinds addObject:UICollectionElementKindSectionFooter];
    }
    
    return kinds;
}

- (UICollectionReusableView *)bunch:(TBVListItemBunch *)bunch viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index {
    UICollectionReusableView *reusableView = nil;
    
    if (bunch == self.mItemBunches.firstObject && elementKind == UICollectionElementKindSectionHeader) {
        TBVListItemBunch *builder = self.mItemBunches.firstObject;
        reusableView = [builder.collectionContext
                        dequeueReusableSupplementaryViewOfKind:elementKind
                        forSectionController:builder
                        class:self.headerConfiguration.reusableClass
                        atIndex:index];
        self.headerConfiguration.configureBlock(self, reusableView);
    } else if (bunch == self.mItemBunches.lastObject && elementKind == UICollectionElementKindSectionFooter) {
        TBVListItemBunch *builder = self.mItemBunches.lastObject;
        reusableView = [builder.collectionContext
                        dequeueReusableSupplementaryViewOfKind:elementKind
                        forSectionController:builder
                        class:self.footerConfiguration.reusableClass
                        atIndex:index];
        self.footerConfiguration.configureBlock(self, reusableView);
    }
    
    return reusableView;
}

- (CGSize)bunch:(TBVListItemBunch *)bunch sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index {
    if (bunch == self.mItemBunches.firstObject && elementKind == UICollectionElementKindSectionHeader) {
        return self.headerConfiguration.supplementarySize;
    } else if (bunch == self.mItemBunches.lastObject && elementKind == UICollectionElementKindSectionFooter) {
        return self.footerConfiguration.supplementarySize;
    }
    return CGSizeZero;
}

#pragma mark - public
- (void)addItemBunch:(TBVListItemBunch *)bunch {
    NSParameterAssert(bunch);
    
    bunch->_bunchViewSource = self;
    if (self.mItemBunches.count > 1) {
        self.mItemBunches.lastObject->_bunchViewSource = nil;
    }
    
    bunch->_associatedSection = self;
    [self.mItemBunches addObject:bunch];
}
    
- (void)insertItemBunch:(TBVListItemBunch *)bunch atIndex:(NSInteger)index {
    NSParameterAssert(bunch);
    
    bunch->_bunchViewSource = self;
    if (self.mItemBunches.count > 1 && index > self.mItemBunches.count) {
        self.mItemBunches.lastObject->_bunchViewSource = nil;
    }
    
    bunch->_associatedSection = self;
    [self.mItemBunches insertObject:bunch atIndex:index];
}


- (void)addItemBunches:(NSArray<TBVListItemBunch *> *)objects {
    for (TBVListItemBunch *object in objects) {
        [self addItemBunch:object];
    }
}
    
- (void)removeItemBunch:(TBVListItemBunch *)bunch {
    NSParameterAssert(bunch);
    
    [self.mItemBunches removeObject:bunch];
}
    
- (void)removeAllItemBunches {
    [self.mItemBunches removeAllObjects];
}

- (void)removeAll {
    for (TBVListItemBunch *bunch in self.mItemBunches) {
        [bunch removeAllItems];
    }
    [self.mItemBunches removeAllObjects];
}
    
- (void)reload {
    [self.associatedManager.adapter reloadObjects:self.mItemBunches];
}

#pragma mark - getter
- (NSArray <TBVListItemBunch *> *)itemBunches {
    return self.mItemBunches;
}

- (NSInteger)index {
    return [self.associatedManager.sections indexOfObject:self];
}
@end
