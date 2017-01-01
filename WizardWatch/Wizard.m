//
//  Wizard.m
//  WizardWatch
//
//  Created by Jonathan Archille on 11/30/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "Wizard.h"

@implementation Wizard

+ (Wizard *)wizardWithDictionary:(NSDictionary *)wizardDictionary
{
    Wizard *aWizard = nil;
    if (wizardDictionary)
    {
        aWizard = [[Wizard alloc] init];
        aWizard.name = wizardDictionary[@"name"];
        aWizard.house = wizardDictionary[@"house"];
    }
    
    return aWizard;
    
}


@end
