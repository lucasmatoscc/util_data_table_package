// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';

List<Usuario> usuariosFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Usuario>.from(jsonData.map((x) => Usuario.fromJson(x)));
}

Usuario usuarioFromJson(String str) {
  final jsonData = json.decode(str);
  return Usuario.fromJson(jsonData);
}

String usuarioToJson(List<Usuario> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Usuario {
  String codigoMatricula;
  String dataAtualizacao;
  int idOrgao;
  double valorSaldo;
  String cdCpf;
  String email;
  String idGrupo;
  int idServico;
  String nmUsuario;
  dynamic tpAcesso;

  Usuario({
    this.codigoMatricula,
    this.dataAtualizacao,
    this.idOrgao,
    this.valorSaldo,
    this.cdCpf,
    this.email,
    this.idGrupo,
    this.idServico,
    this.nmUsuario,
    this.tpAcesso,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => new Usuario(
    codigoMatricula: json["CodigoMatricula"],
    dataAtualizacao: json["DataAtualizacao"],
    idOrgao: json["ID_ORGAO"],
    valorSaldo: json["ValorSaldo"].toDouble(),
    cdCpf: json["cd_cpf"],
    email: json["email"],
    idGrupo: json["id_grupo"],
    idServico: json["id_servico_"],
    nmUsuario: json["nm_usuario"],
    tpAcesso: json["tp_acesso_"],
  );

  Map<String, dynamic> toJson() => {
    "CodigoMatricula": codigoMatricula,
    "DataAtualizacao": dataAtualizacao,
    "ID_ORGAO": idOrgao,
    "ValorSaldo": valorSaldo,
    "cd_cpf": cdCpf,
    "email": email,
    "id_grupo": idGrupo,
    "id_servico_": idServico,
    "nm_usuario": nmUsuario,
    "tp_acesso_": tpAcesso,
  };
}
