// To parse this JSON data, do
//
//     final holerit = holeritFromJson(jsonString);

import 'dart:convert';

List<Holerit> holeritFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Holerit>.from(jsonData.map((x) => Holerit.fromJson(x)));
}

String holeritToJson(List<Holerit> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Holerit {
  int anoCompetenci;
  double baseIns;
  double baseIrr;
  String carg;
  int idHolerit;
  int mesCompetenci;
  double salarioContratua;
  double totalDesconto;
  double totalVencimento;
  double valorLiquid;

  Holerit({
    this.anoCompetenci,
    this.baseIns,
    this.baseIrr,
    this.carg,
    this.idHolerit,
    this.mesCompetenci,
    this.salarioContratua,
    this.totalDesconto,
    this.totalVencimento,
    this.valorLiquid,
  });

  factory Holerit.fromJson(Map<String, dynamic> json) => new Holerit(
    anoCompetenci: json["ANO_COMPETENCI"],
    baseIns: json["BASE_INS"].toDouble(),
    baseIrr: json["BASE_IRR"].toDouble(),
    carg: json["CARG"],
    idHolerit: json["ID_HOLERIT_"],
    mesCompetenci: json["MES_COMPETENCI"],
    salarioContratua: json["SALARIO_CONTRATUA"].toDouble(),
    totalDesconto: json["TOTAL_DESCONTO"].toDouble(),
    totalVencimento: json["TOTAL_VENCIMENTO"].toDouble(),
    valorLiquid: json["VALOR_LIQUID"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "ANO_COMPETENCI": anoCompetenci,
    "BASE_INS": baseIns,
    "BASE_IRR": baseIrr,
    "CARG": carg,
    "ID_HOLERIT_": idHolerit,
    "MES_COMPETENCI": mesCompetenci,
    "SALARIO_CONTRATUA": salarioContratua,
    "TOTAL_DESCONTO": totalDesconto,
    "TOTAL_VENCIMENTO": totalVencimento,
    "VALOR_LIQUID": valorLiquid,
  };
}
