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
    }
    return self;
}
@end
