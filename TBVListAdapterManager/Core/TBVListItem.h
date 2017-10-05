//
//  TBVListItem.h
//  IGListKitExamples
//
//  Created by tripleCC on 2017/6/15.
//  Copyright © 2017年 Instagram. All rights reserved.
//

#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TBVListItemBunch;
@class TBVListItem;

NS_SWIFT_NAME(ListItemSelectBlock)
typedef void (^TBVListItemSelectBlock)(TBVListItem * _Nonnull item);

NS_SWIFT_NAME(ListItem)
@interface TBVListItem : NSObject {
    @package
    __weak TBVListItemBunch *_associatedBunch;
}

@property (nullable, weak, nonatomic, readonly) TBVListItemBunch *associatedBunch;
@property (assign, nonatomic) CGSize cellSize;
@property (assign, nonatomic, readonly) NSInteger index;
@property (nullable, copy, nonatomic) TBVListItemSelectBlock selectBlock;
@property (assign, nonatomic) BOOL enableSelection;

- (void)reload;
- (void)reloadAnimated:(BOOL)animated;
- (void)reloadAnimated:(BOOL)animated completion:(nullable void (^)(BOOL finished))completion;
@end
NS_ASSUME_NONNULL_END
