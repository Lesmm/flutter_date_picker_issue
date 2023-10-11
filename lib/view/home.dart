import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:flutter_date_picker_issue/app.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  ValueNotifier<String>? notifier;

  @override
  void initState() {
    super.initState();
    print('MyHomePageState initState');

    _initNotifier();
  }

  @override
  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('MyHomePageState didUpdateWidget ${oldWidget.hashCode} -> ${widget.hashCode}');

    _initNotifier();
  }

  @override
  void dispose() {
    super.dispose();
    print('MyHomePageState dispose');
  }

  void _initNotifier() {
    notifier = ValueNotifier('didUpdateWidget');
    notifier?.addListener(() {
      if (mounted) {
        setState(() {});
      } else {
        print('MyHomePageState not mounted!!!!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MyHomePageState rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rebuild Issue on DatePicker Showing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'selected time: ${notifier?.value}',
            ),
          ],
        ),
      ),
      floatingActionButton: DatePickerButton(notifier: notifier!),
    );
  }
}

class DatePickerButton extends StatefulWidget {
  DatePickerButton({super.key, required this.notifier});

  ValueNotifier notifier;

  @override
  State<DatePickerButton> createState() => DatePickerButtonState();
}

class DatePickerButtonState extends State<DatePickerButton> {
  @override
  void initState() {
    super.initState();
    print('DatePickerButtonState initState');
  }

  @override
  void didUpdateWidget(DatePickerButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('DatePickerButtonState didUpdateWidget ${oldWidget.hashCode} -> ${widget.hashCode}');
  }

  @override
  void dispose() {
    super.dispose();
    print('DatePickerButtonState dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('DatePickerButtonState rebuild');
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        Future.delayed(const Duration(seconds: 1), () {
          print('Do MyAppState.instance setState');
          AppState.instance.isChangedStructure = true;
          AppState.instance.setState(() {});
        });
        DatePicker.showDatePicker(
          context,
          minuteDivider: 1,
          maxDateTime: DateTime.now(),
          minDateTime: DateTime.now().add(const Duration(days: -365)),
          initialDateTime: DateTime.now(),
          locale: DateTimePickerLocale.zh_cn,
          pickerMode: DateTimePickerMode.datetime,
          onConfirm: (dateTime, selectedIndex) {
            //
            widget.notifier.value = dateTime.toString();
          },
          onCancel: () {
            //
          },
        );
      },
    );
  }
}
