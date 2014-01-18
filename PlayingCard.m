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
    
    //NSLog(@"This is nil ? : %@",[super contents]); // Where is ivar ? the ivar is here but it is overwritenn ASK ABOT
   
    return [rankStrings[self.rank] stringByAppendingString: self.suit];
}

- (void) setContents:(NSString *)contents {
    super.contents = @"ABC";
    
}
                                // Of NSNumber
+ (NSUInteger) countDublication: (NSArray *)dub {
    
    NSCountedSet *countedSet = [[NSCountedSet alloc] initWithArray:dub];
    
    return [PlayingCard countDublicationWithCountedSet:countedSet];
    
}

+ (NSUInteger) countDublicationWithCountedSet:(NSCountedSet *)countedSet {
    NSUInteger maxDublication    = 0;
    NSUInteger actualDublication = 0;
    
    for(id o in countedSet) {
        actualDublication = [countedSet countForObject:o];
        if(maxDublication < actualDublication) {
            maxDublication = actualDublication;
        }
    }
    return maxDublication;
}



- (int)match:(NSArray *)cardArr {
    int score = 0;
    NSUInteger cardsCount = [cardArr count];
    
    NSCountedSet *ranks = [[NSCountedSet alloc] initWithCapacity:cardsCount];
    NSCountedSet *suits = [[NSCountedSet alloc] initWithCapacity:cardsCount];
    
    for(PlayingCard *playingCard in cardArr) {
        [suits  addObject:playingCard.suit];
        [ranks addObject:[NSNumber numberWithUnsignedInteger:playingCard.rank]];
    }
    
    [suits addObject:self.suit];
    [ranks addObject:[NSNumber numberWithUnsignedInteger:self.rank]];
    
    
    NSUInteger rankSimilarity = [PlayingCard countDublicationWithCountedSet:ranks] - 1; //since match that is "1", is not a match.
    NSUInteger suitSimilarity = [PlayingCard countDublicationWithCountedSet:suits] - 1;
    
    score += rankSimilarity * 4;
    score += suitSimilarity;
                                // notice we substracted before
    if(rankSimilarity == 4  || rankSimilarity == cardsCount) {
        score += pow(rankSimilarity, rankSimilarity);
    }
    
    if(suitSimilarity == 12 || suitSimilarity == cardsCount) {
        score += pow(suitSimilarity, 2);
    }
    
    NSLog(@"I matched something in playing cards");
    return score;
}



+ (NSArray *)validSuits {
    return @[@"♥︎", @"♦︎", @"♣︎", @"♠︎"];
}

+ (NSArray *) rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
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
