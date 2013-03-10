//
//  SpeedGraphics+DrawingHelper.m
//  SpeedGraphics
//
//  Created by Yari Dareglia on 3/10/13.
//  Copyright (c) 2013 Yari Dareglia. All rights reserved.
//

#import "SpeedGraphics+DrawingHelper.h"

@implementation SpeedGraphics (DrawingHelper)

#pragma mark - Quick drawing  -
/*** Quick drawing  **/

/**
 @desc: fill and stroke the current path
 **/
-(void)fillAndStrokePath{
    CGContextDrawPath(self.context, kCGPathFillStroke);
}



#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#pragma mark - iOS Methods  -
/*** iOS Methods  **/

-(void)strokePathWithColor:(UIColor*)color {
    [color setStroke];
    CGContextDrawPath(self.context, kCGPathStroke);
}

-(void)fillPathWithColor:(UIColor*)color{
    [color setFill];
    CGContextDrawPath(self.context, kCGPathFill);
}




#pragma mark - OSX Methods  -
/*** OSX Methods  **/

#elif TARGET_OS_MAC
-(void)strokePathWithColor:(NSColor*)color{
    [color setStroke];
    CGContextDrawPath(self.context, kCGPathStroke);
}

-(void)fillPathWithColor:(NSColor*)color{
    [color setStroke];
    CGContextDrawPath(self.context, kCGPathStroke);
}

#endif
@end
