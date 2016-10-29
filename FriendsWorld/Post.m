//
//  Post.m
//  FriendsWorld
//
//  Created by Xander on 10/27/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"
@implementation Post
-(id) initWithContent:(NSString *)content{
    self = [super init];
    if(self){
        self.content = content;
        self.timeStamp = [NSDate date];
        comments = [[LinkedList alloc] init];
        [comments setup];
    }
    return self;
}
-(void)addComment:(Post *)comment{
    [comments append:comment];
}
-(Post *) getCommentAt:(int) index{
    return [comments getDataAt:index];
}
@end
