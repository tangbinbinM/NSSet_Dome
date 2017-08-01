//
//  main.m
//  OC_NSSet
//
//  Created by yg on 2017/8/1.
//  Copyright © 2017年 TBB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBBAccount.h"
void test1(){
    //集合无序，且元素不能重复，重复只算一个
    NSSet *set = [NSSet setWithObjects:@"aaa", @"bbb", @"ccc", @"aaa", nil];
    NSLog(@"set.count=%ld",set.count);
    for(NSString *str in set){
        NSLog(@"%@",str);
    }
    //增加元素，但依然是不可变模式
    NSSet *newSet = [set setByAddingObject:@"ddd"];
    NSLog(@"newSet.count=%ld",newSet.count);
    //NSSet转换为数组
    NSArray *objs = [set allObjects];
    for (NSString *str in objs) {
        NSLog(@"%@",str);
    }
    //从set中随便拿一个对象
    NSString *str = [set anyObject];
    NSLog(@"str:%@",str);
    [objs firstObject];//数组中的第一个元素
    [objs lastObject];//最后的一个元素
    //[set firstObject];//set中没有第一个这样的概念
    
    //判断set中有没有指定的对象
    if([set containsObject:@"ccc"]){
        NSLog(@"set中有ccc对象");
    }
}
//遍历
void test2()
{
    NSSet *set = [NSSet setWithArray:@[@"aaa", @"bbb", @"ccc", @"ddd", @"bbb"]];
    NSLog(@"set.count=%ld",set.count);
    //forin
    for (NSString *str in set) {
        NSLog(@"str:%@",str);
    }
    NSLog(@"-------------------");
    //枚举器（迭代器）
    NSEnumerator *enumerator = [set objectEnumerator];
    NSString *str = nil;
    while (str = [enumerator nextObject]) {//拿其中一个对象
        NSLog(@"%@",str);
    }
    NSLog(@"-------------------");
    [set enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *str = obj;
        NSLog(@"%@",str);
        if ([str isEqualToString:@"ddd"]) {
            *stop = YES;
        }
    }];
}
//排序
void test3(){
    NSSet *set = [NSSet setWithArray:@[@"aaa", @"bbb", @"ccc", @"ddd"]];
    //将set变成数组再进行排序
    NSArray *sortedArray = [[set allObjects]sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@",sortedArray);
}
//set间的计算
void test4(){
    NSSet *s1 = [NSSet setWithArray:@[@"A", @"B", @"C", @"D"]];
    NSSet *s2 = [NSSet setWithArray:@[@"A", @"C"]];
    if ([s2 isSubsetOfSet:s1]) {
        NSLog(@"s2是s1的子集");
    }
    NSSet *s3 = [NSSet setWithArray:@[@"A", @"C", @"E", @"F"]];
    if ([s1 intersectsSet:s3]) {
        NSLog(@"s1和s3相交");
    }
}
void test5(){
    NSMutableSet *mSet = [NSMutableSet new];
    [mSet addObject:@"aaa"];
    [mSet addObjectsFromArray:@[@"bbb", @"ccc", @"bbb"]];
    NSLog(@"mSet:%@", mSet);
    [mSet removeObject:@"ccc"];
    NSLog(@"mSet:%@", mSet);
    NSLog(@"-----------");
    //集合运算
    NSMutableSet *s1 = [NSMutableSet setWithObjects:@"A", @"B", @"C", nil];
    NSMutableSet *s2 = [NSMutableSet setWithObjects:@"C", @"D", nil];
    [s1 unionSet:s2];
    NSLog(@"%@", s1);
    [s1 minusSet:s2];
    NSLog(@"%@", s1);
    [s1 addObject:@"C"];
    [s1 addObject:@"E"];//A B C E
    [s1 intersectSet:s2];
    NSLog(@"%@", s1);
    [s1 setSet:s2];
    NSLog(@"%@", s1);
}
//测试Set的不可重复性
void test6()
{
    NSMutableSet *accounts = [NSMutableSet new];
    TBBAccount *acc1 = [[TBBAccount alloc]initWithId:@"100001" andName:@"Daniel"];
    NSLog(@"----------------");
    [accounts addObject:acc1];
    TBBAccount *acc2 = [[TBBAccount alloc]initWithId:@"100002" andName:@"Guodh"];
    NSLog(@"----------------");
    [accounts addObject:acc2];
    TBBAccount *acc3 = [[TBBAccount alloc]initWithId:@"100001" andName:@"Daniel"];
    NSLog(@"----------------");
    [accounts addObject:acc3];//???
    NSLog(@"accounts.count=%ld", accounts.count);
    TBBAccount *acc4 = acc1;
    NSLog(@"----------------");
    [accounts addObject:acc4];//???
    NSLog(@"accounts.count=%ld", accounts.count);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test6();
    }
    return 0;
}
