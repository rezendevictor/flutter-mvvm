class ExpenseModel {
  String title;
  String data;
  String value;
  String type;
  String registered;
  String whereFrom;

  ExpenseModel(
      {this.title,
        this.data,
        this.value,
        this.type,
        this.registered,
        this.whereFrom});

  ExpenseModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    data = json['data'];
    value = json['value'];
    type = json['type'];
    registered = json['registered'];
    whereFrom = json['where_from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['data'] = this.data;
    data['value'] = this.value;
    data['type'] = this.type;
    data['registered'] = this.registered;
    data['where_from'] = this.whereFrom;
    return data;
  }
}