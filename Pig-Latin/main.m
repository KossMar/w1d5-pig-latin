

#import <Foundation/Foundation.h>

@interface NSString (moreMeth)

-(NSString *)stringByPigLatinization;

@end

@implementation NSString (moreMeth)

//-(NSString *)stringByPigLatinization {
//    NSString *consonantStr =;
//    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiuoy"];
//    NSCharacterSet *consonantSet = [NSCharacterSet characterSetWithCharactersInString: @"bcdfghjklmnpqrstvwxz"];
//    NSArray *stringToArray = [self componentsSeparatedByString:@" "];
//    
//    for (NSString *b in stringToArray){
//        if ([b ];
//    }
//             NSString *pigLatin = [stringToArray componentsJoinedByString:@" "];
//    return pigLatin;
//}


@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        NSLog(@"Input a sentence");
//        
//        char str[100];
//        fgets (str, 100, stdin);
//        NSString *inputString = [[NSString alloc] initWithUTF8String:str];
//        inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//        
//        inputString = [inputString stringByPigLatinization];
//        
//        NSLog(@"%@", inputString);
        
        NSString *url = @"http://www.sitename.com";
        NSRange range = NSMakeRange(7, [url length] - 7);
        NSString *subString = [url substringWithRange:range];
        NSLog(@"substring = %@", subString);
        
    }
    return 0;
}
