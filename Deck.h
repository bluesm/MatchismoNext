//
//  Deck.h
//  Matchismo
//
//  Created by Paweł on 29/11/13.
//  Copyright (c) 2013 Twigit. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;


@end
