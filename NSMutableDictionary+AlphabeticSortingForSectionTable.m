//
//  NSMutableDictionary+GetSections.m
//  Sections
//
//  Created by YURIY ROMAS on 17.03.13.
//  Copyright (c) 2013 roma86. All rights reserved.
//

#import "NSMutableDictionary+AlphabeticSortingForSectionTable.h"

@implementation NSMutableDictionary (AlphabeticSortingForSectionTable)

+ (id)sectionedDictionaryFromArray:(NSArray *)arrayFoAlphabeticSections
{
    id dictionary = [[self alloc] init];
    
    BOOL found;
    
    for (NSString *c in arrayFoAlphabeticSections)
    {
        NSString *cc = [c substringToIndex:1];
        
        found = NO;
        
        for (NSString *str in [dictionary allKeys])
        {
            if ([str isEqualToString:c])
            {
                found = YES;
            }
        }
        
        if (!found)
        {
            [dictionary setValue:[[NSMutableArray alloc] init] forKey:cc];
        }
    }
    
    for (NSString *c in arrayFoAlphabeticSections) {
        [[dictionary objectForKey:[c substringToIndex:1]] addObject:c];
    }
    
    for (NSString *key in [dictionary allKeys]) {
        [[dictionary objectForKey:key] sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    }
    
    return dictionary;
}
@end
