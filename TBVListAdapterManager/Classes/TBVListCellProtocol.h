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
- (void)configureItem:(TBVListItem *)item;
@end

#endif /* TBVListCellProtocol_h */
