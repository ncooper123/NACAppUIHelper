//
//  AppUIHelper.h
//
//  Created by Nathan Cooper on 2014-09-15.
//

#import <Foundation/Foundation.h>

@interface AppUIHelper : NSObject

// GENERAL APP HELPERS

+ (NSURL *)applicationDocumentsDirectory;

// STRING METHODS

/**
 * Returns:
 * an NSNumber if the value is OK.
 * nil if the value is blank/invalid.
 */

+ (NSString *) getNonemptyStringFromSource:(NSString*)string;
+ (NSString *) getTrimmedNonemptyStringFromSource:(NSString *)string;
+ (NSNumber *) getPositiveIntegerFromSource: (NSString *)string;
+ (NSString *) getTrimmedServerAddressFromSource:(NSString*)string;


/**
 * Returns:
 * an NSNumber >= 0 if the number was OK.
 * an NSNumber == -1 if the number was badly formatted.
 * nil if the value would be considered blank.
 */

+ (NSNumber *) getOptionalNonnegativeIntegerFromSource: (NSString *)string;
+ (NSNumber *) getOptionalNonnegativeDoubleFromSource: (NSString*)string;
+ (NSNumber *) getOptionalPositiveIntegerFromSource: (NSString *)string;

//UI METHODS

//Since UITextViews return nil for empty values, these methods extract the values as proper strings.

+ (NSString*) getUIStringFromString:(NSString*)string;
+ (NSString*) getUIStringFromNumber:(NSNumber*)number;

@end
