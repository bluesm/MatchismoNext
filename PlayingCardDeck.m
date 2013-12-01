//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Paweł on 01/12/13.
//  Copyright (c) 2013 Twigit. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck
- (instancetype) init {
    self = [super init];
    
    if (self) {
        for(NSString *suit in [PlayingCard validSuits]) {
            for(NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;  // rank is unsigned int (NSUInteger
                card.suit = suit;  // suit is strng iwth once char
                [self addCard:card];
            }
        }
        
    }
    
    return self;
}
@end
