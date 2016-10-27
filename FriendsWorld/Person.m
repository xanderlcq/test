//
//  Person.m
//  FriendsWorld
//
//  Created by Xander on 10/17/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
@implementation Person{
    
}
-(void) addFriend:(Person *) person{
    [friendsList append:person];
}
-(void) addFriendAt:(Person *) person at:(int) index{
    [friendsList insert:person at:index];
}

-(id) init{
    self = [super init];
    if(self){
        friendsList = [[LinkedList alloc] init];
        [friendsList setup];
        self.isDeleted = NO;
    }
    return self;
}
-(id) initWithName:( NSString*) name {
    self = [super init];
    if(self){
        self.name = name;
        friendsList = [[LinkedList alloc] init];
        [friendsList setup];
        self.isDeleted = NO;
    }
    return self;
}




-(LinkedList *) getFriendsList{
    return friendsList;
}
-(bool) isFriended:(Person *)p{
    return [friendsList contains:p];
}
-(Person *) getFriendAt:(int)index{
    int i = (int)index;
    return [friendsList getDataAt:i];
}
-(int) indexOf:(Person *) p{
    return [friendsList indexOf:p];
}
-(Person *) getFriendAtInt:(int)index{
    return [friendsList getDataAt:index];
}
-(int) countFriends{
    return [friendsList length];
}
-(void) cleanUpFriendList{
    int i = 0;
    while(i<[self countFriends]){
        if([self getFriendAtInt:i].isDeleted){
            [self removeFriendAt:i];
        }else{
            i++;
        }
    }
}
-(void) removeFriendAt:(int) index{
    [self.getFriendsList removeAt:index];
}
-(NSArray *) friendsToArray{
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    for(int i = 0;i<[self countFriends];i++){
        [mArray addObject:[self getFriendAt:i].name];
    }
    return mArray;
    
}
-(int) indexOfName:(NSString *) name{
    for(int i = 0; i <[self countFriends];i++){
        if([self getFriendAt:i].name == name){
            return i;
        }
    }
    return -1;
}
@end
