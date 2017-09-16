//
//  TBVListSection.h
//  IGListKitExamples
//
//  Created by tripleCC on 2017/6/15.
//  Copyright © 2017年 Instagram. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListKit.h>
#import "TBVListSectionConfiguration.h"

NS_ASSUME_NONNULL_BEGIN
@class TBVListAdapterManager;
@class TBVListItemBunch;
@class TBVListSection;

NS_SWIFT_NAME(ListSection)
@interface TBVListSection : NSObject {
    @package
    __weak TBVListAdapterManager *_associatedManager;
}

@property (nullable, weak, nonatomic, readonly) TBVListAdapterManager *associatedManager;
@property (nullable, strong, nonatomic, readonly) NSArray <TBVListItemBunch *> *itemBunches;
@property (assign, nonatomic, readonly) NSInteger index;

@property (nullable, strong, nonatomic) TBVListSectionConfiguration *headerConfiguration;
@property (nullable, strong, nonatomic) TBVListSectionConfiguration *footerConfiguration;

- (void)addItemBunch:(nonnull TBVListItemBunch *)bunch;
- (void)addItemBunches:(nonnull NSArray <TBVListItemBunch *> *)objects;
- (void)insertItemBunch:(nonnull TBVListItemBunch *)bunch atIndex:(NSInteger)index;
- (void)removeItemBunch:(nonnull TBVListItemBunch *)bunch;
- (void)removeAllItemBunches;
- (void)removeAll;

- (void)reload;
@end
NS_ASSUME_NONNULL_END
