//
//
//  Created by Yari Dareglia on 12/19/12.
//

#import "GraphicHelper.h"

@interface GraphicHelper()

@end

@implementation GraphicHelper
@synthesize context = _context;

+(GraphicHelper*)sharedGraphicHelper{
    static GraphicHelper* graphicHelper;
    static dispatch_once_t tokenOnce;
    
    dispatch_once(&tokenOnce,^{
        graphicHelper = [[GraphicHelper alloc]init];
    });
    
    return graphicHelper;
}

-(void) useCurrentContext{
    self.context = [[NSGraphicsContext currentContext]graphicsPort];
}

-(void) saveState{
    CGContextSaveGState(self.context);
}

-(void) restoreState{
    CGContextRestoreGState(self.context);
}


#pragma mark - Masking -

-(void) clip{
    CGContextClip(self.context);
}

-(void) clipToMask:(NSImage*)mask inRect:(NSRect)rect{
    CGContextClipToMask(self.context, rect, [mask CGImage]);
}


#pragma mark - Paths -

-(void) moveToPoint:(CGPoint)point{
    CGContextMoveToPoint(self.context, point.x, point.y);
}

-(void) beginPath{
    CGContextBeginPath(self.context);
}

-(void) closePath{
    CGContextClosePath(self.context);
}

-(void) beginPathAtPoint:(CGPoint)point{
    [self beginPath];
    CGContextMoveToPoint(self.context, point.x, point.y);
}

// LINES
-(void) addLineToPoint:(CGPoint)point{
    CGContextAddLineToPoint(self.context, point.x, point.y);
}

-(void) addLineToLastPoint:(CGPoint)point{
    [self addLineToPoint:point];
    [self closePath];
}

-(void) addLineFromPoint:(CGPoint)point toPoint:(CGPoint)toPoint{
    [self addLineToPoint:point];
    [self addLineToPoint:toPoint];
}

-(void) addLineFromPoint:(CGPoint)point withLength:(int)length {
    CGContextAddLineToPoint(self.context, point.x, point.y);
    CGContextAddLineToPoint(self.context, point.x + length, point.y);
}

-(void) addLineFromPoint:(CGPoint)point withHeight:(int)height {
    CGContextAddLineToPoint(self.context, point.x, point.y);
    CGContextAddLineToPoint(self.context, point.x, point.y + height);
}

// ARCS
-(void)addArc:(CGPoint)point radius:(int)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise{
    CGContextAddArc(self.context, point.x, point.y, radius, startAngle, endAngle, clockwise);
}

-(void)addArcFromPoint:(CGPoint)startPoint toPointradius:(CGPoint)endPoint radius:(int)radius{
    CGContextAddArcToPoint(self.context, startPoint.x, startPoint.y, endPoint.x, endPoint.y, radius);
}

// SHAPES
-(void)addRect:(CGRect)rect radius:(float)radius{

    [self beginPath];
    
    [self moveToPoint:point(CGRectGetMinX(rect) + radius, CGRectGetMinY(rect))];
    [self addArc:point(CGRectGetMaxX(rect) - radius, CGRectGetMinY(rect) + radius) radius:radius startAngle:3 * M_PI / 2 endAngle:0 clockwise:0];
    [self addArc:point(CGRectGetMaxX(rect) - radius, CGRectGetMaxY(rect) - radius) radius:radius startAngle:0 endAngle:M_PI / 2 clockwise:0];
    [self addArc:point(CGRectGetMinX(rect) + radius, CGRectGetMaxY(rect) - radius) radius:radius startAngle:M_PI / 2 endAngle:M_PI clockwise:0];
    [self addArc:point(CGRectGetMinX(rect) + radius, CGRectGetMinY(rect) + radius) radius:radius startAngle:M_PI endAngle:3 * M_PI / 2 clockwise:0];
    
    [self closePath];
}

-(void)addRect:(CGRect)rect{
    [self beginPath];
    CGContextAddRect(self.context, rect);
}


#pragma mark - Gradient - 

-(void) drawBaseLinearGradientWithComponents:(CGFloat *)components startPoint:(CGPoint)startPoint toPoint:(CGPoint)toPoint{
    CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, components, NULL, 2);
    CGColorSpaceRelease(baseSpace);
    
    CGContextDrawLinearGradient(self.context, gradient, startPoint, toPoint, 0);
    CGGradientRelease(gradient);
}


#pragma mark - Quick Draw -

-(void) drawPathWithMode:(CGPathDrawingMode) mode{
    CGContextDrawPath(self.context, mode);
}

-(void) strokePath{
    [self drawPathWithMode:kCGPathStroke];
}

-(void) fillPath{
    [self drawPathWithMode:kCGPathFill];
}

-(void) drawLineFromPoint:(CGPoint)point toPoint:(CGPoint)toPoint color:(NSColor*)color width:(int)width{
    [self saveState];
    {
        [color setStroke];
        self.lineWidth = width;
        [self beginPathAtPoint:point];
        [self addLineToPoint:toPoint];
        [self strokePath];
    }
    [self restoreState];
}

-(void) drawRect:(CGRect)rect fillColor:(NSColor*)fillColor strokeColor:(NSColor*)strokeColor{
    [self saveState];
    {
        [[NSColor clearColor]set];
        
        if(fillColor)   [fillColor setFill];
        if(strokeColor) [strokeColor setStroke];
        
        [self addRect:rect];
        [self drawPathWithMode:kCGPathFillStroke];
    }
    [self restoreState];
}


#pragma mark - Image -

-(void) drawImage:(NSImage *)image inRect:(CGRect)rect fromRect:(NSRect)fromRect{

    if(image){

        [self saveState];
        CGContextTranslateCTM(self.context, 0, fromRect.size.height);
        CGContextScaleCTM(self.context, 1, -1);
        CGContextDrawImage(self.context, rect, [image CGImage]);
        [self restoreState];
    }
}

-(void) drawImage:(NSImage *)image atPoint:(CGPoint)point fromRect:(NSRect)fromRect{
    CGRect imageFrame = CGRectMake(point.x, point.y, image.size.width, image.size.height);
    [self drawImage:image inRect:imageFrame fromRect:fromRect];
}

-(NSImage*) brighterImage:(NSImage*)image{
    NSImage *newImage = [[NSImage alloc]initWithSize:image.size];
    NSRect imageArea = CGRectMake(0, 0, newImage.size.width, newImage.size.height);
    
    [newImage lockFocus];
    CGContextRef imageContext = [[NSGraphicsContext currentContext]graphicsPort];
    
    CGContextDrawImage(imageContext, imageArea, [image CGImage]);
    CGContextSaveGState(imageContext);
    CGContextClipToMask(imageContext, imageArea, image.CGImage);
    CGContextSetBlendMode(imageContext,kCGBlendModeSoftLight);
    [[NSColor whiteColor] set];
    CGContextFillRect(imageContext, imageArea);
    CGContextRestoreGState(imageContext);
    
    [newImage unlockFocus];
    
    return newImage;
}

-(NSImage*) darkerImage:(NSImage*)image{
    NSImage *newImage = [[NSImage alloc]initWithSize:image.size];
    NSRect imageArea = CGRectMake(0, 0, newImage.size.width, newImage.size.height);
    
    [newImage lockFocus];
    CGContextRef imageContext = [[NSGraphicsContext currentContext]graphicsPort];
    
    CGContextDrawImage(imageContext, imageArea, [image CGImage]);
    CGContextSaveGState(imageContext);
    CGContextClipToMask(imageContext, imageArea, image.CGImage);
    CGContextSetBlendMode(imageContext,kCGBlendModeMultiply
                          );
    [[NSColor colorWithDeviceWhite:0 alpha:0.4] set];
    CGContextFillRect(imageContext, imageArea);
    CGContextRestoreGState(imageContext);
    
    [newImage unlockFocus];

    return newImage;
}

-(NSImage*)imageFromPath:(NSString *)imagePath{
    NSImage * image= [[NSImage alloc]initWithSize:CGSizeZero];
    image = [image initByReferencingFile:imagePath];
    
    if([image isValid]){
        return image;
    }else{
#warning Gestione Errori
        NSLog(@"[Warning] Image %@ is not valid", imagePath);
        return nil;
    }
}

#pragma mark - Font -

-(CGFloat)fontLineHeight:(NSFont *)font{
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc]init];
    return [layoutManager defaultLineHeightForFont:font];
}


#pragma mark - Helper - 

-(NSRect) centerRect:(NSRect)rect inRect:(NSRect)container{
    NSRect centered = NSMakeRect( (int)(container.size.width - rect.size.width)/2,
                                  (int)(container.size.height - rect.size.height)/2,
                                  rect.size.width,
                                  rect.size.height);
    
    return centered;
}


#pragma mark - Properties overloading -

-(void) setAntialias:(BOOL)antialias{
    CGContextSetShouldAntialias(self.context, antialias);
}

-(void) setLineWidth:(int)lineWidth{
    CGContextSetLineWidth(self.context, lineWidth);
}

@end

//END GRAPHIC HELPER IMPLEMENTATION ******************************


#pragma mark - Categories Implementation-

@implementation NSImage(GraphicHelper)

-(CGImageRef)CGImage{
    
    CGImageSourceRef source;
    source = CGImageSourceCreateWithData((__bridge CFDataRef)[self TIFFRepresentation], NULL);
    CGImageRef CGRef =  CGImageSourceCreateImageAtIndex(source, 0, NULL);
    CFRelease(source);
    
    return CGRef;
}

@end;


#pragma mark - C Functions -

CGPoint point(int x, int y){
    return CGPointMake(x, y);
}

NSRect NSEdgeInsetsInsetRect(NSRect rect, MKEdgeInsets insets){
    
    rect.origin.x    += insets.left;
    rect.origin.y    += insets.top;
    rect.size.width  -= (insets.left + insets.right);
    rect.size.height -= (insets.top  + insets.bottom);
    
    return rect;
}
