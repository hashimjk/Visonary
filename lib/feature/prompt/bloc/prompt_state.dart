part of 'prompt_bloc.dart';

@immutable
sealed class PromptState {}

final class PromptInitial extends PromptState {}

final class PromptGeneratingImageLoadState extends PromptState {}

final class PromptGeneratingImageSuccessState extends PromptState {
  final Uint8List byte;

  PromptGeneratingImageSuccessState(this.byte);
}

final class PromptGeneratingImageErrorState extends PromptState {}
