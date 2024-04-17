import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pipd/app/data/data.dart';
import 'package:pipd/app/services/services.dart';

class HistoryJson extends StatefulWidget {
  const HistoryJson({Key? key}) : super(key: key);

  @override
  _HistoryJsonState createState() => _HistoryJsonState();
}

class _HistoryJsonState extends State<HistoryJson> {
  final DataService _dataService = DataService();
  late List<UserData> _userDataList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    String? jsonData = await _dataService.readUserData();
    if (jsonData != null) {
      List<dynamic> jsonList = jsonDecode(jsonData) as List<dynamic>;
      List<UserData> dataList = jsonList.map((json) => UserData.fromJson(json)).toList();
      setState(() {
        _userDataList = dataList;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Ошибка'),
            content: Text('Не удалось прочитать данные'),
            actions: <Widget>[
              TextButton(
                child: Text('Закрыть'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('История данных'),
      ),
      body: ListView.builder(
        itemCount: _userDataList.length,
        itemBuilder: (context, index) {
          final userData = _userDataList[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('${userData.lastName} ${userData.firstName} ${userData.middleName}'),
              subtitle: Text('Возраст: ${userData.age}'),
            ),
          );
        },
      ),
    );
  }
}
