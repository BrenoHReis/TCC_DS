import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendario extends StatefulWidget {
  const Calendario({Key? key}) : super(key: key);

  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  DateTime _date = DateTime.now();
  bool _flag = true;

  Future<Null> _selectDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1947),
      lastDate: DateTime(2040),
    );

    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var dataformato = DateFormat('dd/MM/yyyy').format(_date);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dataformato // = DateFormat('dd/MM/yyyy').format(_date),
        ),
        actions: [
          GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.calendar_today_sharp,
                  size: 35,
                ),
              ),
              onTap: () {
                setState(() {
                  _selectDate(context);
                });
              }),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => setState(() =>_flag =!_flag),
              child: Text(_flag ? '09:00':'09:00'),
              style: ElevatedButton.styleFrom(
                primary: _flag ? Colors.green : Colors.red,
              ),
              
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onSurface: Colors.grey,
                elevation: 10,
              ),
              child: Text('10:00'),
              onPressed: () {
              },
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onSurface: Colors.grey,
                elevation: 10,
              ),
              child: Text('11:00'),
              onPressed: () {},
            ),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onSurface: Colors.grey,
                elevation: 10,
              ),
              child: Text('12:00'),
              onPressed: () {},
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
