//
//  main.m
//  stockz
//
//  Created by Daniel Buckle on 12/04/2013.
//  Copyright (c) 2013 Daniel Buckle. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *stocks = [[NSMutableArray alloc] init];
        
        NSMutableDictionary *stock;
        
        // Create date object
        NSDate *currentDate = [NSDate date];
        
        // Create date format
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        // Set Date Format
        [dateFormat setDateFormat: @"dd/MM/yyyy"];
        // Get Date string
        NSString *dateToday = [dateFormat stringFromDate:currentDate];
        
        stock = [NSMutableDictionary dictionary];
        [stock setObject:dateToday forKey:@"date"];
        [stock setObject:@"AAPL" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:200] forKey:@"shares"];
        [stocks addObject:stock];
        
        stock = [NSMutableDictionary dictionary];
        [stock setObject:dateToday forKey:@"date"];
        [stock setObject:@"GOOG" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:160] forKey:@"shares"];
        [stocks addObject:stock];
        
        stock = [NSMutableDictionary dictionary];
        [stock setObject:dateToday forKey:@"date"];
        [stock setObject:@"ORCL" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:160] forKey:@"shares"];
        [stocks addObject:stock];
        
        [stocks writeToFile:@"/tmp/stocks.plist" atomically:YES];
        
        NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
        
        for (NSDictionary *d in stockList) {
            NSLog(@"I have %@ shares of %@ on the %@", [d objectForKey:@"shares"], [d objectForKey:@"symbol"], [d objectForKey:@"date"]);
        }
        
    }
    return 0;
}

