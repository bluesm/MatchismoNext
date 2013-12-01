@import Foundation;

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic) BOOL matched;
@property (nonatomic) BOOL choosen;

- (int)match:(NSArray *)card; // prototype of this is the match:card
@end