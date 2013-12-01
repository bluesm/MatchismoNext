//
//  PlayingCard.m
//  Matchismo
//
//  Created by Paweł on 01/12/13.
//  Copyright (c) 2013 Twigit. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    
    NSLog(@"%@",[super contents]); // Where is ivar ?
   
    return [rankStrings[self.rank] stringByAppendingString: self.suit];
}

- (void) setContents:(NSString *)contents {
    super.contents = @"ABC";
    
}



+ (NSArray *)validSuits {
    return @[@"♥︎", @"♦︎", @"♣︎", @"♠︎"];
}

+ (NSArray *) rankStrings {
    return @[@"?", @"A", @"2", @"3", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank {
    return [[self rankStrings] count] - 1; 
}

- (void) setRank:(NSUInteger)rank {
    if(rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@synthesize suit = _suit; // Because we override both getter and setter

- (void) setSuit:(NSString *)suit {
    if([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *) suit {
    return _suit ? _suit : @"?";
}


@end
