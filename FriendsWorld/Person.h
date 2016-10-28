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
#import "Post.h"
@interface Person: NSObject{
    LinkedList *friendsList;
    LinkedList *postsList;
    LinkedList *friendsPosts;
    
}
@property bool isDeleted;
@property NSString *name;
-(void) addFriend:(Person *) person;
-(void) addFriendAt:(Person *) person at:(int) index;
-(id) initWithName:(NSString *) name;

-(LinkedList *) getFriendsList;
-(Person *) getFriendAt:(int) index;
-(bool) isFriended:(Person *) p;
-(int) countFriends;
-(void) cleanUpFriendList;
-(void) removeFriendAt:(int) index;
-(NSArray *) friendsToArray;
-(int) indexOf:(Person *) p;
-(int) indexOfName:(NSString *) name;
-(LinkedList*) getPostsList;
-(NSString *) getPostAt:(int) index;
-(int)countPosts;
-(void) addPost:(NSString *) post;
-(void) removePostAt:(int) index;
-(int) countFriendPosts;
-(Post *) getFriendPostAt:(int) index;
-(void) updateFriendPosts;

@end
#endif /* Person_h */
