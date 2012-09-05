//
//  LineView.m
//  PieChart
//
//  Created by Simon Withington on 16/08/2012.
//
//

#import "LineView.h"

@implementation LineView

-(void) reset {
    [pointPairs removeAllObjects];
}

-(void) drawRect:(CGRect)rect {
    // draw lines
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(c, [[UIColor blueColor] CGColor]);
    CGContextSetLineWidth(c, 2.f);
    
    for(NSArray *pair in pointPairs){
        CGPoint first, second;
        
        [(NSValue *)[pair objectAtIndex:0] getValue:&first];
        [(NSValue *)[pair objectAtIndex:1] getValue:&second];
        
        CGContextBeginPath(c);
        
        CGContextMoveToPoint(c, first.x, first.y);
        CGContextAddLineToPoint(c, second.x, second.y);
        
        CGContextStrokePath(c);
    }
}

-(void)addPointPair:(CGPoint)first second:(CGPoint)second {
    
    if (!pointPairs) {
        pointPairs = [[NSMutableArray alloc] init];
    }
    
    NSValue *firstValue  = [NSValue valueWithCGPoint:first];
    NSValue *secondValue = [NSValue valueWithCGPoint:second];
    
    NSArray *pair = [NSArray arrayWithObjects:firstValue, secondValue, nil];
    
    [pointPairs addObject:pair];
    
    [self setNeedsDisplay];
}

@end