import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:visionary/feature/prompt/repos/prompt_repo.dart';

part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(PromptInitial()) {
    on<PromptInitialEvent>(promptinitialEvent);
    on<PromptEnteredEvent>(promptEnteredEvent);
  }

  FutureOr<void> promptEnteredEvent(
    PromptEnteredEvent event,
    Emitter<PromptState> emit,
  ) async {
    emit(PromptGeneratingImageLoadState());
    Uint8List? bytes = await PromptRepo.generateImage(event.prompt);
    if (bytes != null) {
      emit(PromptGeneratingImageSuccessState(bytes));
    } else {
      emit(PromptGeneratingImageErrorState());
    }
  }

  FutureOr<void> promptinitialEvent(
    PromptInitialEvent event,
    Emitter<PromptState> emit,
  ) async {
    Uint8List bytes =
        await File(
          '/Users/apple/Flutter_projects/visionary/assets/image.avif',
        ).readAsBytes();
    emit(PromptGeneratingImageSuccessState(bytes));
  }
}
