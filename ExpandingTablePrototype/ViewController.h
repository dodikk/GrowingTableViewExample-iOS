//
//  ViewController.h
//  ExpandingTablePrototype
//
//  Created by Oleksandr Dodatko on 4/30/15.
//  Copyright (c) 2015 healthjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView* tableView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint* tableViewHeight;

-(IBAction)onAddButtonTapped:(id)sender;
-(IBAction)onRemoveButtonTapped:(id)sender;


@end

