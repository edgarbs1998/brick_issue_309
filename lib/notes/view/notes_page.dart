import 'package:brick_issue_309/brick/data_repository.dart';
import 'package:brick_issue_309/l10n/l10n.dart';
import 'package:brick_issue_309/notes/notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotesCubit(
        dataRepository: context.read<DataRepository>(),
      )..testData(),
      child: const NotesView(),
    );
  }
}

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle)),
      body: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          if (state is NotesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.errorLabel)),
            );
          }
        },
        builder: (context, state) {
          if (state is NotesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NotesReady) {
            final data = state.data;

            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) => Text(data[index].text),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
