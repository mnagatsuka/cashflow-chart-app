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

// リスト追加画面用Widget
class DataAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('収支登録'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '本日の収支を登録してください'
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: '日付',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: '収入',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: '支出',
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
            const SizedBox(height: 8),
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
                          return DataListPage(title: '収支一覧');
                        }),
                      );
                    },
                    child: Text(
                      '収支一覧', style: TextStyle(color: Colors.white)
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
                      '資金繰り表', style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ]
            )
          ],
        ),
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
              '資金繰り表',
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
                    label: Text('前月繰越'),
                  ),
                  DataColumn(
                    label: Text('収入'),
                  ),
                  DataColumn(
                    label: Text('支出'),
                  ),
                  DataColumn(
                    label: Text('収支'),
                  ),
                  DataColumn(
                    label: Text('翌月繰越'),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('20220901')),
                      DataCell(Text('1000')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
                      DataCell(Text('10')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220902')),
                      DataCell(Text('1000')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
                      DataCell(Text('10')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220903')),
                      DataCell(Text('1000')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
                      DataCell(Text('10')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220904')),
                      DataCell(Text('1000')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
                      DataCell(Text('10')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220905')),
                      DataCell(Text('1000')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
                      DataCell(Text('10')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220906')),
                      DataCell(Text('1000')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
                      DataCell(Text('10')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('20220907')),
                      DataCell(Text('1000')),
                      DataCell(Text('100')),
                      DataCell(Text('10')),
                      DataCell(Text('90')),
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
                          return DataListPage(title: '収支一覧');
                        }),
                      );
                    },
                    child: Text(
                      '収支一覧', style: TextStyle(color: Colors.white)
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
              ]
            )
          ],
        ),
      ),
    );
  }
}