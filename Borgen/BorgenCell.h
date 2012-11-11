//
//  BorgenCell.h
//  Borgen
//
//  Created by Tom Offringa on 11/9/12.
//  Copyright (c) 2012 Tom Offringa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BorgenCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *naamLabel;
@property (nonatomic, strong) IBOutlet UILabel *gemeenteLabel;
@property (nonatomic, strong) IBOutlet UIImageView *thumbnailImageView;


@end
