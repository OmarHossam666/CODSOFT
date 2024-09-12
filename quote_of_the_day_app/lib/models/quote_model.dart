class QuoteModel {
  String? q;
  String? a;
  String? c;
  String? h;

  QuoteModel({this.q, this.a, this.c, this.h});

  QuoteModel.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    a = json['a'];
    c = json['c'];
    h = json['h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['q'] = q;
    data['a'] = a;
    data['c'] = c;
    data['h'] = h;

    return data;
  }
}
