import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:brick_issue_309/brick/data_repository.dart';
import 'package:brick_issue_309/notes/model/note.model.dart';
import 'package:equatable/equatable.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit({
    required this.dataRepository,
  }) : super(NotesInitial());

  final DataRepository dataRepository;

  Future<void> testData() async {
    emit(NotesLoading());

    try {
      await dataRepository.initialize();

      final note1 = Note(text: 'Hello, world!');
      await dataRepository.upsert<Note>(note1);

      final note2 = Note(text: 'Some random test...');
      await dataRepository.upsert<Note>(note2);

      final data = await dataRepository.get<Note>();

      emit(NotesReady(data: data));
    } catch (e) {
      log(e.toString());

      emit(NotesError());
    }
  }
}
