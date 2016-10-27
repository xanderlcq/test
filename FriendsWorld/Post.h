//
//  Post.h
//  FriendsWorld
//
//  Created by Xander on 10/27/16.
//  Copyright © 2016 Xander. All rights reserved.
//

#ifndef Post_h
#define Post_h
@interface Post: NSObject
@property NSString *content;
@property NSDate *timeStamp;
-(id) initWithContent:(NSString *) content;
@end

#endif /* Post_h */
