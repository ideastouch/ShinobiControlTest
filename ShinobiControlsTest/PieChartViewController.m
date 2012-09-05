//
//  PieChartViewController.m
//  PieChart
//
//  Copyright 2012 Scott Logic Ltd. All rights reserved.

#import "PieChartViewController.h"
#import <ShinobiCharts/SChartCanvas.h>
#import <ShinobiCharts/SChartDataPoint.h>
#import <ShinobiCharts/SChart.h>

@interface PieChartViewController()

@property (strong, nonatomic) SChartRadialDataPoint *currentSelected;

@end

@implementation PieChartViewController

#pragma mark - View lifecycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createPieChart];
    [self createDonutChart];
    _pieShinobiChart.licenseKey = @"fFsleP/QUO73elTMjAxMjA5MzBpbmZvQHNoaW5vYmljb250cm9scy5jb20=PUws7G+WYKgULoH7Qv2m8DExAll2ZR+NHB2gpaQhMDjhlPjKDW3nEgR/C45TMuBW2IPPQORl9IGajEXAN3gYHkt/thrD+pA/ufIQUzI5sYVi0jtOLp5Hw8kb0IAyMdkBnmoDlS66XbnKKvWDpo+ZVZIM8uW0=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";
    _donutShinobiChart.licenseKey = @"fFsleP/QUO73elTMjAxMjA5MzBpbmZvQHNoaW5vYmljb250cm9scy5jb20=PUws7G+WYKgULoH7Qv2m8DExAll2ZR+NHB2gpaQhMDjhlPjKDW3nEgR/C45TMuBW2IPPQORl9IGajEXAN3gYHkt/thrD+pA/ufIQUzI5sYVi0jtOLp5Hw8kb0IAyMdkBnmoDlS66XbnKKvWDpo+ZVZIM8uW0=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";
}

-(PieChartDataSource*)datasource
{
    if (_datasource == nil) {
        _datasource = [[PieChartDataSource alloc] init];
    }
    
    return _datasource;
}

-(void)createPieChart {
    
    ShinobiChart *pieChart = _pieShinobiChart;
    pieChart.theme = [[SChartMidnightTheme alloc] init];
    //SChartRadialChartEffectRounded
    pieChart.backgroundColor = [UIColor clearColor];
    // As the chart is a UIView, set its resizing mask to allow it to automatically resize when screen orientation changes.
    pieChart.autoresizingMask = ~UIViewAutoresizingNone;
    
    // Set the datasource
    pieChart.datasource = self.datasource;
    
    // Set the delegate
    pieChart.delegate = self;
    
    pieChart.tag = 1;
    
    // Set the chart title
    //pieChart.title = @"Pie Chart";
    //pieChart.titleLabel.font = [UIFont fontWithName:@"TrebuchetMS"
    //                                           size:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)?27.0f:17.f];
    //pieChart.titleLabel.textColor = [UIColor whiteColor];
    
    // Customize Legend
    pieChart.legend.hidden = YES;
    //pieChart.legend.position = SChartLegendPositionBottomMiddle;
    //pieChart.legend.maxSeriesPerLine = 2;
    
    // Add the chart to the view controller
    //[self.view addSubview:pieChart];

}

-(void)createDonutChart {
    ShinobiChart *donutChart = _donutShinobiChart;
    donutChart.theme = [[SChartTheme alloc] init];
    donutChart.backgroundColor = [UIColor clearColor];
    // As the chart is a UIView, set its resizing mask to allow it to automatically resize when screen orientation changes.
    donutChart.autoresizingMask = ~UIViewAutoresizingNone;
    
    
    // Set the datasource
    donutChart.datasource = self.datasource;
    
    // Set the delegate
    donutChart.delegate = self;
    
    donutChart.tag = 2;
    
    // Set the chart title
    //donutChart.title = @"Donut Chart";
    //donutChart.titleLabel.font = [UIFont fontWithName:@"TrebuchetMS"
    //                                           size:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)?27.0f:17.f];
    //donutChart.titleLabel.textColor = [UIColor whiteColor];
    
    // Add the chart to the view controller
    //[self.view addSubview:donutChart];
}

// Remove this method in iOS 6!
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}
/*
- (void)sChartRenderStarted:(ShinobiChart *)chart withFullRedraw:(BOOL)fullRedraw {
    // position our view over the top of the GL canvas
    CGRect glFrame = chart.canvas.glView.frame;
    glFrame.origin.y = chart.canvas.frame.origin.y;
    [lineView setFrame:glFrame];
    // remove the old point-pairs from the line view
    [lineView reset];
}
*/
// Only allow one slice in the donutChart to be selected at a time
-(void)sChart:(ShinobiChart *)chart toggledSelectionForRadialPoint:(SChartRadialDataPoint *)dataPoint inSeries:(SChartRadialSeries *)s atPixelCoordinate:(CGPoint)pixelPoint {
    /*
    if (chart == _pieShinobiChart) {
        return;
    }
    else { */
    NSLog(@"Toggled Selection For Radial Point");
    
    if (dataPoint.selected) {
        self.currentSelected = dataPoint;
    }
    else {
        self.currentSelected = nil;
    }
    
        SChartDonutSeries *series = (SChartDonutSeries *)s;
    
        
        for (SChartRadialDataPoint *rDP in series.dataSeries.dataPoints) {
            if (rDP.sChartDataPointIndex != dataPoint.sChartDataPointIndex) {
                [series setSlice: rDP.sChartDataPointIndex asSelected: NO];
            }
        }
    //}
}

// Move the pieChart's slice labels out of the slices
#define EXTRUSION 30.f//120.
-(void)sChart:(ShinobiChart *)chart alterLabel:(UILabel *)label forDatapoint:(SChartDataPoint *)datapoint atSliceIndex:(int)index inRadialSeries:(SChartRadialSeries *)series {
    
    if (chart == _donutShinobiChart) {
        return;
    }
    
    SChartPieSeries *pieSeries = (SChartPieSeries *)series;
    
    // three points:
    CGPoint pieCenter;      // chart center for trig calculations
    CGPoint oldLabelCenter; // original label center
    CGPoint labelCenter;    // new label center
    CGPoint endOfLine;     // we want our line to finish just short of our label
    
    pieCenter = [pieSeries getDonutCenter];
    oldLabelCenter = labelCenter = [pieSeries getSliceCenter:index];
    
    // find the angle of the slice, and add on a little to the label's center
    float xChange, yChange;
    
    xChange = pieCenter.x - labelCenter.x;
    yChange = pieCenter.y - labelCenter.y;
    
    float angle = atan2f(xChange, yChange) + M_PI / 2.f;
    // we do the M_PI / 2 adjustment because of how the pie is drawn internally
    
    float outerRadius = chart.frame.size.height * 0.5f * 0.8f;
    float innerRadius = pieSeries.outerRadius * 0.2f;
    float extrusion = (outerRadius + innerRadius) * 0.5f;
    
    labelCenter.x = oldLabelCenter.x + extrusion * cosf(angle);
    labelCenter.y = oldLabelCenter.y - extrusion * sinf(angle);
    
    endOfLine.x = oldLabelCenter.x + (extrusion-30.f) * cosf(angle);
    endOfLine.y = oldLabelCenter.y - (extrusion-30.f) * sinf(angle);
    
    [label setText:datapoint.xValue];
    [label sizeToFit];
    //[label setCenter:labelCenter]; // this must be after sizeToFit
    [label setHidden:NO];
    
    // connect our old label point to our new label
    //[lineView addPointPair:oldLabelCenter second:endOfLine];
}

- (void)viewDidUnload {
    [self setPieChartView:nil];
    [self setDonutChartView:nil];
    [self setPieShinobiChart:nil];
    [self setDonutShinobiChart:nil];
    [self setDoubleTapRecognizer:nil];
    [self setPieChartInfoView:nil];
    [self setPieChartInfoNameLabel:nil];
    [self setPieChartInfoValueLabel:nil];
    [self setPieChartLabelsCollection:nil];
    [super viewDidUnload];
}
- (IBAction)doubleTapHandlerAction:(UITapGestureRecognizer *)recognizer {
    
    NSLog(@"Double touch handler");
    CGRect rect = _pieChartInfoView.frame;
    if (_currentSelected) {
         NSLog(@"double touch one radial with name \"%@\" and value \"%@\".", _currentSelected.name, _currentSelected.value.description);
        _pieChartInfoNameLabel.text = _currentSelected.name;
        _pieChartInfoValueLabel.text = _currentSelected.value.description;
        _pieChartInfoView.frame = CGRectMake(_pieShinobiChart.center.x, _pieChartInfoView.frame.origin.y, 0, _pieChartInfoView.frame.size.height);
        _pieChartInfoView.hidden = NO;
        for (UILabel *label in _pieChartLabelsCollection) {
            label.alpha = 0.f;
        }
        [UIView animateWithDuration:1
                         animations:^(){
                             _pieChartInfoView.frame = CGRectMake(_pieChartInfoView.frame.origin.x,
                                                                  _pieChartInfoView.frame.origin.y,
                                                                  rect.size.width,
                                                                  rect.size.height);
                         }
                         completion:^(BOOL finished){
                             [UIView animateWithDuration:1
                                              animations:^(){
                                                  _pieChartInfoView.frame = CGRectMake(rect.origin.x,
                                                                                       _pieChartInfoView.frame.origin.y,
                                                                                       _pieChartInfoView.frame.size.width,
                                                                                       _pieChartInfoView.frame.size.height);
                                                  
                                                  for (UILabel *label in _pieChartLabelsCollection) {
                                                      label.alpha = 1.f;
                                                  }
                                              }];
                         }];
    }
    else {
        [UIView animateWithDuration:1.5
                         animations:^(){
                             _pieChartInfoView.frame = CGRectMake(_pieChartInfoView.frame.origin.x + _pieChartInfoView.frame.size.width,
                                                                  _pieChartInfoView.frame.origin.y,
                                                                  0,
                                                                  _pieChartInfoView.frame.size.height);
                             for (UILabel *label in _pieChartLabelsCollection) {
                                 label.alpha = 0.f;
                             }

                         }
                         completion:^(BOOL finished){
                             _pieChartInfoView.hidden = YES;
                             _pieChartInfoView.frame = rect;
                         }];
    }
}
@end
