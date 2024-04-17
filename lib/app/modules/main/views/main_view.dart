import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pipd/app/modules/fioa/views/fioa_view.dart';
import 'package:pipd/app/modules/historyJson/views/history_json_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 206, 148),
        title: Center(
          child: Image.asset(
            'assets/images/yar.png',
            height: AppBar().preferredSize.height - 10,
          ),
        ),
        actions: [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FIOA()),
                );
              },
              child: Text('Тестирование'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryJson()),
                );
              },
              child: Text('История тестирования'),
            ),
          ],
        ),
      ),
    );
  }
}
