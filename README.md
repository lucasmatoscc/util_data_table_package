# util_data_table_package


Para gerar o DataTable utilizado a classe utilDataTable.dart é só instanciar a classe da seguinte forma:

``` Dart
List<Cliente> listaRetorno = new List<Cliente>(); //instância da classe que você quer que retorne
```

cabecalhos e alias devem ter a mesma qtd de colunas
``` Dart
List<String> cabecalhos = ["IdCliente", "NomeCliente"]; //campos do seu model, o nome tem que ser o mesmo do atributo json
List<String> alias = ["Código do Cliente", "Nome do Cliente"]; //como vai ser exibido no header
```

caminho do seu serviço
``` Dart
String url = 'http://teste.com.br/service/param'; 
```

Instanciando
``` Dart
UtilDataTable(alias: alias,cabecalhos: cabecalhos,listaReturn: listaRetorno,url: url)
```


* Responsável pela chamada do serviço
* Retorno da lista baseado na url e instância da classe listaRetorno
* chamada para criação de colunas e linhas
``` Dart
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
```




Cria os nomes de exibição das colunas baseado na quantidade de alias
``` Dart
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
```

Cria linhas baseado na quantidade de dados retornados da solicitação http.get(url)
``` Dart
List<DataRow> _createRows(AsyncSnapshot snapshot) {
    List<DataRow> newList = snapshot.data.map<DataRow>((h) {
      return new DataRow(cells: _createCells(h));
    }).toList();

    return newList;
  }
```

Cria cells baseado na quantidade de cabecalhos, e mostra os dados para a exibição
``` Dart
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
```
