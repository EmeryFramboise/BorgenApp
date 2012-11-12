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
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"paperios.png"]];
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

@end
