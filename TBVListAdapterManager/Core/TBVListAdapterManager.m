//
//  TBVListAdapterManager.m
//  IGListKitExamples
//
//  Created by tripleCC on 2017/6/15.
//  Copyright © 2017年 Instagram. All rights reserved.
//

#import "TBVListAdapterManager.h"

@interface TBVListAdapterManager() <IGListAdapterDataSource, UICollectionViewDelegate>
@property (strong, nonatomic, readonly) NSMutableArray <TBVListSection *> *mSections;
@property (strong, nonatomic) NSMutableDictionary <NSString *, NSString *> *mItemMapping;
@property (strong, nonatomic) NSArray <TBVListItemBunch *> *itemBunches;
@end

@implementation TBVListAdapterManager
#pragma mark - init
- (instancetype)initWithAdapter:(IGListAdapter *)adapter {
    return [self initWithAdapter:adapter emptyView:nil];
}

- (instancetype)initWithAdapter:(IGListAdapter *)adapter emptyView:(UIView *)emptyView {
    if (self = [super init]) {
        _adapter = adapter;
        _adapter.dataSource = self;
        _adapter.collectionViewDelegate = self;
        _mSections = [NSMutableArray array];
        _mItemMapping = [NSMutableDictionary dictionary];
    }
    
    return self;
}

#pragma mark - public
- (void)reloadAnimated:(BOOL)animated completion:(void (^)(BOOL))completion {
    [self prepareForReloading];
    [self.adapter performUpdatesAnimated:animated completion:completion];
}

- (void)reloadAnimated:(BOOL)animated {
    [self reloadAnimated:animated completion:nil];
}

- (void)reload {
    [self reloadAnimated:YES];
}

- (void)insertSection:(TBVListSection *)section above:(TBVListSection *)aboveSection {
    NSParameterAssert(section);
    
    section->_associatedManager = self;
    section->_itemMapping = self.itemMapping;
    NSInteger index = [self.mSections indexOfObject:aboveSection];
    if (index == NSNotFound) {
        [self.mSections addObject:section];
    } else {
        [self.mSections insertObject:section atIndex:index];
    }
}

- (void)insertSection:(TBVListSection *)section atIndex:(NSUInteger)index {
    NSParameterAssert(section);
    
    section->_associatedManager = self;
    section->_itemMapping = self.itemMapping;
    [self.mSections insertObject:section atIndex:index];
}

- (void)addSection:(TBVListSection *)section {
    NSParameterAssert(section);

    section->_associatedManager = self;
    section->_itemMapping = self.itemMapping;
    [self.mSections addObject:section];
}

- (void)removeSection:(TBVListSection *)section {
    NSParameterAssert(section);
    
    [self.mSections removeObject:section];
}

- (void)removeAllSections {
    [self.mSections removeAllObjects];
}

- (void)removeAll {
    for (TBVListSection *section in self.mSections) {
        [section removeAll];
    }
    [self.mSections removeAllObjects];
}

- (void)registerItem:(Class)item withCell:(Class)cell {
    NSParameterAssert(item);
    NSParameterAssert(cell);
    
    self.mItemMapping[NSStringFromClass(item)] = NSStringFromClass(cell);
}

- (void)registerItems:(NSArray<Class> *)items {
    NSParameterAssert(items);
    
    for (Class itemCls in items) {
        NSString *item = NSStringFromClass(itemCls);
        
        NSString *realItem = item;
        if ([realItem hasSuffix:@"Item"]) {
            realItem = [realItem stringByReplacingOccurrencesOfString:@"Item" withString:@""];
        }
        
        Class cellCls = NSClassFromString([realItem stringByAppendingString:@"Cell"]);
        itemCls = NSClassFromString([realItem stringByAppendingString:@"Item"]);
        
        NSAssert(cellCls && itemCls, @"can't find cell %@ or item %@", cellCls, itemCls);
        
        [self registerItem:itemCls withCell:cellCls];
    }
}

- (void)registerAllItems {
    NSParameterAssert(self.sections.count > 0);
    
    NSMutableArray *items = [NSMutableArray array];
    for (TBVListSection *section in self.sections) {
        for (TBVListItemBunch *bunch in section.itemBunches) {
            for (TBVListItem *item in bunch.items) {
                [items addObject:[item class]];
            }
        }
    }
    [self registerItems:items];
}

#pragma mark - private
- (void)prepareForReloading {
    NSMutableArray *itemBunches = [NSMutableArray array];
    for (TBVListSection *section in self.sections) {
        [itemBunches addObjectsFromArray:section.itemBunches];
    }
    self.itemBunches = itemBunches;
}

#pragma mark - IGListAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.itemBunches;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(TBVListItemBunch *)object {
    return object;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return self.emptyView;
}

#pragma mark - UICollectionViewDelegate
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark - getter
- (NSArray *)sections {
    return self.mSections;
}

- (NSDictionary *)itemMapping {
    return self.mItemMapping;
}
@end
