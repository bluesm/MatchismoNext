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

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIButton *card;
@property (nonatomic) int clickCount;

@property (strong, nonatomic) Deck* deck;

@end

@implementation CardGameViewController

//static NSString * noCardMessage2 = @"No c";

- (Deck *) deck {
    if(!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (void) setClickCount:(int)clickCount {
    _clickCount = clickCount;
    NSLog(@"%d", self.clickCount);
    self.countLabel.text = [NSString stringWithFormat:@"%d", self.clickCount];
}

- (IBAction)cardTouched:(UIButton *)sender {
    
    if(sender.currentTitle.length != 0) {
        UIImage *cardImage = [UIImage imageNamed:@"CardBackLogo"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        UIImage *cardImage = [UIImage imageNamed:@"CardFront"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        Card* rCard = [self.deck drawRandomCard];
        NSString *cardString = nil;
        if(rCard) {
            cardString = rCard.contents;
        } else {
            [sender removeFromSuperview]; // removes the deck of card
        }
        
        [sender setTitle:cardString forState:UIControlStateNormal];
    }
    
    self.clickCount += 1;
    
}


@end
