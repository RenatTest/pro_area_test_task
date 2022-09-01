import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FactHistory extends StatefulWidget {
  @override
  _FactHistoryState createState() => _FactHistoryState();
}

class _FactHistoryState extends State<FactHistory> {
  Box<String> catBox;

  @override
  void initState() {
    super.initState();
    catBox = Hive.box<String>('cats');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: Text('Fact History'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ValueListenableBuilder(
          valueListenable: catBox.listenable(),
          builder: (context, Box<String> cats, _) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final value = cats.keys.toList()[index];
                  final key = cats.get(value);
                  return ListTile(
                    title: Text(value),
                    subtitle: Text(key),
                  );
                },
                separatorBuilder: (_, index) => Divider(),
                itemCount: cats.keys.toList().length);
          },
        ),
      ),
    );
  }
}
