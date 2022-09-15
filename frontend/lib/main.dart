import 'package:flutter/material.dart';

void main() {
  runApp(const CashFlowApp());
}

class CashFlowApp extends StatelessWidget {
  const CashFlowApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cash Flow App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DataListPage(title: 'Revenue and Expenditure List'),
    );
  }
}

class DataListPage extends StatefulWidget {
  const DataListPage({super.key, required this.title});
  final String title;

  @override
  State<DataListPage> createState() => _DataListPageState();
}

class _DataListPageState extends State<DataListPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Revenue and Expenditure Table',
            ),
            //Text(
            //  '$_counter',
            //  style: Theme.of(context).textTheme.headline4,
            //),
            Container(
              width: 700,
              height: 500,
              child:
                DataTable(
                columns: [
                  DataColumn(
                    label: Text('Date'),
                  ),
                  DataColumn(
                    label: Text('Revenue'),
                  ),
                  DataColumn(
                    label: Text('Expediture'),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('20220901')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220902')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220903')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220904')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220905')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220906')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220907')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  // 横幅いっぱいに広げる
                  // width: double.infinity,
                  // リスト追加ボタン
                  child: ElevatedButton(
                    onPressed: () {
                      // "push"で新規画面に遷移
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          // 遷移先の画面としてリスト追加画面を指定
                          return DataAddPage();
                        }),
                      );
                    },
                    child: Text(
                      'Add Data Page', style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  // 横幅いっぱいに広げる
                  // width: double.infinity,
                  // リスト追加ボタン
                  child: ElevatedButton(
                    onPressed: () {
                      // "push"で新規画面に遷移
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          // 遷移先の画面としてリスト追加画面を指定
                          return CashFlowPage(title: 'Cash Flow');
                        }),
                      );
                    },
                    child: Text(
                      'Cash Flow Page', style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
              ]
            )
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //  onPressed: _incrementCounter,
      //  tooltip: 'Increment',
      //  child: const Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // "push"で新規画面に遷移
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return DataAddPage();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// リスト追加画面用Widget
class DataAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Revenue and Expenditure Add'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Input Today\'s Revenue and Expenditure'
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Revenue',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Expenditure',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              // 横幅いっぱいに広げる
              // width: double.infinity,
              // リスト追加ボタン
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'リスト追加', style: TextStyle(color: Colors.white)
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
      // ボタンをクリックした時の処理
        onPressed: () {
        // "pop"で前の画面に戻る
          Navigator.of(context).pop();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CashFlowPage extends StatefulWidget {
  const CashFlowPage({super.key, required this.title});
  final String title;

  @override
  State<CashFlowPage> createState() => _CashFlowPageState();
}

class _CashFlowPageState extends State<CashFlowPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Cash Flow Table',
            ),
            //Text(
            //  '$_counter',
            //  style: Theme.of(context).textTheme.headline4,
            //),
            Container(
              width: 700,
              height: 500,
              child:
                DataTable(
                columns: [
                  DataColumn(
                    label: Text('Date'),
                  ),
                  DataColumn(
                    label: Text('Revenue'),
                  ),
                  DataColumn(
                    label: Text('Expediture'),
                  ),
                  DataColumn(
                    label: Text('Profit'),
                  ),
                  DataColumn(
                    label: Text('Profit'),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('20220901')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220902')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220903')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220904')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220905')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220906')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220907')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  // 横幅いっぱいに広げる
                  // width: double.infinity,
                  // リスト追加ボタン
                  child: ElevatedButton(
                    onPressed: () {
                      // "push"で新規画面に遷移
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          // 遷移先の画面としてリスト追加画面を指定
                          return DataListPage(title: 'Revenue and Expenditure List');
                        }),
                      );
                    },
                    child: Text(
                      'Cash Flow Page', style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
                Container(
                  // 横幅いっぱいに広げる
                  // width: double.infinity,
                  // リスト追加ボタン
                  child: ElevatedButton(
                    onPressed: () {
                      // "push"で新規画面に遷移
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          // 遷移先の画面としてリスト追加画面を指定
                          return DataAddPage();
                        }),
                      );
                    },
                    child: Text(
                      'Add Data Page', style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ]
            )
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //  onPressed: _incrementCounter,
      //  tooltip: 'Increment',
      //  child: const Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // "push"で新規画面に遷移
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return DataAddPage();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}