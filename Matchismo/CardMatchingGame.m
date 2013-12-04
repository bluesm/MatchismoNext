//
//  CardMatchingGame.m
//
//
//  Created by Paweł on 03/12/13.
//  Copyright (c) 2013 Twigit. All rights reserved.
//

#import "CardMatchingGame.h"
#import "Deck.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@end

@implementation CardMatchingGame


- (NSMutableArray *) cards {
    if(!_cards) {
        _cards =[[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    
    if(self) {
        for(int i = 0; i < count; i++) {
            Card * card = [deck drawRandomCard];
            if(card) {
                [self.cards addObject:card];
                self.cards[i] = card;
            }
        }
    }
    
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index {
    return ((index < [self.cards count]) ? self.cards[index] : nil);
}


//#define MISMATCH_PENALTY 2
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 2;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index {
    Card* card = [self cardAtIndex:index];
    
    if(!card.isMatched) {
        if (card.isChoosen) {
            card.choosen = NO;
        } else {
            for( Card *otherCard in self.cards) { // maybe better to just memorize this card ?
                if(otherCard.isChoosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.choosen = NO;
                    }
                    break;
                }
            }
            card.choosen = YES;
        }
    }
}
- (instancetype) init {
    return nil;
}

@end





























