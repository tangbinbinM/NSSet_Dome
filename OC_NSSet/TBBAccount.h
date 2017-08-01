//
//  TBBAccount.h
//  OC_NSSet
//
//  Created by yg on 2017/8/1.
//  Copyright © 2017年 TBB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBBAccount : NSObject
@property (nonatomic, copy)NSString *id;
@property (nonatomic, copy)NSString *name;
@property (nonatomic)double balance;//余额
@property (nonatomic)double loan;//贷款
- (instancetype)initWithId:(NSString *)id andName:(NSString *)name;


@end
