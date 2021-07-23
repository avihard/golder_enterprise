import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form/screen/add_entry.dart';
import 'package:form/data/moor_database.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _flotingButton(),
      appBar: _appBar(),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: _buildEntryList(context),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Text(
        'GOLDEN ENTERPRISE',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      actions: [
        IconButton(
            onPressed: () async {
              final database = Provider.of<AppDatabase>(context, listen: false);
              var data = await database.getAllTask();
              print(data.length);
              data.forEach((element) async {
                await database.deleteTask(element);
              });
            },
            icon: Icon(Icons.delete, color: Colors.white,))
      ],
    );
  }

  Widget _flotingButton() {
    return FloatingActionButton(
      backgroundColor: Colors.orangeAccent,
      child: Icon(
        Icons.add,
        size: 50,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddEntry()));
      },
    );
  }

  StreamBuilder<List<Task>> _buildEntryList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
        stream: database.watchAllTask(),
        builder: (context, AsyncSnapshot<List<Task>> snapshot) {
          final tasks = snapshot.data ?? [];

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (_, index) {
              final itemTask = tasks[index];
              var cardData =
                  new Uint8List.fromList(itemTask.identityProof.codeUnits);
              var signData =
                  new Uint8List.fromList(itemTask.signature.codeUnits);
              return _buildListItem(itemTask, database, cardData, signData);
            },
          );
        });
  }

  Widget _buildListItem(
      Task itemTask, AppDatabase database, Uint8List card, Uint8List sign) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        child: ListTile(
          leading: Text(itemTask.name),
          title: Container(height: 100, width: 200, child: Image.memory(card)),
          trailing: Container(
            height: 100,
            width: 200,
            child: Image.memory(sign),
          ),
        ),
      ),
    );
  }

  Future<void> _createExcel() async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText('Name');
    sheet.getRangeByName('B1').setText('Contact Number');
    sheet.getRangeByName('C1').setText('Village Name');
    sheet.getRangeByName('D1').setText('District Name');
    sheet.getRangeByName('E1').setText('Identity Photo');
    sheet.getRangeByName('F1').setText('Signature');
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName = '$path/data.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);
  }
}
