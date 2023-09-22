import 'package:assignment/features/event_detail/template/event_template.dart';
import 'package:flutter/material.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({super.key});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFffffff),
      body: SafeArea(
        child: EventTemplate(),
      ),
    );
  }
}