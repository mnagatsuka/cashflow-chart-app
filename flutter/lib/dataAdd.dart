import 'package:flutter/material.dart';
import './main.dart';
import './cashFlow.dart';


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