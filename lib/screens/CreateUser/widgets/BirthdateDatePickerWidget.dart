import 'package:flutter/material.dart';
import 'package:double_bogey_flutter/screens/BookBoxPage/bookBoxPage.dart';

class BirthdateDatePickerWidget extends StatefulWidget {
  const BirthdateDatePickerWidget({Key? key, this.restorationId, required this.callback}) : super(key: key);
  final String? restorationId;
  final Function callback;
  @override
  State<BirthdateDatePickerWidget> createState() => _DatePickerWidgetState();

}

class _DatePickerWidgetState extends State<BirthdateDatePickerWidget>
    with RestorationMixin {
  DateTime selectedDateValue = DateTime(DateTime.now().year - 16, DateTime.now().month, DateTime.now().day-1 );

  @override
  String? get restorationId => widget.restorationId;
  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
  RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(BuildContext context,
      Object? arguments,) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime(DateTime.now().year - 16, DateTime.now().month, DateTime.now().day-1 ),
          firstDate: DateTime(1900),
          lastDate: DateTime(DateTime.now().year - 16, DateTime.now().month, DateTime.now().day ),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        selectedDateValue = newSelectedDate;
        _selectedDate.value = newSelectedDate;
        widget.callback(selectedDateValue.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 115,),
        Text(formatter.format(selectedDateValue),style: const TextStyle(color: Colors.white, fontSize: 20),),
        const SizedBox(width: 40,),
        OutlinedButton(
          onPressed: () {
            _restorableDatePickerRouteFuture.present();
          },
          child: const Icon(Icons.date_range),
        ),
      ],
    );
  }
}