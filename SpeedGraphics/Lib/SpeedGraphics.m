//
//  SpeedGraphics.m
//  SpeedGraphics
//
//  Created by Yari Dareglia on 3/9/13.
//  Copyright (c) 2013 Yari Dareglia. All rights reserved.
//

#import "SpeedGraphics.h"

@implementation SpeedGraphics




#pragma mark - Class Methods  -
/*** Class Methods  ***/

+(SpeedGraphics*) sharedSpeedGraphics{
    static SpeedGraphics* speedGraphics;
    static dispatch_once_t tokenOnce;
    
    dispatch_once(&tokenOnce,^{
        speedGraphics = [[SpeedGraphics alloc]init];
    });
    
    return speedGraphics;
}




#pragma mark - Graphics Context  -
/*** Graphics Context  ***/

-(void) useCurrentContext{
//OSXdiff
    self.context = UIGraphicsGetCurrentContext();    
}

-(void) contextFlush{
    CGContextFlush(self.context);
}

-(void) saveState{
    CGContextSaveGState(self.context);
}

-(void) restoreState{
    CGContextRestoreGState(self.context);
}

-(void) releaseContext{
    CGContextRelease(self.context);
}

-(void) retainContext{
    CGContextRetain(self.context);
}




#pragma mark - Graphics State Parameters  -
/*** Graphics State Parameters  ***/

-(void) setFlatness:(CGFloat)flatness{
    CGContextSetFlatness(self.context, flatness);
}

-(void) setLineWidth:(CGFloat)lineWidth{
    CGContextSetLineWidth(self.context, lineWidth);
}

-(void) setLineCap:(CGLineCap)lineCap{
    CGContextSetLineCap(self.context, lineCap);
}

-(void) setLineJoin:(CGFloat)lineJoin{
    CGContextSetLineJoin(self.context, lineJoin);
}

-(void) setInterpolationQuality:(CGInterpolationQuality)interpolationQuality{
    CGContextSetInterpolationQuality(self.context, interpolationQuality);
}

-(CGInterpolationQuality) interpolationQuality{
    return CGContextGetInterpolationQuality(self.context);
}

-(void) setMiterLimit:(CGFloat)miterLimit{
    CGContextSetMiterLimit(self.context, miterLimit);
}

-(void) setPatternPhase:(CGSize)patternPhase{
    CGContextSetPatternPhase(self.context, patternPhase);
}

-(void) setShouldAntialias:(BOOL)shouldAntialias{
    CGContextSetShouldAntialias(self.context, shouldAntialias);
}

-(void) setBlendMode:(CGBlendMode)blendMode{
    CGContextSetBlendMode(self.context, blendMode);
}

-(void) setAllowsAntialiasing:(BOOL)allowsAntialiasing{
    CGContextSetAllowsAntialiasing(self.context, allowsAntialiasing);
}

-(void) setAllowsFontSmoothing:(BOOL)allowsFontSmoothing{
    CGContextSetAllowsFontSmoothing(self.context, allowsFontSmoothing);
}

-(void) setShouldSmoothFonts:(BOOL)shouldSmoothFonts{
    CGContextSetShouldSmoothFonts(self.context, shouldSmoothFonts);
}

-(void) setShouldSubpixelPositionFonts:(BOOL)shouldSubpixelPositionFonts{
    CGContextSetShouldSubpixelPositionFonts(self.context, shouldSubpixelPositionFonts);
}

-(void) setAllowsFontSubpixelPositioning:(BOOL)allowsFontSubpixelPositioning {
    CGContextSetAllowsFontSubpixelPositioning(self.context, allowsFontSubpixelPositioning);
}

-(void) setAllowsFontSubpixelQuantization:(BOOL)allowsFontSubpixelQuantization{
    CGContextSetAllowsFontSubpixelQuantization(self.context, allowsFontSubpixelQuantization);
}

-(void) setShouldSubpixelQuantizeFonts:(BOOL)shouldSubpixelQuantizeFonts{
    CGContextSetShouldSubpixelQuantizeFonts(self.context, shouldSubpixelQuantizeFonts);
}




#pragma mark - Constructing Path -
/** @name Constructing Path   **/

-(void) addArc:(CGPoint)point radius:(int)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise{
    CGContextAddArc(self.context, point.x, point.y, radius, startAngle, endAngle, clockwise);
}

-(void) addArcWithControlPoint1:(CGPoint)cp1 controlPoint2:(CGPoint)cp2 radius:(int)radius{
    CGContextAddArcToPoint(self.context, cp1.x, cp1.y, cp2.x, cp2.y, radius);
}

-(void) addCurveWithControlPoint1:(CGPoint)cp1 controlPoint2:(CGPoint)cp2 curveEndPoint:(CGPoint)endPoint{
    CGContextAddCurveToPoint(self.context, cp1.x, cp1.y, cp2.x, cp2.y, endPoint.x, endPoint.y);
}

-(void) addEllipseInRect:(CGRect)rect{
    CGContextAddEllipseInRect(self.context, rect);
}

-(void) addLines:(CGPoint *)points count:(size_t)count{
    CGContextAddLines(self.context, points, count);
}

-(void) addLineToPoint:(CGPoint)point{
    CGContextAddLineToPoint(self.context, point.x, point.y);
}

-(void) addPath:(CGPathRef)path{
    CGContextAddPath(self.context, path);
}

-(CGPathRef)copyPath{
    return CGContextCopyPath(self.context);
}

-(void) addQuadCurveWithControlPoint:(CGPoint)cp1 toPoint:(CGPoint)endPoint{
    CGContextAddQuadCurveToPoint(self.context, cp1.x, cp1.y, endPoint.x, endPoint.y);
}

-(void) addRect:(CGRect)rect{
    CGContextAddRect(self.context, rect);
}

-(void) addRects:(CGRect *)rects count:(size_t)count{
    CGContextAddRects(self.context, rects, count);
}

-(void) beginPath{
    CGContextBeginPath(self.context);
}

-(void) closePath{
    CGContextClosePath(self.context);
}

-(void) moveToPoint:(CGPoint)point{
    CGContextMoveToPoint(self.context, point.x, point.y);
}




#pragma mark - Painting Path  -
/*** Painting Path  ***/

-(void)clearRect:(CGRect)rect{
    CGContextClearRect(self.context, rect);
}

-(void) drawPath:(CGPathDrawingMode)mode{
    CGContextDrawPath(self.context, mode);
}

-(void) EOFillPath{
    CGContextEOFillPath(self.context);
}

-(void) fillPath{
    CGContextFillPath(self.context);
}

-(void) fillRect:(CGRect)rect{
    CGContextFillRect(self.context, rect);
}

-(void) fillRects:(CGRect *)rects count:(size_t)count{
    CGContextFillRects(self.context, rects, count);
}

-(void) fillEllipseInRect:(CGRect)rect{
    CGContextFillEllipseInRect(self.context, rect);
}

-(void) strokePath{
    CGContextStrokePath(self.context);
}

-(void) strokeRect:(CGRect)rect{
    CGContextStrokeRect(self.context, rect);
}

-(void) strokeRect:(CGRect)rect withWidth:(CGFloat)width{
    CGContextStrokeRectWithWidth(self.context, rect, width);
}

-(void) replacePathWithStrokedPath{
    CGContextReplacePathWithStrokedPath(self.context);
}

-(void) strokeEllipseInRect:(CGRect)rect{
    CGContextStrokeEllipseInRect(self.context, rect);
}

-(void) strokeLineSegments:(CGPoint *)points count:(size_t)count{
    CGContextStrokeLineSegments(self.context, points, count);
}

-(void) clipToMask:(CGRect)rect mask:(CGImageRef)image{
    CGContextClipToMask(self.context, rect, image);
}



#pragma mark - Getting Information About Paths  -
/*** Getting Information About Paths  ***/

-(BOOL) isPathEmpty{
    return CGContextIsPathEmpty(self.context);
}

-(CGPoint) getPathCurrentPoint{
    return CGContextGetPathCurrentPoint(self.context);
}

-(CGRect) getPathBoundingBox{
    return CGContextGetPathBoundingBox(self.context);
}

-(BOOL) pathContainsPoint:(CGPoint)point mode:(CGPathDrawingMode)mode{
    return CGContextPathContainsPoint(self.context, point, mode);
}




#pragma mark - Modifying Clipping Paths -
/*** Modifying Clipping Paths ***/

-(void)clip{
    CGContextClip(self.context);
}

-(void)EOClip{
    CGContextEOClip(self.context);
}

-(void)clipToRect:(CGRect)rect{
    CGContextClipToRect(self.context, rect);
}

-(void)cliptoRects:(CGRect *)rects count:(size_t)count{
    CGContextClipToRects(self.context, rects, count);
}

-(CGRect)getClipBoundingBox{
    return CGContextGetClipBoundingBox(self.context);
}




#pragma mark - Setting Color, Color Space and shadow  -
/*** Setting Color, Color Space and shadow  ***/

-(void) setAlpha:(CGFloat)alpha{
    CGContextSetAlpha(self.context, alpha);
}

-(void) setFillColor:(CGFloat *)fillColor{
    CGContextSetFillColor(self.context, fillColor);
}

-(void) setFillColorSpace:(CGColorSpaceRef)fillColorSpace{
    CGContextSetFillColorSpace(self.context, fillColorSpace);
}

-(void) setFillColorWithColor:(CGColorRef)fillColorWithColor{
    CGContextSetFillColorWithColor(self.context, fillColorWithColor);
}

-(void) setCMYKFillColor:(SGCMYKColor)color{
    CGContextSetCMYKFillColor(self.context, color.c, color.m, color.y, color.k, color.a);
}

-(void) setCMYKStrokeColor:(SGCMYKColor)color{
    CGContextSetCMYKStrokeColor(self.context, color.c, color.m, color.y, color.k, color.a);
}

-(void) setGrayFillColor:(SGGrayColor)color{
    CGContextSetGrayFillColor(self.context, color.gray, color.alpha);
}

-(void) setGrayStrokeColor:(SGGrayColor)color{
    CGContextSetGrayStrokeColor(self.context, color.gray, color.alpha);
}

-(void) setShadow:(SGBlackShadow)shadow{
    CGContextSetShadow(self.context, shadow.offset, shadow.blur);
}

-(void) setShadowWithColor:(SGColorShadow)shadow{
    CGContextSetShadowWithColor(self.context, shadow.offset, shadow.blur, shadow.color);
}

-(void) setRGBFillColor:(SGRGBColor)color{
    CGContextSetRGBFillColor(self.context, color.r , color.g, color.b, color.a);
}

-(void) setRGBStrokeColor:(SGRGBColor)color{
    CGContextSetRGBStrokeColor(self.context, color.r , color.g, color.b, color.a);
}

-(void) setStrokeColor:(CGFloat *)strokeColor{
    CGContextSetStrokeColor(self.context, strokeColor);
}

-(void) setStrokeColorSpace:(CGColorSpaceRef)strokeColorSpace{
    CGContextSetStrokeColorSpace(self.context, strokeColorSpace);
}

-(void) setStrokeColorWithColor:(CGColorRef)strokeColorWithColor{
    CGContextSetStrokeColorWithColor(self.context, strokeColorWithColor);
}




#pragma mark - Transforming User Space  -
/** @name Transforming User Space  **/

-(void)concatCTM:(CGAffineTransform)transform{
    CGContextConcatCTM(self.context, transform);
}

-(void)getCTM{
    CGContextGetCTM(self.context);
}

-(void)rotateCTM:(CGFloat)angle{
    CGContextRotateCTM(self.context, angle);
}

-(void)scaleCTMx:(CGFloat)sx y:(CGFloat)sy{
    CGContextScaleCTM(self.context, sx, sy);
}

-(void)translateCTMx:(CGFloat)tx y:(CGFloat)ty{
    CGContextTranslateCTM(self.context, tx, ty);
}




@end
