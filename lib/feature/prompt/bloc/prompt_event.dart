part of 'prompt_bloc.dart';

@immutable
sealed class PromptEvent {}

class PromptInitialEvent extends PromptEvent {}

class PromptEnteredEvent extends PromptEvent {
  String prompt;

  PromptEnteredEvent(this.prompt);
}
