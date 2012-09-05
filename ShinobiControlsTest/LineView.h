//
//  LineView.h
//  PieChart
//
//  Created by Simon Withington on 16/08/2012.
//
//

#import <UIKit/UIKit.h>

@interface LineView : UIView {
    NSMutableArray *pointPairs;
}

-(void)addPointPair:(CGPoint)first second:(CGPoint)second;
-(void)reset;

@end