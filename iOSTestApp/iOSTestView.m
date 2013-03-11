//
//  iOSTestView.m
//  SpeedGraphics
//
//  Created by Yari Dareglia on 3/10/13.
//  Copyright (c) 2013 Yari Dareglia. All rights reserved.
//

#import "iOSTestView.h"
#import "SpeedGraphics.h"

@implementation iOSTestView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    SpeedGraphics *SG = [SpeedGraphics sharedSpeedGraphics];
    [SG useCurrentContext];
    
    [SG addCircleAPoint:CGPointMake(50, 50) radius:50];

    [SG addRect:CGRectMake(10, 10, 200, 200) roundedCorner:20];
    
    [SG fill:[UIColor redColor] andStroke:[UIColor whiteColor]];
}


@end
