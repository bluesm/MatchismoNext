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
@property (nonatomic) NSInteger mode;
@property (nonatomic, strong, readwrite) NSString* lastActionDescription;
@end

@implementation CardMatchingGame

- (void) redialWithDeck:(Deck*)deck {
    for(int i = 0; i < [self.cards count]; i++) {
        self.cards[i] = [deck drawRandomCard];
    }
    self.score = 0;
}

static const int modesArray[2] = {2,3};


- (NSMutableArray *) cards {
    if(!_cards) {
        _cards =[[NSMutableArray alloc] init];
    }
    return _cards;
}


- (instancetype) initWithCardCount:(NSUInteger)count mode:(NSUInteger)mode usingDeck:(Deck *)deck {
    self = [super init];
    self.mode = mode;
    
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
#define ABC kkk
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

NSString* const YOU_SELECTED   = @"You selected: ";
NSString* const YOU_UNSELECTED = @"You unselected: ";
NSString* const MATCHED        = @"Matched : ";
NSString* const FOR            = @"for";
NSString* const POINTS         = @"points";
NSString* const DONT           = @"don't";
NSString* const MATCH          = @"match";
NSString* const PENALTY          = @"penalty";

- (void) chooseCardAtIndex:(NSUInteger)index {
    Card* card = [self cardAtIndex:index];
    if(card == nil) {
        NSLog(@"card is nil");
    }
    NSMutableArray *cardsToMatch = [[NSMutableArray alloc] init];
    
    
    if(!card.isMatched) {
        if (card.isChoosen) {
            card.choosen = NO;
            self.lastActionDescription = [YOU_UNSELECTED stringByAppendingString:card.contents];
        } else {
            
            
            
            for( Card *otherCard in self.cards) { // maybe better to just memorize this card ?
                self.lastActionDescription = [YOU_SELECTED stringByAppendingString:card.contents];
                if(otherCard.isChoosen && !otherCard.isMatched) {
                    
                    [cardsToMatch addObject:otherCard];
                    NSLog(@"%d", self.mode);
                                                // -1 because of actual  card
                    if([cardsToMatch count] == (self.mode)) {
                        
                        int matchScore = [card match:cardsToMatch];
                        
                        NSLog(@"I done matching! %d ", matchScore);
                        
                        NSString* allSelectedCardsContents = @"";
                        [cardsToMatch addObject:card]; // just to make enumeration nicer.
                        
                        for(Card *pc in cardsToMatch) {
                            allSelectedCardsContents = [NSString stringWithFormat:@"%@ %@ ", allSelectedCardsContents, pc.contents];
                        }
                        
                        if(matchScore) {
                            NSUInteger actualMatchScore = matchScore * MATCH_BONUS;
                            self.score += actualMatchScore;
                            
                            
                            for(Card *pc in cardsToMatch){
                                pc.matched = YES;
                            }
                            
                            self.lastActionDescription = [NSString stringWithFormat:@"%@. %@ %@ %@ %d %@", self.lastActionDescription, MATCHED,allSelectedCardsContents,FOR,actualMatchScore, POINTS];
                            
                        } else {
                            self.score -= MISMATCH_PENALTY;
                            
                            
                            
                            self.lastActionDescription = [NSString stringWithFormat:@"%@. %@ %@ %@ %d %@ %@!", self.lastActionDescription, allSelectedCardsContents, DONT, MATCH , MISMATCH_PENALTY, POINTS, PENALTY];
                            otherCard.choosen = NO;
                            
                            
                        }
                        break;
                    }
                    
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.choosen = YES;
        }
    }
}
- (instancetype) init {
    return nil;
}

@end





























