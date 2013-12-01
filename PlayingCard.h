//
//  PlayingCard.h
//  Matchismo
//
//  Created by Paweł on 01/12/13.
//  Copyright (c) 2013 Twigit. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;

+ (NSUInteger)maxRank;
@end
