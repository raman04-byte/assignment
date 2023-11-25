import 'package:assignment/features/event_detail/template/event_template.dart';
import 'package:flutter/material.dart';

class EventDetail extends StatefulWidget {
  final String id;
  const EventDetail({super.key, required this.id});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      body: SafeArea(
        child: EventTemplate(
          id: widget.id,
        ),
      ),
    );
  }
}
