//
//  DetailViewController.h
//  Borgen
//
//  Created by Tom Offringa on 11/6/12.
//  Copyright (c) 2012 Tom Offringa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (nonatomic, copy) NSDictionary *newsArticle;

@property (nonatomic, strong) IBOutlet UILabel *naamLabel;
@property (nonatomic, strong) IBOutlet UILabel *gemeenteLabel;
@property (nonatomic, strong) IBOutlet UILabel *provincieLabel;
@property (nonatomic, strong) IBOutlet UITextView *descTextView;
@property (strong, nonatomic) IBOutlet UIImageView *detailImage;

@end
