//
//  TBVListSectionConfiguration.h
//  IGListKitExamples
//
//  Created by tripleCC on 2017/6/19.
//  Copyright © 2017年 Instagram. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class TBVListSection;

NS_SWIFT_NAME(ListSectionConfigureBlock)
typedef void(^TBVListSectionConfigureBlock)(TBVListSection * _Nonnull section, __kindof UICollectionReusableView * _Nonnull reusableView);

NS_SWIFT_NAME(ListSectionConfiguration)
@interface TBVListSectionConfiguration : NSObject
@property (assign, nonatomic) CGSize supplementarySize;
@property (nullable, strong, nonatomic) Class reusableClass;
@property (nullable, copy, nonatomic) TBVListSectionConfigureBlock configureBlock;

- (instancetype)initWithSupplementarySize:(CGSize)supplementarySize
                            reusableClass:(nonnull Class)reusableClass
                           configureBlock:(nonnull TBVListSectionConfigureBlock)configureBlock;
@end
NS_ASSUME_NONNULL_END
