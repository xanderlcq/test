//
//  LinkedList.m
//  FriendsWorld
//
//  Created by Xander on 10/10/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"
@implementation LinkedList



-(void) setup{
    size = 0;
}
-(Node*) getHead{
    return head;
}
-(Node*) getTail{
    return tail;
}
-(void) append:(id) data{
    size++;
    if(head == nil){
        head = [[Node alloc] initWith:data];
        tail = head;
    }else{
        Node *temp = [[Node alloc] initWith:data previous:tail];
        tail.next = temp;
        tail = temp;
    }
}
-(void) appendList:(LinkedList *) list{
    if(!head){
        head = [list getHead];
        tail = [list getTail];
        size += [list length];
    }else{
        tail.next = [list getHead];
        tail = [list getTail];
        size += [list length];
    }
}
-(void) prepend:(id) data{
    size++;
    
    Node *temp = [[Node alloc] initWith:data next:head];
    head.prev = temp;
    head = temp;
    return;

}

//I need to get the terms straight....
-(void) insertBefore:(id) data before:(int)index{
    if(index == 0){
        [self prepend:data];
    }
    [self insert:data at:index];
}
-(void) insertAfter:(id) data after:(int)index{
    [self insert:data at:index+1];
    
}





-(id) getDataAt:(int) index{
    return [self getDataAtHelper:index node:head];
}



-(int) length{
    return size;
}

-(void) removeAt: (int) index{
    
    if(index < 0 || index >=size){
        return;
    }
    if(index == 0){
        head = head.next;
        head.prev = nil;
        size--;
        return;
    }
    if(index == size -1){
        [self removeLast];
        return;
    }
    [self removeHelper:index node:head];
    size--;
}
-(void) removeLast{
    size--;
    tail = tail.prev;
    tail.next = nil;
}

-(void) clear{
    size = 0;
    head = nil;
    tail = nil;
}


-(void) setDataAt:(id) data at:(int) index{
    [self removeAt:index];
    [self insert:data at:index];
}
-(int) indexOf:(id) data{
    if(head == nil)
        return -1;
    
    return [self indexOf:data node:head index:0];
}
-(bool) contains:(id) data{
    return [self containsHelper:data currentNode:head];
    
}

-(void) insert:(id) data at:(int) index{
    if(index < 0){
        return;
    }
    if(head == nil){//Empty list case
        [self prepend:data];
        return;
    }
    if(index == 0){//Special case: prepending
        [self prepend:data];
        return;
    }
    if(index == size){//Special case: appending
        [self append:data];
        return;
    }
    
    //Somewhere in the middle
    size++;
    [self insertHelper:data currentNode:head at:index];
}

-(int) indexOf:(id)data node:(Node *)n index:(int)count{
    if(n == nil)
        return -1;
    if(n.data == data)
        return count;
    return [self indexOf:data node:n.next index:count+1];
}


//Helper
-(id) getDataAtHelper:(int) index node:(Node *) n{
    if(n == nil)
        return nil;
    if(index == 0)
        return n.data;
    return [self getDataAtHelper:index - 1 node:n.next];
}

-(void) removeHelper:(int) index node:(Node *) n{
    if(n == nil){
        return;
    }
    if(index == 0){
        n.prev.next = n.next;
        n.next.prev = n.prev;
        return;
    }
    [self removeHelper:index-1 node:n.next];
}
-(bool) containsHelper:(id) data currentNode:(Node *) n{
    if(n == nil){ //At the end
        return NO;
    }
    if(n.data == data){//Find the match
        return YES;
    }else{
        return NO || [self containsHelper:data currentNode:n.next];
    }
}

//Insert before currect node at index
-(void) insertHelper:(id) data currentNode:(Node *) n at:(int)index{
    if(index < 0)
        return;
    if(index == 0){ //At the correct position.
        Node *temp = [[Node alloc] initWith:data previous:n.prev next:n];
        n.prev.next = temp;
        n.prev = temp;
        return;
    }
    if(n.next == nil){ //If the destination index is out of rage, append the data at the end.
        n.next = [[Node alloc] initWith:data];
        n.next.prev = n;
        return;
    }
    else{ // Keep going
        [self insertHelper:data currentNode:n.next at:index-1];
    }
}
@end
