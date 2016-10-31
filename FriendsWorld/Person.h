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
    NSArray *friendsPostsArray;
    
}
@property bool isDeleted;
@property NSString *name;


/**
 Add a friend (Person*) to this person

 @param person Person to be added as friend
 */
-(void) addFriend:(Person *) person;


/**
 Add a friend (Person*) to this person at specific index on this person's friends list

 @param person Person to be added as friend
 @param index  index
 */
-(void) addFriendAt:(Person *) person at:(int) index;


/**
 Constructor

 @param name Person's name

 @return Constructed object
 */
-(id) initWithName:(NSString *) name;


/**
 Return the LinkedList of friends

 @return LinkedList of friends
 */
-(LinkedList *) getFriendsList;


/**
 Get the friend at a given index

 @param index index

 @return the friend at index (Person*)
 */
-(Person *) getFriendAt:(int) index;


/**
 Check is this person is friended with P

 @param p Person to check

 @return Return YES is p is friended with this person
 */
-(bool) isFriended:(Person *) p;


/**
 Count the number of friends

 @return Returns the number of friends
 */
-(int) countFriends;


/**
 Remove friends that are marked isDeleted from the list
 */
-(void) cleanUpFriendList;


/**
 Remove friend at a specific index

 @param index Index of the friend to be removed
 */
-(void) removeFriendAt:(int) index;


/**
 Returns a array of friends

 @return NSArray of friends list
 */
-(NSArray *) friendsToArray;
-(int) indexOf:(Person *) p;


/**
 Return the index of a given name. -1 if the name doesn't exist

 @param name NSString of the name

 @return index of the name, -1 if it doesn't exist
 */
-(int) indexOfName:(NSString *) name;


/**
 Returns the LinkedList of all posts by this person

 @return LinkedList of all posts by this person
 */
-(LinkedList*) getPostsList;


/**
 Return the post at a specific index

 @param index int index

 @return the post at a specific index
 */
-(Post *) getPostAt:(int) index;


/**
 Count number of posts by this person

 @return int, number of posts
 */
-(int)countPosts;


/**
 Add a post

 @param post Post to be added
 */
-(void) addPost:(NSString *) post;


/**
 Remove a post at a specific index

 @param index index
 */
-(void) removePostAt:(int) index;


/**
 Count the number of posts by this person's friends

 @return the number of posts by this person's friends
 */
-(int) countFriendPosts;


/**
 Return this person's friend's post at a specific index

 @param index Index

 @return this person's friend's post at a specific index
 */
-(Post *) getFriendPostAt:(int) index;


/**
 Retrieve posts by this person's friends
 */
-(void) updateFriendPosts;

@end
#endif /* Person_h */
