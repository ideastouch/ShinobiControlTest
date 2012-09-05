//
//  PieChartDataSource.m
//  PieChart
//
//
//

#import "PieChartDataSource.h"

@implementation PieChartDataSource

// Returns the number of points for a specific series in the specified chart
- (int)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex {
    if (chart.tag == 1) {
        return 6;
    }
    else {
        return 2;
    }
}

// Returns the series at the specified index for a given chart
-(SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(int)index {
    
    // In our example we have either a pie series or a donut series at index 0, depending on the chart.
    SChartRadialSeries *radialSeries;
    
    // Return an appropriate subclass of SChartRadialSeries.
    if (chart.tag == 1) {
    //if ([[chart title] isEqualToString:@"Pie Chart"]) {
        
        // Pie Chart
        SChartPieSeries *pieSeries = [[SChartPieSeries alloc] init];
        
        // Configure the series
        pieSeries.title = [NSString stringWithFormat:@"Pie Series"];
        pieSeries.style.showLabels = YES;
        pieSeries.style.chartEffect = SChartRadialChartEffectRounded;
        pieSeries.selectedStyle.chartEffect = SChartRadialChartEffectRounded;
        pieSeries.selectedStyle.labelFontColor = [UIColor blackColor];
        pieSeries.selectedPosition = [NSNumber numberWithDouble:-M_PI_2];
        pieSeries.outerRadius = chart.frame.size.height * 0.5f * 0.8f;
        pieSeries.innerRadius = pieSeries.outerRadius * 0.2f;
        
        radialSeries = pieSeries;
        
    } else {
        
        // Donut Chart
        SChartDonutSeries *donutSeries = [[SChartDonutSeries alloc] init];
        
        // Configure the series
        donutSeries.title = [NSString stringWithFormat:@" Outer Donut Series"];
        donutSeries.selectedStyle.labelFontColor = [UIColor blackColor];
        donutSeries.selectedPosition = [NSNumber numberWithInt: 0];
        donutSeries.style.chartEffect = SChartRadialChartEffectFlat;
        donutSeries.selectedStyle.chartEffect = SChartRadialChartEffectFlat;
        donutSeries.outerRadius = chart.frame.size.height * 0.5f * 0.8f;
        donutSeries.innerRadius = donutSeries.outerRadius * 0.7f;
        
        radialSeries = donutSeries;
    }
    
    return radialSeries;
}

// Returns the number of series in the specified chart
- (int)numberOfSeriesInSChart:(ShinobiChart *)chart {
    return 1;
}

// Returns the data point at the specified index for the given series/chart.
- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex {
    
    // Construct a data point to return
    SChartRadialDataPoint *datapoint = [[SChartRadialDataPoint alloc] init];
    
    // Give the data point a name
    datapoint.name = [NSString stringWithFormat:@"Data %d", dataIndex];
    
    // Give the data point a value
    if (chart.tag == 1) {
        datapoint.value = [NSNumber numberWithInt: 5+dataIndex];
    }
    else {
        if (dataIndex == 0) {
            datapoint.value = [NSNumber numberWithInt: 44];
        }
        else {
            datapoint.value = [NSNumber numberWithInt: 154];
        }
    }
    
    return datapoint;
}

@end
