/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../model/model.dart';
import '../../../../model/sample_view.dart';

//ignore: must_be_immutable
class PieGrouping extends SampleView {
  const PieGrouping(Key key) : super(key: key);

  @override
  _PieGroupingState createState() => _PieGroupingState();
}

class _PieGroupingState extends SampleViewState {
  _PieGroupingState();
  @override
  Widget build(BuildContext context) {
    return getGroupingPieChart();
  }

/// Return the circular charts with pie series.
SfCircularChart getGroupingPieChart() {
  return SfCircularChart(
    title: ChartTitle(text: isCardView ? '' : 'Electricity sectors'),
    series: getGroupingPieSeries(isCardView),
    tooltipBehavior:
        TooltipBehavior(enable: true, format: 'point.x : point.y%'),
  );
}

/// Return the list of pie series which need to be grouping.
List<PieSeries<ChartSampleData, String>> getGroupingPieSeries(bool isCardView) {
  final List<ChartSampleData> pieData = <ChartSampleData>[
    ChartSampleData(
        x: 'Coal',
        y: 56.2,
        text: 'Coal: 200,704.5 MW (56.2%)',
        pointColor: null),
    ChartSampleData(
        x: 'Large\nHydro',
        y: 12.7,
        text: 'Large Hydro: 45,399.22 MW (12.7%)',
        pointColor: null),
    ChartSampleData(
        x: 'Small\nHydro',
        y: 1.3,
        text: 'Small Hydro: 4,594.15 MW (1.3%)',
        pointColor: null),
    ChartSampleData(
        x: 'Wind\nPower',
        y: 10,
        text: 'Wind Power: 35,815.88 MW (10.0%)',
        pointColor: null),
    ChartSampleData(
        x: 'Solar\nPower',
        y: 8,
        text: 'Solar Power: 28,679.21 MW (8.0%)',
        pointColor: const Color.fromRGBO(198, 201, 207, 1)),
    ChartSampleData(
        x: 'Biomass',
        y: 2.6,
        text: 'Biomass: 9,269.8 MW (2.6%)',
        pointColor: null),
    ChartSampleData(
        x: 'Nuclear',
        y: 1.9,
        text: 'Nuclear: 6,780 MW (1.9%)',
        pointColor: null),
    ChartSampleData(
        x: 'Gas', y: 7, text: 'Gas: 24,937.22 MW (7.0%)', pointColor: null),
    ChartSampleData(
        x: 'Diesel', y: 0.2, text: 'Diesel: 637.63 MW (0.2%)', pointColor: null)
  ];
  return <PieSeries<ChartSampleData, String>>[
    PieSeries<ChartSampleData, String>(
        radius: '90%',
        dataLabelMapper: (ChartSampleData data, _) => data.x,
        dataLabelSettings: DataLabelSettings(
            isVisible: true, labelPosition: ChartDataLabelPosition.inside),
        dataSource: pieData,
        startAngle: 90,
        endAngle: 90,
        /// To enable and specify the group mode for pie chart.
        groupMode: CircularChartGroupMode.value,
        groupTo: 7,
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.y)
  ];
}
}