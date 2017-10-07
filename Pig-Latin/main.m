

#import <Foundation/Foundation.h>

@interface NSString (moreMeth)

-(NSString *)stringByPigLatinization;

@end

@implementation NSString (moreMeth)

-(NSString *)stringByPigLatinization {
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiuoy"];
    NSCharacterSet *consonantSet = [NSCharacterSet characterSetWithCharactersInString: @"bcdfghjklmnpqrstvwxz"];
    NSArray *stringToArray = [self componentsSeparatedByString:@" "];
    NSMutableArray *latinizedArr = [NSMutableArray new];
    
    for (NSString *b in stringToArray){
//        set range to length of input string
        NSRange searchRange = NSMakeRange(0, [b length]-1);
//        using vowelSet, iterate through input string to find first instance of character match. return range information (aka location of matching character in input string
        NSRange foundRange = [b rangeOfCharacterFromSet:vowelSet options:0 range:searchRange];
        
        NSString *consonant = [b substringToIndex:foundRange.location];
        consonant = [consonant stringByAppendingString:@"ay"];
        NSString *bSliced = [b substringFromIndex:foundRange.location];
        NSString *latinizedStr = [bSliced stringByAppendingString:consonant];
        [latinizedArr addObject:latinizedStr];
    }
        
    
             NSString *pigLatin = [latinizedArr componentsJoinedByString:@" "];
    return pigLatin;
}


@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSLog(@"Input a sentence");
        
        char str[100];
        fgets (str, 100, stdin);
        NSString *inputString = [[NSString alloc] initWithUTF8String:str];
        inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        inputString = [inputString stringByPigLatinization];
        
        NSLog(@"%@", inputString);
        
//        NSString *url = @"http://www.sitename.com";
//        NSRange range = NSMakeRange(7, [url length] - 7);
//        NSString *subString = [url substringWithRange:range];
//        NSLog(@"substring = %@", subString);
        
    }
    return 0;
}
