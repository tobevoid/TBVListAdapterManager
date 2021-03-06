//
//  TBVListItemBunch.h
//  IGListKitExamples
//
//  Created by tripleCC on 2017/6/16.
//  Copyright © 2017年 Instagram. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TBVListSection;
@class TBVListItemBunch;
@class TBVListItem;

NS_SWIFT_NAME(ListItemBunchViewSource)
@protocol TBVListItemBunchViewSource <NSObject>
@required
- (NSArray <NSString *> *)supportedElementKindsForBunch:(TBVListItemBunch *)bunch;
- (__kindof UICollectionReusableView *)bunch:(TBVListItemBunch *)bunch viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index;
- (CGSize)bunch:(TBVListItemBunch *)bunch sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index;
@end

NS_SWIFT_NAME(ListItemBunch)
@interface TBVListItemBunch : IGListSectionController <IGListDiffable> {
    @package
    __weak TBVListSection *_associatedSection;
    __weak id <TBVListItemBunchViewSource> _bunchViewSource;
    __weak NSDictionary *_itemMapping;
}

@property (nullable, weak, nonatomic, readonly) TBVListSection *associatedSection;
@property (nullable, strong, nonatomic, readonly) NSArray <TBVListItem *> *items;
@property (nullable, weak, nonatomic, readonly) NSDictionary *itemMapping;
@property (assign, nonatomic, readonly) NSInteger index;
@property (nullable, copy, nonatomic) NSString *identifier;
- (instancetype)initWithItem:(nullable TBVListItem *)item topInset:(CGFloat)topInset;
- (instancetype)initWithItem:(nullable TBVListItem *)item;
- (instancetype)initWithTopInset:(CGFloat)topInset;

- (void)addItem:(nonnull TBVListItem *)item;
- (void)addItems:(nonnull NSArray <TBVListItem *> *)items;
- (void)insertItem:(nonnull TBVListItem *)item atIndex:(NSInteger)index;
- (void)removeItem:(nonnull TBVListItem *)item;
- (void)removeAllItems;

- (void)reload;
- (void)reloadAnimated:(BOOL)animated;
- (void)reloadAnimated:(BOOL)animated completion:(nullable void (^)(BOOL finished))completion;
@end
NS_ASSUME_NONNULL_END
