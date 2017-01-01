//
//  Wizard.h
//  WizardWatch
//
//  Created by Jonathan Archille on 11/30/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wizard : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *house;

+ (Wizard *)wizardWithDictionary:(NSDictionary *)wizardDictionary;

@end
