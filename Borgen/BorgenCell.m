//
//  BorgenCell.m
//  Borgen
//
//  Created by Tom Offringa on 11/9/12.
//  Copyright (c) 2012 Tom Offringa. All rights reserved.
//

#import "BorgenCell.h"




@implementation BorgenCell

@synthesize naamLabel = _naamLabel;
@synthesize gemeenteLabel = _gemeenteLabel;
@synthesize thumbnailImageView = _thumbnailImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    


    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
