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
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
        self.selectedBackgroundView = selectedBackgroundView;
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        self.backgroundView = backgroundView;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.selectedBackgroundView.frame = self.bounds;
    self.backgroundView.frame = self.bounds;
    
    switch (self.listItem.selectionStyle) {
        case TBVListCellSelectionStyleGray: {
            self.selectedBackgroundView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
            self.backgroundView.backgroundColor = [UIColor whiteColor];
        } break;
            
        default:
            self.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
            self.backgroundView.backgroundColor = [UIColor whiteColor];
            break;
    }
}

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
