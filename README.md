# UnbiasedDate
NSDate uneffected by date changes in setting

#public properties

Time passed since app start (not affected by time changes by user)
**@property (assign, nonatomic, readonly, class) NSTimeInterval timeSinceAppStart;**

The followings will need the "setReferenceTimestamp" method to be called first (I've used firebase to get the current time, but it's only needed to be set once)

Current date (NSDate.date, which is not affected by time changes by user)
**@property (nonnull, strong, nonatomic, readonly, class) NSDate \*unBiasedDate;**
Time passed since 1/1/1970 (not affected by time changes by user)
**@property (assign, nonatomic, readonly, class) NSTimeInterval unBiasedTimestamp;**
