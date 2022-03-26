import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _tarjimonController = TextEditingController();
final _javobController = TextEditingController();
dynamic title1 = 'English';
dynamic title2 = 'Uzbek';
dynamic en = 'en';
dynamic uz = 'uz';
bool sanagich = true;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  tarjima() {
    var translator = GoogleTranslator();
    translator.translate(_tarjimonController.text, from: (sanagich == true)? en : uz, to: (sanagich == true)? uz : en).then((t) {
      _javobController.text = t.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text((sanagich == true) ? title1 : title2),
            IconButton(
              onPressed: () {
                setState(() {
                  sanagich = !sanagich;
                });
              },
              icon: const FaIcon(FontAwesomeIcons.exchangeAlt),
            ),
            Text((sanagich == true) ? title2 : title1),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Type here..',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    controller: _tarjimonController,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                    maxLines: 8,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: _javobController.text));
                  },
                  icon: const Icon(Icons.copy),
                ),
                IconButton(
                  onPressed: () {
                    _tarjimonController.text = "";
                    _javobController.text = "";
                  },
                  icon: const Icon(Icons.clear),
                ),
                IconButton(
                  onPressed: tarjima,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.teal,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    enabled: false,
                    decoration: const InputDecoration(
                      hintText: 'Translate here..',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          color: Colors.teal,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    controller: _javobController,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                    maxLines: 8,
                  ),
                ),
              ),
            ),
            const Text(
              'Created by Tolibov Husan',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
