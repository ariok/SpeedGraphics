//
//  TestView.m
//  SpeedGraphics
//
//  Created by Yari Dareglia on 3/10/13.
//  Copyright (c) 2013 Yari Dareglia. All rights reserved.
//

#import "TestView.h"
#import "SpeedGraphics.h"

@implementation TestView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    SpeedGraphics *SG = [SpeedGraphics sharedSpeedGraphics];
    [SG useCurrentContext];

    [SG beginPathAtPoint:CGPointMake(10, 10)];
    [SG addLineFromPoint:CGPointMake(200, 30) toPoint:CGPointMake(10, 50)];
    
    [SG strokePathWithColor:[NSColor redColor]];

}

@end
