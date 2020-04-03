import 'dart:core';
import 'package:mvvm/viewmodel/expenseaddition.viewmodel.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ExtractedData {
  List<ExpenseAddition> rawData;

  ExtractedData(this.rawData);

  List<charts.Series<ChartData, int>> graph() {
    return getData(rawData);
  }

}

List<charts.Series<ChartData, int>> getData(List<ExpenseAddition> rawData) {
  charts.Series<ChartData, int> chartDataList;
  var data = [];
  for (ExpenseAddition x in rawData) {
    data.add(new ChartData(
      select(x.type),
      double.parse(x.value),
    ));
  }
  chartDataList = new charts.Series<ChartData, int>(
    id: "Total",
    data: data,
    domainFn: (ChartData infos, _) => infos.type,
    measureFn: (ChartData infos, _) => infos.type,
  );
  List<charts.Series<ChartData, int>> saida;
  saida.add(chartDataList);
  return saida;
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
