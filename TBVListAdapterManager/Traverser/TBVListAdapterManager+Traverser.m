//
//  TBVListAdapterManager+Traverser.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/29.
//  Copyright © 2017年 tripleCC. All rights reserved.
//
#import <objc/runtime.h>
#import "TBVListSection+Traverser.h"
#import "TBVListAdapterManager+Traverser.h"

@implementation TBVListAdapterManager (Traverser)
- (void)setTraversalBlock:(id  _Nonnull (^)(id _Nonnull, id _Nullable))traversalBlock {
    objc_setAssociatedObject(self, @selector(traversalBlock), traversalBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id  _Nonnull (^)(id _Nonnull, id _Nullable))traversalBlock {
    return objc_getAssociatedObject(self, _cmd);
}

- (id)excuteTraverse:(id)value {
    id preValue = value;
    for (TBVListSection *section in self.sections) {
        preValue = [section excuteTraverse:preValue];
    }
    
    if (self.traversalBlock) {
        return self.traversalBlock(self, preValue);
    }
    return preValue;
}
@end
