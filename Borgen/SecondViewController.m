//
//  SecondViewController.m
//  Borgen
//
//  Created by Tom Offringa on 11/6/12.
//  Copyright (c) 2012 Tom Offringa. All rights reserved.
//

#import "SecondViewController.h"
#import "DetailViewController.h"
#import "BorgenCell.h"
 #import <QuartzCore/QuartzCore.h>

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Alle Borgen", @"Alle Borgen");
        self.tabBarItem.image = [UIImage imageNamed:@"list@2x"];
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Netwerk indicator laten zien als er gegevens worden opgehaald
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    // JSON URL
    NSURL *url = [NSURL URLWithString:@"http://testing.rommeldetom.com/backendios/jsonlive.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    // Custom titel voor de terugknop in de detail view
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Terug" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];

}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.data = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData
{
    [self.data appendData:theData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    self.news = [NSJSONSerialization JSONObjectWithData:self.data options:0 error:nil];
    [self.mainTableView reloadData];

}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Zorg ervoor dat u een internetverbinding heeft!" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [errorView show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.news count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Initialiseren van custom table cell. 
    BorgenCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BorgenCell"];
    
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BorgenCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // Naam, gemeente en thumbnail in de tableview.
    cell.naamLabel.text = [[self.news objectAtIndex:indexPath.row] objectForKey:@"naam"];
    cell.gemeenteLabel.text = [[self.news objectAtIndex:indexPath.row] objectForKey:@"gemeente"];
    cell.thumbnailImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[self.news objectAtIndex:indexPath.row] objectForKey:@"thumbs"]]]];
    
    //Ronde hoeken op de plaatjes.
    cell.thumbnailImageView.layer.masksToBounds = YES;
    cell.thumbnailImageView.layer.cornerRadius = 5.0;


    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailViewController.newsArticle = [self.news objectAtIndex:indexPath.row];
    detailViewController.title = [[self.news objectAtIndex:indexPath.row] objectForKey:@"naam"];
    [self.navigationController pushViewController:detailViewController animated:YES];

    [detailViewController release];    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

// Hoogte van de custom cell
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 52;
}

// Unselecteren van een cell bij terugkomen table view
-(void) viewWillAppear:(BOOL)inAnimated
{

    
    NSIndexPath*    selection = [self.mainTableView indexPathForSelectedRow];
    if (selection) {
        [self.mainTableView deselectRowAtIndexPath:selection animated:YES];
    }
    
    //Stijl van de titel veranderen.
    CGRect frame = CGRectMake(0, 0, 400, 44);
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

- (void)viewDidBecomeActive:(UIApplication *)application{

}


@end
