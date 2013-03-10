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
    
    [SG beginPathAtPoint:CGPointMake(10, 10)];
    [SG addLineFromPoint:CGPointMake(200, 30) toPoint:CGPointMake(10, 50)];
    
    [SG strokePathWithColor:[UIColor redColor]];
}


@end
