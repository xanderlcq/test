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

-(void) setup;
-(void) append:(id) data;
-(void) prepend:(id) data;
-(void) insertBefore:(id) data before:(int)index;
-(void) insertAfter:(id) data after:(int)index;
-(id) getDataAt:(int) index;
-(int) length;
-(void) removeAt: (int) index;
-(void) removeLast;
-(void) clear;
-(void) setDataAt:(id) data at:(int) index;
-(int) indexOf:(id) data;
-(bool) contains:(id) data;
-(void) insert:(id) data at:(int) index;
-(void) appendList:(LinkedList *) list;
-(Node*) getHead;
-(Node*) getTail;
@end
#endif /* LinkedList_h */
