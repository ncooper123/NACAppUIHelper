//
//  AppUIHelper.m
//
//  Created by Nathan Cooper on 2014-09-15.
//

#import "AppUIHelper.h"

@implementation AppUIHelper

+ (NSURL *)applicationDocumentsDirectory {
  return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

//////////////////////////
//TEXT-FIELD CHECKING
//////////////////////////


+ (NSString *) getTrimmedNonemptyStringFromSource:(NSString *)string {
  if (string == nil){
    return nil;
  }
  NSString *trimmed = [string stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
  if ([trimmed isEqualToString: @""]){
    return nil;
  }
  else {
    return trimmed;
  }
}

+ (NSString *) getTrimmedNonemptyStringWithRegularExpression:(NSRegularExpression *)regex fromSource:(NSString *)string {
  NSString *trimmed = [self getTrimmedNonemptyStringFromSource:string];
  if (trimmed == nil){
    return nil;
  }
  else{
    NSTextCheckingResult *match = [regex firstMatchInString:trimmed options:0 range:NSMakeRange(0, [trimmed length])];
    if (match){
      return trimmed;
    }
    else{
      return nil;
    }
  }
}

+ (NSString*) getTrimmedServerAddressFromSource:(NSString*)string {
  NSString *trimmed = [AppUIHelper getTrimmedNonemptyStringFromSource:string];
  if (trimmed){
    NSURL *url = [NSURL URLWithString:trimmed];
    if (url == nil){
      return nil;
    }
    else{
      NSLog(@"%@",[url absoluteString]);
      return [url absoluteString];
    }
  }
  else{
    return nil;
  }
}

+ (NSNumber*) getOptionalNonnegativeIntegerFromSource: (NSString *)string {
  NSString *trimmed = [AppUIHelper getTrimmedNonemptyStringFromSource:string];
  if (trimmed){
    if ([trimmed length] > 9){
      //Too large to fit in an integer.
      return [NSNumber numberWithInt:-1];
    }
    NSScanner *scanner = [NSScanner scannerWithString:trimmed];
    if([scanner scanInteger:NULL] && [scanner isAtEnd]){
      NSNumber *value = [[NSNumber alloc] initWithInteger:[trimmed integerValue]];
      if ([value intValue] < 0){
        //Number was negative.
        return [NSNumber numberWithInt:-1];
      }
      else{
        return value;
      }
    }
    else{
      //Number was not a number.
      return [NSNumber numberWithInt:-1];
    }
  }
  else{
    //Number wasn't even a valid nonempty string.
    return nil;
  }
}

+ (NSNumber *) getOptionalNonnegativeDoubleFromSource: (NSString*)string {
  NSString *trimmed = [AppUIHelper getTrimmedNonemptyStringFromSource:string];
  if (trimmed){
    NSScanner *scanner = [NSScanner scannerWithString:trimmed];
    if([scanner scanDouble:NULL] && [scanner isAtEnd]){
      NSNumber *value = [[NSNumber alloc] initWithDouble:[trimmed doubleValue]];
      if ([value doubleValue] < 0){
        //Number was negative.
        return [NSNumber numberWithInt:-1];
      }
      else{
        //Number was OK.
        return value;
      }
    }
    else{
      //Number was not a number.
      return [NSNumber numberWithInt:-1];
    }
  }
  else{
    //Number wasn't even a nonempty string.
    return nil;
  }
  
}

+ (NSNumber*) getOptionalPositiveIntegerFromSource: (NSString *)string {
  NSString *trimmed = [AppUIHelper getTrimmedNonemptyStringFromSource:string];
  if (trimmed){
    if ([trimmed length] > 9){
      //Too large to fit in an integer.
      return [NSNumber numberWithInt:-1];
    }
    NSScanner *scanner = [NSScanner scannerWithString:trimmed];
    if([scanner scanInteger:NULL] && [scanner isAtEnd]){
      NSNumber *value = [[NSNumber alloc] initWithInteger:[trimmed integerValue]];
      if ([value intValue] <= 0){
        //Number was negative.
        return [NSNumber numberWithInt:-1];
      }
      else{
        //Number was OK.
        return value;
      }
    }
    else{
      //Number was not a number.
      return [NSNumber numberWithInt:-1];
    }
  }
  else{
    //Number wasn't even a nonempty string.
    return nil;
  }
}

+ (NSNumber *) getPositiveIntegerFromSource: (NSString *)string{
  NSString *trimmed = [AppUIHelper getTrimmedNonemptyStringFromSource:string];
  if (trimmed){
    if ([trimmed length] > 9){
      //Too large to fit in an integer.
      return nil;
    }
    NSScanner *scanner = [NSScanner scannerWithString:trimmed];
    if([scanner scanInteger:NULL] && [scanner isAtEnd]){
      NSNumber *value = [[NSNumber alloc] initWithInteger:[trimmed integerValue]];
      if ([value intValue] <= 0){
        //Number was negative.
        return nil;
      }
      else{
        //Number was negative.
        return value;
      }
    }
    else{
      //Number was not a number.
      return nil;
    }
  }
  else{
    //Number wasn't even a valid nonempty string.
    return nil;
  }
}

////////////////////////
// UI METHODS
////////////////////////

+ (NSString*) getUIStringFromString:(NSString*)string{
  if (string == nil){
    return @"";
  }
  else{
    return [NSString stringWithFormat:@"%@",string];
  }
}

+ (NSString*) getUIStringFromNumber:(NSNumber*)number{
  if (number == nil){
    return @"";
  }
  else{
    return [NSString stringWithFormat:@"%@",number];
  }
}

@end
