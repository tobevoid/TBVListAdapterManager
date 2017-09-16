//
//  TBVListItemBunch.m
//  IGListKitExamples
//
//  Created by tripleCC on 2017/6/16.
//  Copyright © 2017年 Instagram. All rights reserved.
//
#import "TBVListItemBunch.h"
#import "TBVListAdapterManager.h"
#import "TBVListSection.h"
#import "TBVListItem.h"
#import "TBVListCellProtocol.h"

@interface TBVListItemBunch () <IGListSupplementaryViewSource>
@property (strong, nonatomic) NSMutableArray <TBVListItem *> *mItems;
@end

@implementation TBVListItemBunch
#pragma mark - init
- (instancetype)initWithItem:(TBVListItem *)item {
    if (self = [super init]) {
        _mItems = [NSMutableArray array];
        if (item) {
            [self addItem:item];
        }
        
        self.supplementaryViewSource = self;
    }
    
    return self;
}

- (instancetype)init {
    return [self initWithItem:nil];
}

#pragma mark - IGListSupplementaryViewSource
- (NSArray<NSString *> *)supportedElementKinds {
    return [_bunchViewSource supportedElementKindsForBunch:self];
}

- (UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index {
    return [_bunchViewSource bunch:self viewForSupplementaryElementOfKind:elementKind atIndex:index];
}

- (CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index {
    return [_bunchViewSource bunch:self sizeForSupplementaryViewOfKind:elementKind atIndex:index];
}

#pragma mark - override
- (NSInteger)numberOfItems {
    return self.mItems.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return self.mItems[index].cellSize;
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    TBVListItem *item = self.mItems[index];
    
    Class cellClass = NSClassFromString(item.associatedBunch.associatedSection.associatedManager.itemMapping[NSStringFromClass([item class])]);
    
    NSAssert(cellClass, @"can't find cell class for item %@ in %@", item, self.mItems);
    
    UICollectionViewCell <TBVListCellProtocol> *cell = [self.collectionContext dequeueReusableCellOfClass:cellClass forSectionController:self atIndex:index];
    
    [cell configureItem:item];
    
    return cell;
}

- (void)didUpdateToObject:(TBVListItemBunch *)object {
    self.mItems = (NSMutableArray *)object.items;
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    TBVListItem *item = self.items[index];
    if (item.selectBlock) {
        item.selectBlock(item);
    }
}

#pragma mark - IGListDiffable
- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id)object {
    // since the diff identifier returns self, object should only be compared with same instance
    return self == object;
}

#pragma mark - public
- (void)addItem:(TBVListItem *)item {
    NSParameterAssert(item);
    
    item->_associatedBunch = self;
    [self.mItems addObject:item];
}

- (void)insertItem:(TBVListItem *)item atIndex:(NSInteger)index {
    NSParameterAssert(item);
    
    item->_associatedBunch = self;
    [self.mItems insertObject:item atIndex:index];
}
    
- (void)addItems:(NSArray<TBVListItem *> *)items {
    NSParameterAssert(items);
    
    for (TBVListItem *item in items) {
        [self addItem:item];
    }
}

- (void)removeItem:(TBVListItem *)item {
    NSParameterAssert(item);
    
    [self.mItems removeObject:item];
}

- (void)removeAllItems {
    [self.mItems removeAllObjects];
}

- (void)reloadAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    [self.collectionContext performBatchAnimated:animated updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
        [batchContext reloadSectionController:self];
    } completion:completion];
}

- (void)reloadAnimated:(BOOL)animated {
    [self reloadAnimated:animated completion:nil];
}

- (void)reload {
    [self reloadAnimated:NO];
}

#pragma mark - getter
- (NSArray *)items {
    return self.mItems;
}

- (NSInteger)index {
    return [self.associatedSection.itemBunches indexOfObject:self];
}
@end
