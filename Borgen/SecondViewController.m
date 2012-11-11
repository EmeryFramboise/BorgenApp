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

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Alle Borgen", @"Alle Borgen");
        self.tabBarItem.image = [UIImage imageNamed:@"list"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSURL *url = [NSURL URLWithString:@"http://testing.rommeldetom.com/backendios/jsonlive.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
	// Do any additional setup after loading the view, typically from a nib.
    
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
    UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The download could not complete - please make sure you're connected to either 3G or Wi-Fi." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
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
    BorgenCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BorgenCell"];
    
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BorgenCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }

    cell.naamLabel.text = [[self.news objectAtIndex:indexPath.row] objectForKey:@"naam"];
    cell.gemeenteLabel.text = [[self.news objectAtIndex:indexPath.row] objectForKey:@"gemeente"];
    cell.thumbnailImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[self.news objectAtIndex:indexPath.row] objectForKey:@"foto"]]]];
    
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 91;
}


@end