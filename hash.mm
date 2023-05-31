#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

  
 
static NSString *hash_alg(NSString *arg) {
    const char *check_string = "QBCHEKCCHEQBCHERTYITACHE";
    NSMutableString *string = [[NSMutableString alloc] init];
    
    if ([arg length]) {
        int i = 0;
        do {
            unichar symbol = [arg characterAtIndex:i];
            char new_char = check_string[(unsigned int)i % 0x18] ^ symbol;
            [string appendFormat:@"%C", (unichar)new_char];
            ++i;
        } while ([arg length] > i);
    }
    
    NSData *data = [string dataUsingEncoding:NSASCIIStringEncoding];
    NSString *base64String = [data base64EncodedStringWithOptions:0];
    
    return base64String;
}

  
// will return you base64 hashed string
