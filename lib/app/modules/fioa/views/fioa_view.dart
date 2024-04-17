import 'package:flutter/material.dart';
import 'package:pipd/app/data/data.dart';
import 'package:pipd/app/modules/historyJson/views/history_json_view.dart';
import 'package:pipd/app/services/services.dart';
import 'package:pipd/widgets/widget.dart';

class FIOA extends StatefulWidget {
  const FIOA({Key? key}) : super(key: key);

  @override
  _FIOAState createState() => _FIOAState();
}

class _FIOAState extends State<FIOA> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _ageController = TextEditingController();

  final DataService _dataService = DataService();

  Future<void> _saveDataToJson() async {
    final userData = UserData(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      middleName: _middleNameController.text,
      age: int.parse(_ageController.text),
    );

    await _dataService.saveUserData(userData);
  }

  Future<void> _viewData() async {
    String? jsonData = await _dataService.readUserData();
    if (jsonData != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('JSON данные'),
            content: SingleChildScrollView(
              child: Text(jsonData),
            ),
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

  void _navigateToHistoryJson() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryJson()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Сохранить в JSON'),
      ),
      body: DataForm(
        firstNameController: _firstNameController,
        lastNameController: _lastNameController,
        middleNameController: _middleNameController,
        ageController: _ageController,
        onSave: _saveDataToJson,
        onViewData: _viewData,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToHistoryJson, // обновленный вызов метода
        child: Icon(Icons.list),
      ),
    );
  }
}
