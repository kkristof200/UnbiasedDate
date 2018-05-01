//
//  UBSDate.h
//
//  Created by Kovács Kristóf on 28/04/2018.
//  Copyright © 2018 Kovács Kristóf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UBSDate : NSDate

@property (nonnull, strong, nonatomic, readonly, class) NSDate *unBiasedDate;
@property (assign, nonatomic, readonly, class) NSTimeInterval unBiasedTimestamp;
@property (assign, nonatomic, readonly, class) NSTimeInterval timeSinceAppStart;

+ (void)setReferenceTimestamp:(NSTimeInterval)referenceTimestamp;

@end
