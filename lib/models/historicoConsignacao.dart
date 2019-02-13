// To parse this JSON data, do
//
//     final historicoConsignacao = historicoConsignacaoFromJson(jsonString);

import 'dart:convert';

List<HistoricoConsignacao> historicoConsignacaoFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<HistoricoConsignacao>.from(jsonData.map((x) => HistoricoConsignacao.fromJson(x)));
}

String historicoConsignacaoToJson(List<HistoricoConsignacao> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class HistoricoConsignacao {
  int codigoAde;
  int qtdePrestacao;
  int qtdePrestacaoPagas;
  String situacao;
  double valorPrestacao;

  HistoricoConsignacao({
    this.codigoAde,
    this.qtdePrestacao,
    this.qtdePrestacaoPagas,
    this.situacao,
    this.valorPrestacao,
  });

  factory HistoricoConsignacao.fromJson(Map<String, dynamic> json) => new HistoricoConsignacao(
    codigoAde: json["CodigoADE"],
    qtdePrestacao: json["QtdePrestacao"],
    qtdePrestacaoPagas: json["QtdePrestacaoPagas"],
    situacao: json["Situacao"],
    valorPrestacao: json["ValorPrestacao"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "CodigoADE": codigoAde,
    "QtdePrestacao": qtdePrestacao,
    "QtdePrestacaoPagas": qtdePrestacaoPagas,
    "Situacao": situacao,
    "ValorPrestacao": valorPrestacao,
  };
}
