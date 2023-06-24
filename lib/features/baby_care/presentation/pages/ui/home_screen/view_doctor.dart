import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/doctor_entity.dart';
import '../../../cubit/appointment/appointment_cubit.dart';
import 'home_page.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../common/commons.dart';
import '../../../../../../common/widgets/button.dart';
import '../../../../domain/entities/mother_entity.dart';

import '../../../../../../common/utils.dart';

class ViewDoctor extends StatefulWidget {
  const ViewDoctor({
    Key? key,
    required this.currentMother,
    required this.selectedLocation,
    required this.selectedDoctor,
    required this.selectedHospital,
  }) : super(key: key);
  final MotherEntity currentMother;
  final String selectedLocation;
  final DoctorEntity selectedDoctor;
  final String selectedHospital;

  @override
  State<ViewDoctor> createState() => _ViewDoctorState();
}

class _ViewDoctorState extends State<ViewDoctor> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: const Text(
          'View Doctor',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: BlocConsumer<AppointmentCubit, AppointmentState>(
        listener: (context, state) {
          if (state is AppointmentSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => HomePage(
                          uid: widget.currentMother.motherId,
                        )));
          }
        },
        builder: (context, state) {
          if (state is AppointmentLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Image.asset('assets/Avatar.png'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.selectedDoctor.name,
                      style: headerText.copyWith(
                          fontSize: 22, color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.selectedDoctor.phoneNumber,
                      style: normalText.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '4.7',
                          style: headerText.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        widget.selectedDoctor.location,
                                        style: headerText.copyWith(
                                            fontSize: 14, color: Colors.black),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Location',
                                    style: normalText,
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 2,
                              height: 90,
                              color: lightPrimaryColor.withOpacity(0.2),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.light_mode),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${widget.selectedDoctor.yearsOfExperience} Years',
                                        style: headerText.copyWith(
                                            fontSize: 14, color: Colors.black),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Experience',
                                    style: normalText,
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TableEventsExample())),
                        child: Text(
                          'Book Appointment Date',
                          style: headerText.copyWith(
                              color: Color(0xff222B45), fontSize: 15),
                        )),
                    TableCalendar<Event>(
                      firstDay: kFirstDay,
                      lastDay: kLastDay,
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      rangeStartDay: _rangeStart,
                      rangeEndDay: _rangeEnd,
                      calendarFormat: _calendarFormat,
                      rangeSelectionMode: _rangeSelectionMode,
                      eventLoader: _getEventsForDay,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      calendarStyle: CalendarStyle(
                        // Use `CalendarStyle` to customize the UI
                        outsideDaysVisible: false,
                      ),
                      onDaySelected: _onDaySelected,
                      onRangeSelected: _onRangeSelected,
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    ValueListenableBuilder<List<Event>>(
                      valueListenable: _selectedEvents,
                      builder: (context, value, _) {
                        return GridView.builder(
                          shrinkWrap: true,
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 5.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(style: BorderStyle.none),
                                  borderRadius: BorderRadius.circular(2.0),
                                  shape: BoxShape.rectangle),
                              child: InkWell(
                                onTap: () => print('${value[index]}'),
                                child: Container(
                                  color: primaryColor.withOpacity(0.08),
                                  height: 1,
                                  child: Center(
                                      child: Text(
                                    '13:00 AM',
                                    style: headerText.copyWith(fontSize: 16),
                                  )),
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            //crossAxisSpacing: 0.0,
                            mainAxisSpacing: 5.0,
                            //childAspectRatio: 1.0, // Adjust the aspect ratio as needed
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ButtonWidget(
                        text: 'Book Appointment ',
                        press: () {
                          // return Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const KnowledgeCenter()));
                          BlocProvider.of<AppointmentCubit>(context)
                              .bookAppointment(
                            // Line below is where to send Timestamp to firestore
                            appointmentDateandTime:
                                Timestamp.fromDate(_selectedDay!),
                            doctorId: widget.selectedDoctor.doctorId,
                            motherId: widget.currentMother.motherId,
                            location: widget.selectedLocation,
                            hospital: widget.selectedHospital,
                            motherName: widget.currentMother.name,
                            doctorName: widget.selectedDoctor.name,
                          );
                        },
                        BackgroundColor: primaryColor,
                        radius: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

class TableEventsExample extends StatefulWidget {
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Events'),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return GridView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(2.0),
                          shape: BoxShape.rectangle),
                      child: InkWell(
                        onTap: () => print('${value[index]}'),
                        child: Container(
                          color: primaryColor.withOpacity(0.08),
                          height: 1,
                          child: Center(
                              child: Text(
                            '13:00 AM',
                            style: headerText.copyWith(fontSize: 16),
                          )),
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    //crossAxisSpacing: 0.0,
                    mainAxisSpacing: 5.0,
                    //childAspectRatio: 1.0, // Adjust the aspect ratio as needed
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
