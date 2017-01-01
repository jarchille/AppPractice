//
//  ViewController.m
//  WizardWatch
//
//  Created by Jonathan Archille on 11/30/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "WizardsTableViewController.h"
#import "Wizard.h"

@interface WizardsTableViewController ()

@property (nonatomic, strong) NSMutableArray *wizards;

@end

@implementation WizardsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadWizard];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - JSON Method

- (void)loadWizard
{
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"wizards" ofType:@"json"];
    NSArray *wizardsJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filepath] options:NSJSONReadingAllowFragments error:nil];
    self.wizards = [[NSMutableArray alloc] init];
    for (NSDictionary *aDictionary in wizardsJSON)
    {
        Wizard *aWizard = [Wizard wizardWithDictionary:aDictionary];
        [self.wizards addObject:aWizard];        
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wizards.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WizardCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Wizard *aWizard = self.wizards[indexPath.row];
    cell.textLabel.text = aWizard.name;
    cell.detailTextLabel.text = aWizard.house;
    
    
    return cell;
}


@end
