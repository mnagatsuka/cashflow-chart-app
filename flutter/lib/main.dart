import 'package:flutter/material.dart';
import './dataAdd.dart';
import './cashFlow.dart';

void main() {
  runApp(const CashFlowApp());
}

class CashFlowApp extends StatelessWidget {
  const CashFlowApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '資金繰り表アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DataListPage(title: '収支一覧'),
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
              '収支一覧',
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
                    label: Text('日付'),
                  ),
                  DataColumn(
                    label: Text('収入'),
                  ),
                  DataColumn(
                    label: Text('支出'),
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
                      '収支登録', style: TextStyle(color: Colors.white)
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
                          return CashFlowPage(title: '資金繰り表');
                        }),
                      );
                    },
                    child: Text(
                      '資金繰り表', style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}

