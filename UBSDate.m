//
//  UBSDate.m
//
//  Created by Kovács Kristóf on 28/04/2018.
//  Copyright © 2018 Kovács Kristóf. All rights reserved.
//

#import "UBSDate.h"
#include <sys/sysctl.h>

@interface UBSDate ()

@property (assign, nonatomic, readonly) NSTimeInterval uptime;

@end

@implementation UBSDate

NSTimeInterval referenceTimestampMinusUpTime;
NSTimeInterval appStartTimestamp;

#pragma mark - Public

+ (void)load {
    appStartTimestamp = self.uptime;
}

+ (void)setReferenceTimestamp:(NSTimeInterval)referenceTimestamp {
    referenceTimestampMinusUpTime = referenceTimestamp - self.uptime;
}

+ (NSDate *)unBiasedDate {
    return [NSDate dateWithTimeIntervalSince1970:self.unBiasedTimestamp];
}

+ (NSTimeInterval)unBiasedTimestamp {
    return referenceTimestampMinusUpTime + self.uptime;
}

+ (NSTimeInterval)timeSinceAppStart {
    return self.uptime - appStartTimestamp;
}

+ (NSTimeInterval)uptime {
    struct timeval boottime;
    int mib[2] = {CTL_KERN, KERN_BOOTTIME};
    size_t size = sizeof(boottime);
    time_t now;
    time_t uptime = -1;
    (void)time(&now);
    
    if (sysctl(mib, 2, &boottime, &size, NULL, 0) != -1 && boottime.tv_sec != 0) {
        uptime = now - boottime.tv_sec;
    }
    
    return (NSTimeInterval)uptime;
}

@end
