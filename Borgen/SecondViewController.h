//
//  SecondViewController.h
//  Borgen
//
//  Created by Tom Offringa on 11/6/12.
//  Copyright (c) 2012 Tom Offringa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITableView *mainTableView;

@property (nonatomic, strong) NSArray *news;
@property (nonatomic, strong) NSMutableData *data;

@property(nonatomic) BOOL clearsSelectionOnViewWillAppear;

@end
