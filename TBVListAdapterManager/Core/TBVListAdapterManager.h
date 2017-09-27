//
//  TBVListAdapterManager.h
//  IGListKitExamples
//
//  Created by tripleCC on 2017/6/15.
//  Copyright © 2017年 Instagram. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import "TBVListSectionConfiguration.h"
#import "TBVListSection.h"
#import "TBVListItemBunch.h"
#import "TBVListItem.h"


#define TBVS(o) [o class] 
NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted))
NS_SWIFT_NAME(ListAdapterManager)
@interface TBVListAdapterManager : NSObject
@property (nullable, strong, nonatomic, readonly) NSArray <TBVListSection *> *sections;
@property (nullable, strong, nonatomic, readonly) IGListAdapter *adapter;
@property (nullable, strong, nonatomic, readonly) NSDictionary *itemMapping;

- (instancetype)initWithAdapter:(nonnull IGListAdapter *)adapter;
- (instancetype)initWithAdapter:(nonnull IGListAdapter *)adapter emptyView:(nullable UIView *)emptyView;

- (void)addSection:(nonnull TBVListSection *)section;
- (void)insertSection:(nonnull TBVListSection *)section atIndex:(NSUInteger)index;
- (void)insertSection:(nonnull TBVListSection *)section above:(nullable TBVListSection *)aboveSection;
- (void)removeSection:(nonnull TBVListSection *)section;
- (void)removeAllSections;
- (void)removeAll;

- (void)registerItem:(nonnull Class)item withCell:(nonnull Class)cell;
- (void)registerItems:(nonnull NSArray <Class> *)items;
- (void)registerAllItems;

- (void)reload;
- (void)reloadAnimated:(BOOL)animated;
- (void)reloadAnimated:(BOOL)animated completion:(nullable void (^)(BOOL finished))completion;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end
NS_ASSUME_NONNULL_END
