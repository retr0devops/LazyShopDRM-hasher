#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

static NSString * dehash_alg(NSString * arg) {
  NSData * base64_data = [[NSData alloc] initWithBase64EncodedString:arg options:0];
  NSString * str = [[NSString alloc] initWithData:base64_data encoding:NSASCIIStringEncoding];
  NSMutableString * string = [[NSMutableString alloc] init];
  const char * check_string = "QBCHEKCCHEQBCHERTYITACHE";
  if ([str length]) {
    int i = 0;
    do {
      unichar symbol = [str characterAtIndex:i];
      NSString * new_string = [NSString stringWithFormat:@"%C", (unichar)(check_string[(unsigned int)i % 0x18] ^ symbol)];
      [string appendString:new_string];
      ++i;
    }
    while ([str length] > i);
  }
  return [NSString stringWithString:string];
}

// It will return you dehashed string
