//
//  TBVListCellProtocol.h
//  IGListKitExamples
//
//  Created by tripleCC on 2017/6/15.
//  Copyright © 2017年 Instagram. All rights reserved.
//

#ifndef TBVListCellProtocol_h
#define TBVListCellProtocol_h
#import <Foundation/Foundation.h>

@class TBVListItem;
NS_SWIFT_NAME(ListCellProtocol)
@protocol TBVListCellProtocol <NSObject>
@required

/**
 根据 item 设置 cell
 
 @param item 绑定的 item
 */
- (void)configureItem:(__kindof TBVListItem *)item;

@optional


/**
 返回 cell 的尺寸
 
 优先级比 item 的属性 cellSize 高
 
 @param item 绑定的 item
 @return 尺寸
 */
+ (CGSize)sizeForItem:(__kindof TBVListItem *)item;
@end

#endif /* TBVListCellProtocol_h */
