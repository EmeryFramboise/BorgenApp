//
//  DetailViewController.m
//  Borgen
//
//  Created by Tom Offringa on 11/6/12.
//  Copyright (c) 2012 Tom Offringa. All rights reserved.
//

#import "DetailViewController.h"
#import "SecondViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize newsArticle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.naamLabel.text = [newsArticle objectForKey:@"naam"];
    self.gemeenteLabel.text = [newsArticle objectForKey:@"gemeente"];
    self.provincieLabel.text = [newsArticle objectForKey:@"provincie"];
    self.descTextView.text = [newsArticle objectForKey:@"informatie"];

    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[newsArticle objectForKey:@"foto"]]]];
    
    if (nil != image) {
        self.detailImage.image = image;
    }
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.view.backgroundColor = background;
    [background release];

    
    
    
}

- (void)viewDidUnload
{
    [self setDetailImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void) viewWillAppear:(BOOL)inAnimated
{

    
    CGRect frame = CGRectMake(0, 0, 180, 44);
    UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:18];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = self.navigationItem.title;
    // emboss in the same way as the native title
    [label setShadowColor:[UIColor darkGrayColor]];
    [label setShadowOffset:CGSizeMake(0, -0.5)];
    self.navigationItem.titleView = label;
}

@end
