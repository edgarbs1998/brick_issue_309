part of 'notes_cubit.dart';

abstract class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];
}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesReady extends NotesState {
  const NotesReady({
    required this.data,
  });

  final List<Note> data;

  @override
  List<Object> get props => [data];
}

class NotesError extends NotesState {}
