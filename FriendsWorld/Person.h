//
//  Person.h
//  FriendsWorld
//
//  Created by Xander on 10/17/16.
//  Copyright © 2016 Xander. All rights reserved.
//
#import "LinkedList.h"
#ifndef Person_h
#define Person_h
@interface Person: NSObject{
    LinkedList *friendsList;
}
@property NSString *name;
-(void) addFriend:(Person *) person;
-(id) initWithName:(NSString *) name;
-(LinkedList *) getFriendsList;
-(Person *) getFriendAt:(int) index;
-(bool) isFriended:(Person *) p;
-(int) countFriends;
@end
#endif /* Person_h */
