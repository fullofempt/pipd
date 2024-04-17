// widgets.dart

// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

class DataForm extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController middleNameController;
  final TextEditingController ageController;
  final VoidCallback onSave;
  final VoidCallback onViewData;

  const DataForm({
    Key? key,
    required this.firstNameController,
    required this.lastNameController,
    required this.middleNameController,
    required this.ageController,
    required this.onSave,
    required this.onViewData,
  }) : super(key: key);

  @override
  _DataFormState createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> {
  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите возраст';
    }
    final age = int.tryParse(value);
    if (age == null || age <= 0) {
      return 'Некорректный возраст';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: widget.firstNameController,
              decoration: InputDecoration(labelText: 'Имя'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: widget.middleNameController,
              decoration: InputDecoration(labelText: 'Отчество'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: widget.lastNameController,
              decoration: InputDecoration(labelText: 'Фамилия'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: widget.ageController,
              decoration: InputDecoration(labelText: 'Возраст'),
              keyboardType: TextInputType.number,
              validator: validateAge,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: widget.onSave,
              child: Text('Сохранить в JSON'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: widget.onViewData,
              child: Text('Просмотреть JSON данные'),
            ),
          ],
        ),
      ),
    );
  }
}
