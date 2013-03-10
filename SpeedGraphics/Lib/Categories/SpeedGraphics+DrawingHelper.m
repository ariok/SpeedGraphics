//
//  SpeedGraphics+DrawingHelper.m
//  SpeedGraphics
//
/*
 Copyright [2013] [Yari D'areglia]
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

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
