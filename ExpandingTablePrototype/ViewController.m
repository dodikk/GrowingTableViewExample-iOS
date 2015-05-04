//
//  ViewController.m
//  ExpandingTablePrototype
//
//  Created by Oleksandr Dodatko on 4/30/15.
//  Copyright (c) 2015 healthjoy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSUInteger cellsCount;

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    

    self.cellsCount = 5;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    
    [self.tableView reloadData];
    [self makeTableResizable];
}

-(IBAction)onAddButtonTapped:(id)sender
{
    ++self.cellsCount;
    
    [self.tableView reloadData];
    [self.view setNeedsLayout];
}

-(IBAction)onRemoveButtonTapped:(id)sender
{
    if (0 == self.cellsCount)
    {
        return;
    }
    
    --self.cellsCount;

    [self.tableView reloadData];
    [self.tableView sizeToFit];
    [self.view setNeedsLayout];
}

-(void)makeTableResizable
{
    self.tableViewHeight.constant = self.tableView.contentSize.height;
    
    [self.tableView addObserver: self
                     forKeyPath: @"contentSize"
                        options: 0
                        context: NULL];
}

-(void)observeValueForKeyPath:(NSString*)keyPath
                     ofObject:(id)object
                       change:(NSDictionary*)change
                      context:(void*)context
{
    if ([keyPath isEqualToString: @"contentSize"])
    {
        self.tableViewHeight.constant = self.tableView.contentSize.height;
        [self.view setNeedsLayout];
    }
}

-(NSInteger)tableView:(UITableView*)tableView
numberOfRowsInSection:(NSInteger)section
{
    return (NSInteger)self.cellsCount;
}

-(UITableViewCell *)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    static NSString* const cellId = @"test cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: cellId];
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                      reuseIdentifier: cellId];
    }
    
    cell.textLabel.text = [NSString stringWithFormat: @"%@", @(indexPath.row)];
    return cell;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}

@end
