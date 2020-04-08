import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:mvvm/viewmodel/expenseaddition.viewmodel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ExtractedData extends StatelessWidget {
  final List<ExpenseAddition> rawData;
  ExtractedData(this.rawData);

  @override
  Widget build(BuildContext context) {
    return pieChart(Extrator(rawData));
  }


}

List<charts.Series> Extrator(List<ExpenseAddition> rawData){
  List<ChartData> listaConvertida = [];
  for (ExpenseAddition x in rawData) {
    listaConvertida.add(new ChartData(
      select(x.type),
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
  ];;
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

int select(String categor) {
  if (categor == "NECESSIDADES") {
    return 1;
  } else if (categor == "QUERERES") {
    return 2;
  } else {
    return 3;
  }
}

class ChartData {
  final int type;
  final double value;

  ChartData(this.type, this.value);
}
