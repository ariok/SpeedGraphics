//
//  SpeedGraphics.m
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
    
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    self.context = UIGraphicsGetCurrentContext();
    
#elif TARGET_OS_MAC
    self.context = [[NSGraphicsContext currentContext]graphicsPort];
#endif
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

-(void) setLineDash:(SGLineDash)lineDash{
    CGContextSetLineDash(self.context, lineDash.phase, lineDash.lenghts, lineDash.count);
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

-(void) setFillPattern:(SGPattern)fillPattern{
    CGContextSetFillPattern(self.context, fillPattern.pattern, fillPattern.components);
}

-(void) setStrokePattern:(SGPattern)strokePattern{
    CGContextSetStrokePattern(self.context, strokePattern.pattern, strokePattern.components);
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




#pragma mark - Using Transparency Layers  -
/** @name Using Transparency Layers  **/

-(void)beginTransparencyLayer:(CFDictionaryRef)info{
    CGContextBeginTransparencyLayer(self.context, info);
}

-(void)beginTransparencyLayerWithRect:(CGRect)rect info:(CFDictionaryRef)info{
    CGContextBeginTransparencyLayerWithRect(self.context, rect, info);
}

-(void)endTransparencyLayer{
    CGContextEndTransparencyLayer(self.context);
}




#pragma mark - Drawing an Image to a Graphics Context  -
/** @name Drawing an Image to a Graphics Context  **/

-(void)drawTiledImage:(CGImageRef)image rect:(CGRect)rect{
    CGContextDrawTiledImage(self.context, rect, image);
}

-(void)drawImage:(CGImageRef)image rect:(CGRect)rect{
    CGContextDrawImage(self.context, rect, image);
}




#pragma mark - Drawing PDF Content to a Graphics Context  -
/** @name Drawing PDF Content to a Graphics Context  **/

-(void)drawPDFPage:(CGPDFPageRef)page{
    CGContextDrawPDFPage(self.context, page);
}




#pragma mark - Drawing With a Gradient  -
/** @name Drawing With a Gradient  **/

-(void)drawLinearGradient:(CGGradientRef)gradient startPoint:(CGPoint)sp endPoint:(CGPoint)ep options:(CGGradientDrawingOptions)options{
    CGContextDrawLinearGradient(self.context, gradient, sp, ep, options);
}


-(void)drawRadialGradient:(CGGradientRef)gradient startCenter:(CGPoint)sc startRadius:(CGFloat)sr endCenter:(CGPoint)ec endRadius:(CGFloat)er options:(CGGradientDrawingOptions)options{
    CGContextDrawRadialGradient(self.context, gradient, sc, sr, ec, er, options);
}




#pragma mark - Drawing With a Shading  -
/*** Drawing With a Shading **/

-(void)drawShading:(CGShadingRef)shading{
    CGContextDrawShading(self.context, shading);
}




#pragma mark - Setting Up a Page-Based Graphics Context  -
/*** Setting Up a Page-Based Graphics Context  **/


-(void)beginPage:(CGRect*)mediaBox{
    CGContextBeginPage(self.context, mediaBox);
}


-(void)endPage{
    CGContextEndPage(self.context);
}




#pragma mark - Drawing Glyphs  -
/*** Drawing Glyphs  **/

-(void)showGlyphs:(CGGlyph*)g count:(size_t)count{
    CGContextShowGlyphs(self.context, g, count);
}

-(void)showGlyphs:(CGGlyph*)g atPoint:(CGPoint)point count:(size_t)count{
    CGContextShowGlyphsAtPoint(self.context, point.x, point.y, g, count);
}

-(void)showGlyphs:(CGGlyph*)g atPositions:(CGPoint*)positions count:(size_t)count{
    CGContextShowGlyphsAtPositions(self.context, g, positions, count);
}

-(void)showGlyphs:(CGGlyph*)g withAdvances:(CGSize*)advances count:(size_t)count{
    CGContextShowGlyphsWithAdvances(self.context, g, advances, count);
}




#pragma mark - Drawing Text  -
/*** Drawing Text  **/


-(CGAffineTransform)getTextMatrix{
    return CGContextGetTextMatrix(self.context);
}

-(CGPoint)getTextPosition{
    return CGContextGetTextPosition(self.context);
}

-(void)selectFont:(char*)name size:(CGFloat)size textEncoding:(CGTextEncoding)encoding{
    CGContextSelectFont(self.context, name, size, encoding);
}

-(void)setCharacterSpacing:(CGFloat)spacing{
    CGContextSetCharacterSpacing(self.context, spacing);
}

-(void)setFont:(CGFontRef)font{
    CGContextSetFont(self.context, font);
}

-(void)setFontSize:(CGFloat)size{
    CGContextSetFontSize(self.context, size);
}

-(void)setTextDrawingMode:(CGTextDrawingMode)mode{
    CGContextSetTextDrawingMode(self.context, mode);
}

-(void)setTextMatrix:(CGAffineTransform)t{
    CGContextSetTextMatrix(self.context, t);
}

-(void)setTextPosition:(CGPoint)point{
    CGContextSetTextPosition(self.context, point.x, point.y);
}

-(void)showText:(char*)string length:(size_t)length{
    CGContextShowText(self.context, string, length);
}

-(void)showText:(char*)string length:(size_t)length atPoint:(CGPoint)point{
    CGContextShowTextAtPoint(self.context, point.x, point.y, string, length);
}




#pragma mark - Converting Between Device Space and User Space  -
/*** Converting Between Device Space and User Space  **/

-(CGAffineTransform) getUserSpaceToDeviceSpaceTransform{
    return CGContextGetUserSpaceToDeviceSpaceTransform(self.context);
}

-(CGPoint) convertPointToDeviceSpace:(CGPoint)point{
    return CGContextConvertPointToDeviceSpace(self.context, point);
}

-(CGPoint) convertPointToUserSpace:(CGPoint)point{
    return CGContextConvertPointToUserSpace(self.context, point);
}

-(CGSize) convertSizeToDeviceSpace:(CGSize)size{
    return CGContextConvertSizeToDeviceSpace(self.context, size);
}

-(CGSize) convertSizeToUserSpace:(CGSize)size{
    return CGContextConvertSizeToUserSpace(self.context, size);
}

-(CGRect) convertRectToDeviceSpace:(CGRect)rect{
    return CGContextConvertRectToDeviceSpace(self.context, rect);
}

-(CGRect) convertRectToUserSpace:(CGRect)rect{
    return CGContextConvertRectToUserSpace(self.context, rect);
}



@end
