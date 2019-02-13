import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:util_data_table_package/models/detalhesConsignacao.dart';
import 'package:util_data_table_package/models/historicoConsignacao.dart';

class UtilDataTable extends StatefulWidget {
  //cabecalhos e alias devem ter a mesma qtd de colunas
  UtilDataTable({Key key, this.url, this.listaReturn,this.cabecalhos,this.alias}) : super(key: key);
  final String url;
  final List<dynamic> listaReturn;
  final List<String> cabecalhos;
  final List<String> alias;

  @override
  _UtilDataTableState createState() => _UtilDataTableState();
}

class _UtilDataTableState extends State<UtilDataTable> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getList(widget.url, widget.listaReturn),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
              child: Center(child: new CircularProgressIndicator()));
        } else {
          return DataTable(
              //sortColumnIndex: 0,
              //onSelectAll: (b) {},
              columns: _createColumns(widget.alias),
              rows: _createRows(snapshot));
        }
      },
      // Container
    );
  }

  Future<List<dynamic>> _getList(String url , List<dynamic> lista) async {
    var data =
    await http.get(url);
    var jsonData = json.decode(data.body);
    dynamic obj;
    for (var u in jsonData) {
      if (lista is List<HistoricoConsignacao>) {
        obj = HistoricoConsignacao.fromJson(u);
      }else if (lista is List<DetalhesConsignacao>) {
        obj = DetalhesConsignacao.fromJson(u);
      }

      lista.add(obj);
    }
    return lista;
  }

  List<DataCell> _createCells(dynamic d) {
    List<DataCell> listaDataCell = new List<DataCell>();

    for(var i = 0; i < widget.cabecalhos.length; i++){
      var dataCell = DataCell(
        Text("${d.toJson()[ widget.cabecalhos[i]]}",),
        showEditIcon: false,
        placeholder: false,
      );

      listaDataCell.add(dataCell);
    }
    print("length ${listaDataCell.length}");

    return listaDataCell;
  }

  List<DataRow> _createRows(AsyncSnapshot snapshot) {
    List<DataRow> newList = snapshot.data.map<DataRow>((h) {
      return new DataRow(cells: _createCells(h));
    }).toList();

    return newList;
  }

  List<DataColumn> _createColumns(List<String> alias) {

    List<DataColumn> listaColumn = new List<DataColumn>();
    for (var u in alias) {
      var dataColumn = DataColumn(
          label: Text(
            u,
            style: TextStyle( fontWeight: FontWeight.bold, fontSize: 15),
          ),
          numeric: true,
          onSort: (i, b) {},
          tooltip: u);
      listaColumn.add(dataColumn);
    }

    return listaColumn;
  }
}
