//
//  TBVListCell.h
//  Pods
//
//  Created by tripleCC on 2017/9/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TBVListItem;

NS_SWIFT_NAME(ListCellType)
typedef NS_ENUM(NSInteger, TBVListCellType) {
    TBVListCellTypeSingle,
    TBVListCellTypeFirst,
    TBVListCellTypeMiddle,
    TBVListCellTypeLast,
    TBVListCellTypeAny,
};

NS_SWIFT_NAME(ListCell)
@interface TBVListCell : UICollectionViewCell {
    @package
    __weak UICollectionView *_collectionView;
    TBVListItem *_listItem;
}

@property (weak, nonatomic, readonly) UICollectionView *collectionView;
@property (strong, nonatomic, readonly) TBVListItem *listItem;
@property (assign, nonatomic, readonly) TBVListCellType cellType;

- (void)actionBeforeConfigured;
- (void)actionAfterConfigured;
@end
NS_ASSUME_NONNULL_END
