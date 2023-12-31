// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/services/journal_services.dart';

import '../../helpers/weekday.dart';
import '../../models/journal.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  final TextEditingController _contentController = TextEditingController();

  AddJournalScreen({
    Key? key,
    required this.journal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          WeekDay(journal.createdAt).toString(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              registerJournal(context);
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _contentController,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 24),
          expands: true,
          minLines: null,
          maxLines: null,
        ),
      ),
    );
  }

  registerJournal(BuildContext context) {
    String content = _contentController.text;

    journal.content = content;

    JournalService service = JournalService();
    service.register(journal).then((value) {
      Navigator.pop(context, value);
    });
  }
}
