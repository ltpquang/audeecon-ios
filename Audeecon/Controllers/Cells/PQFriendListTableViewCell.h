//
//  PQFriendListTableViewCell.h
//  Audeecon
//
//  Created by Le Thai Phuc Quang on 4/13/15.
//  Copyright (c) 2015 QuangLTP. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMPPUserCoreDataStorageObject;
@class PQOtherUser;

@interface PQFriendListTableViewCell : UITableViewCell
//- (void)configUsingUser:(XMPPUserCoreDataStorageObject *)user;
- (void)configUsingUser:(PQOtherUser *)user;
@end
