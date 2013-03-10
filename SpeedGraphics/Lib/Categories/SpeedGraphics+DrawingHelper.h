//
//  SpeedGraphics+DrawingHelper.h
//  SpeedGraphics
//
//  Created by Yari Dareglia on 3/10/13.
//  Copyright (c) 2013 Yari Dareglia. All rights reserved.
//

#import "SpeedGraphics.h"
@interface SpeedGraphics (DrawingHelper)

#pragma mark - Quick drawing  -
/*** Quick drawing  **/

/**
 @desc: fill and stroke the current path
 **/
-(void)fillAndStrokePath;




#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#pragma mark - iOS Methods  -
/*** iOS Methods  **/

-(void)strokePathWithColor:(UIColor*)color;

-(void)fillPathWithColor:(UIColor*)color;




#pragma mark - OSX Methods  -
/*** OSX Methods  **/

#elif TARGET_OS_MAC
-(void)strokePathWithColor:(NSColor*)color;

-(void)fillPathWithColor:(NSColor*)color;

#endif

@end
