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

-(id) initWith:(id) data;
-(id) initWith:(id) data previous:(Node *) p;
-(id) initWith:(id) data next:(Node *) n;
-(id) initWith:(id) data previous:(Node *) p next:(Node *) n;

@end
#endif /* Node_h */
