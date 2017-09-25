//
//  TBVListCell.m
//  Pods
//
//  Created by tripleCC on 2017/9/25.
//

#import "TBVListCell.h"
#import "TBVListItem.h"
#import "TBVListItemBunch.h"

@implementation TBVListCell
- (TBVListCellType)cellType {
    NSInteger itemsCount = self.listItem.associatedBunch.items.count;
    NSInteger itemIndex = self.listItem.index;
    
    if (itemIndex && itemsCount > 1) {
        return TBVListCellTypeFirst;
    }
    
    if (itemIndex > 0 && itemIndex < itemsCount - 1 && itemsCount > 2) {
        return TBVListCellTypeMiddle;
    }
    
    if (itemIndex == itemsCount - 1 && itemsCount > 1) {
        return TBVListCellTypeLast;
    }
    
    return TBVListCellTypeAny;
}

- (void)actionBeforeConfigured {}
- (void)actionAfterConfigured {}
@end
