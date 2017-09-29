//
//  TBVListItem+Assembler.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/9/29.
//  Copyright © 2017年 tripleCC. All rights reserved.
//
#import <objc/runtime.h>
#import "TBVListItem+Traverser.h"

@implementation TBVListItem (Traverser)
- (void)setTraversalBlock:(id  _Nonnull (^)(id _Nonnull, id _Nullable))traversalBlock {
    objc_setAssociatedObject(self, @selector(traversalBlock), traversalBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id  _Nonnull (^)(id _Nonnull, id _Nullable))traversalBlock {
    return objc_getAssociatedObject(self, _cmd);
}

- (id)excuteTraverse:(id)value {
    if (self.traversalBlock) {
        return self.traversalBlock(self, value);
    }
    return value;
}
@end
