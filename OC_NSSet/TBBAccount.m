
//
//  TBBAccount.m
//  OC_NSSet
//
//  Created by yg on 2017/8/1.
//  Copyright © 2017年 TBB. All rights reserved.
//

#import "TBBAccount.h"

@implementation TBBAccount
- (instancetype)initWithId:(NSString *)id andName:(NSString *)name
{
    if (self = [super init]){
        _id = id;
        _name = name;
    }
    return self;
}

//重写父类中的isEqual:方法
- (BOOL)isEqual:(id)object
{
    NSLog(@"isEqual:");
    if (self == object) return YES;
    if (object == nil) return NO;
    if (![object isKindOfClass:[self class]]) return NO;
    TBBAccount *acc = object;
    return [self.id isEqualToString:acc.id] && [self.name isEqualToString:acc.name];
}

//重写父类的属性hash,只是为了提高检索效率
- (NSUInteger)hash
{
    NSLog(@"hash");
    return self.id.hash ^ self.name.hash;
}
@end
