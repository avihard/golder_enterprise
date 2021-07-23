import 'dart:io';
import 'package:flutter/material.dart';
import 'package:form/data/moor_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddEntry extends StatefulWidget {
  AddEntry({key}) : super(key: key);

  @override
  _AddEntryState createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  final ImagePicker _picker = ImagePicker();
  XFile? _cardImage;
  XFile? _signImage;

  String? _name;
  String? _contactNumber;
  String? _villageName;
  String? _districtName;
  var _cardString;
  var _signString;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _villageController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          _header(),
          _textField(_nameController, 'Name'),
          _textField(_contactController, 'Contact Number'),
          _textField(_villageController, 'Village Name'),
          _textField(_districtController, 'District Name'),
          _cardField(context, _cardImage),
          _signField(context, _signImage),
          _button(_cardString ?? '', _signString ?? '')
        ]),
      ),
    ));
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Center(
        child: Text(
          'Entry Form',
          style: TextStyle(fontSize: 30, color: Colors.orangeAccent),
        ),
      ),
    );
  }

  Widget _textField(TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        controller: controller,
        cursorColor: Colors.deepOrange,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }

  Widget _cardField(BuildContext context, XFile? image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white),
        child: GestureDetector(
          onTap: () => _showPicker(context, true),
          child: Container(
            child: image != null
                ? Image.file(
                    File(image.path),
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  )
                : Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/card.png')),
          ),
        ),
      ),
    );
  }

  Widget _signField(BuildContext context, XFile? image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white),
        child: GestureDetector(
          onTap: () => _showPicker(context, false),
          child: Container(
            child: image != null
                ? Image.file(
                    File(image.path),
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  )
                : Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/sign.png')),
          ),
        ),
      ),
    );
  }

  void _showPicker(context, bool card) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () async {
                        try {
                          XFile? image = await _picker.pickImage(
                              source: ImageSource.gallery, imageQuality: 50);
                          if (card) {
                            _cardImage = image;
                            _cardString = await _cardImage!.readAsBytes();
                            setState(() {});
                          } else {
                            _signImage = image;
                            _signString = await _signImage!.readAsBytes();
                            setState(() {});
                          }
                        } catch (e) {
                          print(e);
                        }

                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () async {
                      try {
                        final XFile? image =
                            await _picker.pickImage(source: ImageSource.camera);
                        if (card) {
                          _cardImage = image;
                          _cardString = await _cardImage!.readAsBytes();
                          setState(() {});
                        } else {
                          _signImage = image;
                          _signString = await _signImage!.readAsBytes();
                          setState(() {});
                        }
                      } catch (e) {
                        print(e);
                      }

                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _button(var cardImage, var signImage) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MaterialButton(
        onPressed: () async {
          _name = _nameController.text;
          _contactNumber = _contactController.text;
          _villageName = _villageController.text;
          _districtName = _districtController.text;

//           String s = new String.fromCharCodes(inputAsUint8List);
// var outputAsUint8List = new Uint8List.fromList(s.codeUnits);

          String card = String.fromCharCodes(cardImage);
          String sign = String.fromCharCodes(signImage);

          final database = Provider.of<AppDatabase>(context, listen: false);

          if (_name != null &&
              _contactNumber != null &&
              _villageName != null &&
              _districtName != null &&
              cardImage != '' &&
              signImage != '') {
            database.addEntry(TasksCompanion.insert(
                name: _name ?? '',
                contactNumber: _contactNumber ?? '',
                villageName: _villageName ?? '',
                districtName: _districtName ?? '',
                identityProof: card,
                signature: sign));

            _contactController.clear();
            _nameController.clear();
            _villageController.clear();
            _districtController.clear();
            cardImage = null;
            signImage = null;
            _cardImage = null;
            _signImage = null;

            Navigator.pop(context);
          }
        },
        height: 50,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(
            'Submit',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
