//
//  WineryDatabase.m
//  WWwineries
//
//  Created by Joel Smith on 4/29/13.
//  Copyright (c) 2013 Joel Smith. All rights reserved.
//

#import "WineryDatabase.h"


@implementation WineryDatabase


+(WineryDatabase *) Database {
    static WineryDatabase *Database = nil;
    if (!Database) {
        Database = [[super allocWithZone:nil] init];
    }
    return Database;
}

+(id) allocWithZone:(NSZone *)zone {
    return [self Database];
}

-(id) init {
    self = [super init];
    if (self) {
        //set ivar
        _xmldatabase = [RXMLElement elementFromXMLFile:@"winerydb.xml"];
        _wineries = [_xmldatabase children:@"Winery"];
    }
    return self;
}

@end
