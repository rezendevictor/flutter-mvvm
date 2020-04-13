import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:mvvm/tootlbox.dart';
import 'package:mvvm/viewmodel/expenseaddition.viewmodel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ExtractedData extends StatelessWidget {
  final List<ExpenseAddition> rawData;
  ExtractedData(this.rawData, {bool animate});

  @override
  Widget build(BuildContext context) {
    return pieChart(extrator(rawData));
  }

  static Widget sample(){
    return DonutPieChart.withSampleData();
  }


}

List<charts.Series> extrator(List<ExpenseAddition> rawData){
  List<ChartData> listaConvertida = [];
  for (ExpenseAddition x in rawData) {
    listaConvertida.add(new ChartData(
      Toolbox.select(x.type),
      double.tryParse(x.value),
    ));
  }
  return  [
    new charts.Series<ChartData, int>(
      id: 'Expenses',
      domainFn: (ChartData data, _) => data.type,
      measureFn: (ChartData data, _) =>data.value,
      data: listaConvertida,
    )
  ];
}

// ignore: camel_case_types
class pieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  const pieChart(this.seriesList, {this.animate});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new charts.PieChart(seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 60,
        arcRendererDecorators: [new charts.ArcLabelDecorator()]));
  }
}



class ChartData {
  final int type;
  final double value;

  ChartData(this.type, this.value);
}

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  DonutPieChart(this.seriesList, {this.animate});
  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 60));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}
/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
