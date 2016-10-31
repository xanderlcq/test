//
//  Post.h
//  FriendsWorld
//
//  Created by Xander on 10/27/16.
//  Copyright © 2016 Xander. All rights reserved.
//
#import "LinkedList.h"
#ifndef Post_h
#define Post_h
@interface Post: NSObject{
    LinkedList *comments;
    
}
@property NSString *content;
@property NSDate *timeStamp;
@property NSString *poster;


/**
 Custom init

 @param content NSString of content of the post

 @return Inited object
 */
-(id) initWithContent:(NSString *) content;


/**
 Add comment

 @param comment (Post*) comment
 */
-(void) addComment:(Post *) comment;


/**
 Get the comment at a specific index

 @param index index

 @return the comment at a specific index
 */
-(Post*) getCommentAt:(int) index;


/**
 Count the number of comments

 @return Number of comments'
 */
-(int) countComments;
@end

#endif /* Post_h */
