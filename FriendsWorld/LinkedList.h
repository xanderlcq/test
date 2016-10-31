//
//  LinkedList.h
//  FriendsWorld
//
//  Created by Xander on 10/10/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#ifndef LinkedList_h
#define LinkedList_h
#import "Node.h"
@interface LinkedList : NSObject{
    int size;
    Node *head;
    Node *tail;
}

/**
 Initialize the Linked List
 */
-(void) setup;


/**
 Add a data at the end of the list

 @param data data to be appended
 */
-(void) append:(id) data;


/**
 Add a data at the begining of the list

 @param data data to be prepended
 */
-(void) prepend:(id) data;


/**
 Retrieve data at specific index

 @param index index

 @return the data at index
 */
-(id) getDataAt:(int) index;


/**
 Returns the length of the linked list

 @return length
 */
-(int) length;


/**
 Remove data at a specific index

 @param index index
 */
-(void) removeAt: (int) index;


/**
 Remove the last object of the linked list
 */
-(void) removeLast;


/**
 Clear the linked list
 */
-(void) clear;


/**
 Set data at specific index

 @param data  data
 @param index index
 */
-(void) setDataAt:(id) data at:(int) index;


/**
 Returns the index of first occurence of the data

 @param data data

 @return index of first occurence of the data
 */
-(int) indexOf:(id) data;


/**
 Check if the linked list contains this data or not

 @param data data

 @return return true if the linked list contains data, false otherwise
 */
-(bool) contains:(id) data;

/**
 Insert data at specific index
 
 @param data  the data to be inserted
 @param index index
 */
-(void) insert:(id) data at:(int) index;


/**
 Append a given linked list to this linked list

 @param list linked list to be appended
 */
-(void) appendList:(LinkedList *) list;


/**
 Returns the first node of the linked list

 @return First node of the linked list
 */
-(Node*) getHead;

/**
 Returns the last node of the linked list
 
 @return Last node of the linked list
 */
-(Node*) getTail;


/**
 Convert the linked list to a NSArray

 @return NSArray of this linked list
 */
-(NSArray *) toArray;
@end
#endif /* LinkedList_h */
