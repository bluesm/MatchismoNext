//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Paweł on 24/11/13.
//  Copyright (c) 2013 Twigit. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "TestClass.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UIButton *card;

@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardsButton;

@property (strong, nonatomic) Deck* deck;

@end

@implementation CardGameViewController

//static NSString * noCardMessage2 = @"No c"; fasdfasdf

- (CardMatchingGame *)game {
    if(!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:0 usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *) createDeck {
    return [[PlayingCardDeck alloc] init];
}
- (Deck *) deck {
    if(!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (IBAction)cardTouched:(UIButton *)sender {
    
    
    UIImage* cardImage = nil;
    NSString* cardTitle =  nil;
    if(sender.currentTitle.length == 0) {
        Card* rCard = [self.deck drawRandomCard];
        if(rCard) {
            cardImage = [UIImage imageNamed:@"CardFront"];
            cardTitle = rCard.contents;        }
    } else {
        cardImage = [UIImage imageNamed:@"CardBackLogo"];
        cardTitle = @"";
    }

    if(cardImage) {  // either one more "if" or two times "self.clickCount" ... There is no other option.
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:cardTitle forState:UIControlStateNormal];
    }
    
    NSLog(@"%d", [self.cardsButton count]);
    int l = [self.cardsButton count];
    for( int i = 0; i < l; i++) {
        [self.cardsButton[i] setTitle:[NSString stringWithFormat:@"%d", i]];
        NSLog(@"My i : %d", i);
        
        if(self.cardsButton[i] == nil) {
            NSLog(@"IS nil");
            
        } else {
            NSLog(@"Is not nil");
            NSString* s = @"my string";
            NSLog(s);
            [self.cardsButton[i] setTitle:s];
        }
    }
    
}


@end
