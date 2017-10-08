

#import <Foundation/Foundation.h>

@interface NSString (moreMeth)

-(NSString *)stringByPigLatinization;

@end

@implementation NSString (moreMeth)

-(NSString *)stringByPigLatinization {
    
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString: @"aeiuoAEIOU"];
    NSCharacterSet *uppercase = [NSCharacterSet uppercaseLetterCharacterSet];
    NSArray *stringToArray = [self componentsSeparatedByString:@" "];
    NSMutableArray *latinizedArr = [NSMutableArray new];
    
    for (NSString *b in stringToArray){
        if (b.length > 1) {
            //        set range to length of input string
            NSRange searchRange = NSMakeRange(0, [b length]);
            //        using vowelSet, iterate through input string to find first instance of character match. return range information (aka location of matching character in input string
            NSRange foundRange = [b rangeOfCharacterFromSet:vowelSet options:0 range:searchRange];
            NSRange capital = [b rangeOfCharacterFromSet:uppercase];
            
            NSString *consonant = [b substringToIndex:foundRange.location];
            BOOL track = NO;
            if (capital.location == 0) {
                track = YES;
            }
            
            consonant = [consonant lowercaseString];
            consonant = [consonant stringByAppendingString:@"ay"];
            NSString *bSliced = [b substringFromIndex:foundRange.location];
            bSliced = [bSliced lowercaseString];
            NSString *latinizedStr = [bSliced stringByAppendingString:consonant];
            
            if (track == YES) {
                latinizedStr = [latinizedStr capitalizedStringWithLocale:nil];
            }
            [latinizedArr addObject:latinizedStr];
        }
        
        else {
            [latinizedArr addObject:b];
            continue;
        }
    }
    
    
             NSString *pigLatin = [latinizedArr componentsJoinedByString:@" "];
    return pigLatin;
}


@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
        BOOL programRun = YES;
        
        while (programRun == YES) {
            
            NSLog(@"Input a sentence");
            
            char str[100];
            fgets (str, 100, stdin);
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            inputString = [inputString stringByPigLatinization];
            
            NSLog(@"%@", inputString);
        }
        
    }
    return 0;
}
