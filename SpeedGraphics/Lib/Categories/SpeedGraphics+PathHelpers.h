//
//  SpeedGraphics+PathHelpers.h
//  SpeedGraphics
//
//  Created by Yari Dareglia on 3/10/13.
//  Copyright (c) 2013 Yari Dareglia. All rights reserved.
//

#import "SpeedGraphics.h"

@interface SpeedGraphics (PathHelpers)




#pragma mark - Generic Path  -
/***  Generic Path  **/

/**
 @desc: Create a path defining the first point
 **/
-(void) beginPathAtPoint:(CGPoint)point;




#pragma mark - Lines  -
/*** Lines  **/

/**
 @desc: create a path line between 2 points
 **/
-(void) addLineFromPoint:(CGPoint)point toPoint:(CGPoint)point;

/**
 @desc: Create an horizontal line
 **/
-(void) addLineFromPoint:(CGPoint)point withLength:(int)length;

/**
 @desc: Create a vertical line
 **/
-(void) addLineFromPoint:(CGPoint)point withHeight:(int)height;
@end
