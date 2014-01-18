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

@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardsButtons;


@property (strong, nonatomic) Deck* deck;

@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *twoOrTreeMatchSwichSegmentControl;
@property (strong, nonatomic) CardMatchingGame* a;


@end

@implementation CardGameViewController

//static NSString * noCardMessage2 = @"No c"; fasdfasdf
- (IBAction)dialAgain:(id)sender {
    //[_game release];
    [self.game redialWithDeck:[self createDeck]];
   
    self.twoOrTreeMatchSwichSegmentControl.enabled = YES;
    //_game = [[CardMatchingGame alloc] initWithCardCount:[self.cardsButtons count] usingDeck:[self createDeck]];
    [self updateUI];
}
- (IBAction)modeOfGameChanged:(UISegmentedControl *)sender {
    
                    
    [self.game setMode:(sender.selectedSegmentIndex + 1)]; // Why sender.selectedSegmentIndex is not NSUInteger ?
    //NSLog(@"%d", sender.selectedSegmentIndex);
}

static NSUInteger initialMode = 1;


//NSArray*  const abc = @[@"FirstConstant",@"abc"];
- (CardMatchingGame *)game {
    if(!_game) {
        //_game = [CardMatchingGame alloc] init
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardsButtons count] mode:initialMode usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *) createDeck {
    return [[PlayingCardDeck alloc] init];
}


- (IBAction)cardTouched:(UIButton *)sender {
    self.twoOrTreeMatchSwichSegmentControl.enabled = NO; // how can I execute it just once ?... Overkill ?
    int cardIndex = [self.cardsButtons indexOfObject:sender];//where this sending button is in array
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    
    
}

- (void) updateUI {
    self.actionLabel.text = self.game.lastActionDescription;
    for(UIButton *cardButton in self.cardsButtons) { // change it to for loop
        int index = [self.cardsButtons indexOfObject:cardButton];
        
        Card* card = [self.game cardAtIndex:index]; 
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched; // if is matched then => we should disable it.

    }
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score : %d",self.game.score]];
}

- (NSString *) titleForCard: (Card *)card {
    return card.isChoosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    //NSLog(card ? @"not nil" : @"nil");
    return [UIImage imageNamed: card.isChoosen ? @"CardFront" : @"CardBackLogo"];
}

@end
