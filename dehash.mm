#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

static NSString * dehash_alg(NSString * arg) {

    Class dataClass = objc_getClass("NSData");
    NSData * dataInit = ((NSData *(*)(id, SEL))objc_msgSend)((id)dataClass, NSSelectorFromString(@"alloc"));
    SEL initWithBase64EncodedStringSelector = NSSelectorFromString(@"initWithBase64EncodedString:options:");
    NSData *base64_data = ((NSData *(*)(id, SEL, NSString *, NSInteger))objc_msgSend)(dataInit, initWithBase64EncodedStringSelector, arg, 0);
    
    Class stringClass = objc_getClass("NSString");
    NSString * stringInit = ((NSString *(*)(id, SEL))objc_msgSend)((id)stringClass, NSSelectorFromString(@"alloc"));
    SEL initWithDataEncodingSelector = NSSelectorFromString(@"initWithData:encoding:");
    NSString *str = ((NSString *(*)(id, SEL, NSData *, NSStringEncoding))objc_msgSend)(stringInit, initWithDataEncodingSelector, base64_data, NSASCIIStringEncoding);


    Class stringMutableClass = objc_getClass("NSMutableString");
    NSMutableString *string = ((NSMutableString *(*)(id, SEL))objc_msgSend)((id)stringMutableClass, NSSelectorFromString(@"alloc"));
    string = ((NSMutableString *(*)(id, SEL))objc_msgSend)((id)string, NSSelectorFromString(@"init"));

    const char * check_string = "QBCHEKCCHEQBCHERTYITACHE");
    SEL characterAtIndexSelector = NSSelectorFromString(@"characterAtIndex:");
    if ([str length]) {
        int i = 0;
        do {
            unichar symbol = ((unichar (*)(id, SEL, NSUInteger))objc_msgSend)(str, characterAtIndexSelector, i);
            NSString * new_string = [NSString stringWithFormat:@"%C", (unichar)(check_string[(unsigned int)i % 0x18] ^ symbol)];
            [string appendString:new_string];
            ++i;
        }
        while ([str length] > i);
    }

    SEL stringWithStringSelector = NSSelectorFromString(@"stringWithString:");

    return ((NSString *(*)(id, SEL, NSString *))objc_msgSend)(objc_getClass("NSString"), stringWithStringSelector, string);
}

// It will return you dehashed string
