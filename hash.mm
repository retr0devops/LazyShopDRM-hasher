#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

  
 
static NSString *hash_alg(NSString *arg) {
  
    const char *check_string = "QBCHEKCCHEQBCHERTYITACHE";

    Class stringClass = objc_getClass("NSMutableString");
    NSMutableString *string = ((NSMutableString *(*)(id, SEL))objc_msgSend)((id)stringClass, NSSelectorFromString(@"alloc"));
    string = ((NSMutableString *(*)(id, SEL))objc_msgSend)((id)string, NSSelectorFromString(@"init"));
    
    SEL characterAtIndexSelector = NSSelectorFromString(@"characterAtIndex:");
    if ([arg length]) {
        int i = 0;
        do {
            unichar symbol = ((unichar (*)(id, SEL, NSUInteger))objc_msgSend)(arg, characterAtIndexSelector, i);
            char new_char = check_string[(unsigned int)i % 0x18] ^ symbol;
            [string appendFormat:@"%C", (unichar)new_char];
            ++i;
        } while ([arg length] > i);
    }
    
    SEL dataUsingEncodingSelector = NSSelectorFromString(@"dataUsingEncoding:");
    NSData *data = ((NSData *(*)(id, SEL, NSStringEncoding))objc_msgSend)(string, dataUsingEncodingSelector, NSASCIIStringEncoding);

    SEL base64EncodedStringWithOptionsSelector = NSSelectorFromString(@"base64EncodedStringWithOptions:");
    NSString *base64String = ((NSString *(*)(id, SEL, NSUInteger))objc_msgSend)(data, base64EncodedStringWithOptionsSelector, 0);

    return base64String;
}

  
// will return you base64 hashed string
