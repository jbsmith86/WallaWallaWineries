//
//  WineryDatabase.h
//  WWwineries
//
//  Created by Joel Smith on 4/29/13.
//  Copyright (c) 2013 Joel Smith. All rights reserved.
//

#import "RXMLElement.h"
#import <Foundation/Foundation.h>

@interface WineryDatabase : NSObject

@property (nonatomic, strong) RXMLElement *xmldatabase;
@property (nonatomic, strong) NSArray *wineries;


+(WineryDatabase *) Database;

@end
