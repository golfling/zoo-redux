import 'package:zoo_redux/logic/model.dart';

class ApplicationState {
  final DataState<Animal> animalsState;
  final DataState<Animal> temporaryState;

  ApplicationState({
    required this.animalsState,
    required this.temporaryState,
  });

  factory ApplicationState.initial() {
    return ApplicationState(
      animalsState: DataState<Animal>.initial(),
      temporaryState: DataState<Animal>.initial(),
    );
  }

  ApplicationState copyWith({
    DataState<Animal>? animalsState,
    DataState<Animal>? temporaryState,
  }) {
    return ApplicationState(
      animalsState: animalsState ?? this.animalsState,
      temporaryState: temporaryState ?? this.temporaryState,
    );
  }
}

class DataState<T> {
  final Map<int, T> data;
  final String? errorMessage;
  final bool isLoading;

  factory DataState.initial() {
    return DataState(
      {},
      null,
      false,
    );
  }

  DataState(
    this.data,
    this.errorMessage,
    this.isLoading,
  );

  DataState<T> copyWith({
    Map<int, T>? data,
    String? errorMessage,
    bool? isLoading,
  }) {
    return DataState<T>(
      data ?? this.data,
      data != null ? null : errorMessage ?? this.errorMessage,
      isLoading ?? this.isLoading,
    );
  }
}
