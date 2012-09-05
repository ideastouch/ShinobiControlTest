//
//  PieChartViewController.h
//  PieChart
//
//  Created by Simon Withington on 11/01/2012.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "PieChartDataSource.h"
#import "LineView.h"

@interface PieChartViewController : UIViewController <SChartDelegate, UIGestureRecognizerDelegate> {
    //ShinobiChart *pieChart, *donutChart;
    LineView *lineView;
}

@property (strong, nonatomic) PieChartDataSource *datasource;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *doubleTapRecognizer;
- (IBAction)doubleTapHandlerAction:(UITapGestureRecognizer *)recognizer;

@property (strong, nonatomic) IBOutlet UIView *pieChartView;
@property (strong, nonatomic) IBOutlet ShinobiChart *pieShinobiChart;

@property (strong, nonatomic) IBOutlet UIView *donutChartView;
@property (strong, nonatomic) IBOutlet ShinobiChart *donutShinobiChart;

@property (strong, nonatomic) IBOutlet UIView *pieChartInfoView;
@property (strong, nonatomic) IBOutlet UILabel *pieChartInfoNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *pieChartInfoValueLabel;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *pieChartLabelsCollection;

@end
