// To parse this JSON data, do
//
//     final detalhesConsignacao = detalhesConsignacaoFromJson(jsonString);

import 'dart:convert';

List<DetalhesConsignacao> detalhesConsignacaoFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<DetalhesConsignacao>.from(jsonData.map((x) => DetalhesConsignacao.fromJson(x)));
}

String detalhesConsignacaoToJson(List<DetalhesConsignacao> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class DetalhesConsignacao {
  String nomeConsignataria;
  int qtdePrestacao;
  int qtdePrestacaoPagas;
  double valorLiberado;
  double valorPrestacao;
  double valorUltimoDesconto;

  DetalhesConsignacao({
    this.nomeConsignataria,
    this.qtdePrestacao,
    this.qtdePrestacaoPagas,
    this.valorLiberado,
    this.valorPrestacao,
    this.valorUltimoDesconto,
  });

  factory DetalhesConsignacao.fromJson(Map<String, dynamic> json) => new DetalhesConsignacao(
    nomeConsignataria: json["NomeConsignataria"],
    qtdePrestacao: json["QtdePrestacao"],
    qtdePrestacaoPagas: json["QtdePrestacaoPagas"],
    valorLiberado: json["ValorLiberado"].toDouble(),
    valorPrestacao: json["ValorPrestacao"].toDouble(),
    valorUltimoDesconto: json["ValorUltimoDesconto"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "NomeConsignataria": nomeConsignataria,
    "QtdePrestacao": qtdePrestacao,
    "QtdePrestacaoPagas": qtdePrestacaoPagas,
    "ValorLiberado": valorLiberado,
    "ValorPrestacao": valorPrestacao,
    "ValorUltimoDesconto": valorUltimoDesconto,
  };
}
