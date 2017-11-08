//
//  TBVListFigureValidator.m
//  TBVListAdapterManager
//
//  Created by tripleCC on 2017/11/4.
//
#import "NSError+Validator.h"
#import "TBVListFigureValidator.h"

@implementation TBVListFigureValidator
- (NSError *)validateValue:(id)value name:(NSString *)name {
    if ([value isKindOfClass:[NSString class]] && [value length] > 0 && ![[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[0-9]*(\\.[0-9]*)?$"] evaluateWithObject:[value stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet]]) {
        return [NSError tbv_errorWithMessage:[NSString stringWithFormat:@"%@格式不正确!", name] validator:self];
    }
    return nil;
}
@end
