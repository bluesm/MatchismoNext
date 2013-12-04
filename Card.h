@import Foundation;

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isMatched) BOOL matched;
@property (nonatomic, getter = isChoosen) BOOL choosen;

- (int)match:(NSArray *)card; // prototype of this is the match:card
@end