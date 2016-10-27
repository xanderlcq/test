//
//  Node.m
//  FriendsWorld
//
//  Created by Xander on 10/10/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
@implementation Node
-(id) initWith:(id)data{
    self = [super init];
    if(self){
        self.data = data;
    }
    return self;
}
-(id) initWith:(id) data previous:(Node *) p{
    self = [super init];
    if(self){
        self.data = data;
        self.prev = p;
    }
    return self;
}
-(id) initWith:(id) data next:(Node *) n{
    self = [super init];
    if(self){
        self.data = data;
        self.next = n;
    }
    return self;
}
-(id) initWith:(id) data previous:(Node *) p next:(Node *) n{
    self = [super init];
    if(self){
        self.data = data;
        self.prev = p;
        self.next = n;
    }
    return self;
}


@end
