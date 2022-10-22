import 'package:flutter/material.dart';
import 'package:double_bogey_flutter/screens/BookBoxPage/bookBoxPage.dart';

class EditBNPDatePickerWidget extends StatefulWidget {
  const EditBNPDatePickerWidget({Key? key, this.restorationId, required this.callback, required this.date}) : super(key: key);
  final String? restorationId;
  final Function callback;
  final DateTime date;
  @override
  State<EditBNPDatePickerWidget> createState() => _EditBNPDatePickerWidgetState();

}

class _EditBNPDatePickerWidgetState extends State<EditBNPDatePickerWidget>
    with RestorationMixin {
  late DateTime selectedDateValue;

  @override
  void initState() {
    selectedDateValue = widget.date;
    super.initState();
  }

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
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days:365)),
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
        Text(formatter.format(selectedDateValue)),
        const SizedBox(
          width: 10,
        ),
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