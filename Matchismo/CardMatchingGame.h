//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Paweł on 03/12/13.
//  Copyright (c) 2013 Twigit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
@interface CardMatchingGame : NSObject
// designed initializer
- (instancetype) initWithCardCount:(NSUInteger)count mode:(NSUInteger)mode
                         usingDeck:(Deck *)deck;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, strong, readonly) NSString* lastActionDescription;

- (void) chooseCardAtIndex:(NSUInteger) index;

- (Card *) cardAtIndex: (NSUInteger) index;

- (void) redialWithDeck: (Deck *)deck;

- (void) setMode:(NSInteger)mode;
@end
