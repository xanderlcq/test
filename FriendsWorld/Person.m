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
-(id) initWithName:( NSString*) name {
    self = [super init];
    if(self){
        self.name = name;
        [friendsList setup];
    }
    return self;
}
-(LinkedList *) getFriendsList{
    return friendsList;
}
@end
