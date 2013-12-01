#import "Card.h"


@interface Card()

@end

@implementation Card

// Auto GENERATED for me.
/*
 
// ----- contents property ------
@synthesize contents = _contents;
 
- (NSString *)contents {
    return _contents;
}

-(void)setContents:(NSString *)contents {
    _contents = contents;
}

// ----- contents property ------

// ----- choosen property ------
@synthesize choosen = _choosen;

-(BOOL)choosen {
    return _choosen;
}
-(void) setChoosen:(BOOL)choosen {
    _choosen = choosen;
}
// ----- choosen property ------
 

// ----- matched property ------
@synthesize matched = _matched;

-(BOOL)matched {
    return _matched;
}

-(void)setMatched:(BOOL)matched {
    _matched = matched;
}
// ----- matched property ------
 
*/


- (void)setSomething:(int)abc {
    NSLog(@"%d", abc);
}

- (int)returnSomething {
    return 2;
}

- (int)match:(NSArray *)cardArr {
    int score = 0;
    int k = self.returnSomething;
    NSLog(@"%d",k);
    
    for(Card *card in cardArr) {
        if([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
