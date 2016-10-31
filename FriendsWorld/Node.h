//
//  Node.h
//  FriendsWorld
//
//  Created by Xander on 10/10/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#ifndef Node_h
#define Node_h
@interface Node: NSObject{
    
}
@property id data;
@property Node *prev;
@property Node *next;


/**
 Constructor

 @param data data in this node

 @return object
 */
-(id) initWith:(id) data;

/**
 Constructor

 @param data data in this node
 @param p    previous node of this node

 @return object
 */
-(id) initWith:(id) data previous:(Node *) p;


/**
 Constructor

 @param data data in this node
 @param n    next node of this node

 @return object
 */
-(id) initWith:(id) data next:(Node *) n;


/**
 Constructor

 @param data data in this node
 @param p    Previous node
 @param n    Next node

 @return object
 */
-(id) initWith:(id) data previous:(Node *) p next:(Node *) n;

@end
#endif /* Node_h */
