//
//  ViewController.m
//  Stopwatch
//
//  Created by Jonathan Archille on 11/30/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITableView *lapTableView;
@property (assign) NSInteger count;
@property (nonatomic) NSTimer *timer;

@property (nonatomic) NSMutableArray *laps;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.laps = [[NSMutableArray alloc]init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startTapped:(UIButton *)sender
{
    if (!self.timer)
    {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(incrementCount) userInfo:nil repeats:YES];
    }
}
- (IBAction)stopTapped:(UIButton *)sender
{
    [self.timer invalidate];
    self.timer = nil;
}
- (IBAction)resetTapped:(UIButton *)sender
{
    self.timeLabel.text = @"0";
    [self.laps removeAllObjects];
    [self.lapTableView reloadData];
    self.count = 0;

}

- (IBAction)lapTapped:(UIButton *)sender
{
    [self.laps addObject:self.timeLabel.text];
    [self.lapTableView reloadData];
}


- (void)incrementCount
{
    self.count += 1;
    self.timeLabel.text = [NSString stringWithFormat:@"%ld", (long)self.count];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.laps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LapCell" forIndexPath:indexPath];
    
    NSString *aLap = self.laps[[self.laps count] - 1 - indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ seconds", aLap];
    
    return cell;
}


@end
