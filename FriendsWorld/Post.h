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
-(id) initWithContent:(NSString *) content;
-(void) addComment:(Post *) comment;
-(Post*) getCommentAt:(int) index;
@end

#endif /* Post_h */
