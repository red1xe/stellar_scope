import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../services/blue_marble_api.dart';

class BlueMarble extends StatefulWidget {
  static const routeName = "/bluemarble";
  const BlueMarble({super.key});

  @override
  State<BlueMarble> createState() => _BlueMarbleState();
}

class _BlueMarbleState extends State<BlueMarble> {
  DateTime _dateTime = DateTime.now();
  String url = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[820],
      appBar: AppBar(
        centerTitle: true,
        title: Text(DateFormat.yMMMEd().format(_dateTime)),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            Center(
                child: ElevatedButton.icon(
                    label: const Text("Pick a date"),
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                color: Colors.grey[800],
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: ScrollDatePicker(
                                  maximumDate: DateTime.now(),
                                  minimumDate: DateTime(2015),
                                  selectedDate: _dateTime,
                                  locale: const Locale(en),
                                  onDateTimeChanged: (DateTime value) {
                                    setState(() {
                                      _dateTime = value;
                                    });
                                  },
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  final date = DateFormat("yyyy-MM-dd")
                                      .format(_dateTime);
                                  final data =
                                      await BlueMarbleApi.getImage(date);
                                  setState(() {
                                    url =
                                        "https://epic.gsfc.nasa.gov/archive/enhanced/${DateFormat("yyyy/MM/dd").format(_dateTime)}/png/${data[0]["image"]}.png";
                                  });
                                },
                                child: const Text("Get Image"),
                              ),
                            ],
                          );
                        }))),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
