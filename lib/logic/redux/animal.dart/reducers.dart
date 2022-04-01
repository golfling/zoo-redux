import 'package:redux/redux.dart';
import 'package:zoo_redux/logic/model.dart';
import 'package:zoo_redux/logic/redux/animal.dart/actions.dart';
import 'package:zoo_redux/logic/redux/app_state.dart';

final animalReducer = combineReducers<DataState<Animal>>([
  TypedReducer<DataState<Animal>, LoadAnimalAction>(onAnimalLoading),
  TypedReducer<DataState<Animal>, LoadAnimalSucceededAction>(onAnimalLoaded),
  TypedReducer<DataState<Animal>, LoadAnimalFailedAction>(onAnimalLoadFailure),
]);

DataState<Animal> onAnimalLoading(
  DataState<Animal> state,
  LoadAnimalAction action,
) {
  if (state.data.isNotEmpty) {
    state.data.clear();
  }
  return state.copyWith(isLoading: true);
}

DataState<Animal> onAnimalLoaded(
  DataState<Animal> state,
  LoadAnimalSucceededAction action,
) {
  final animals = Map<int, Animal>.from(state.data);

  for (final animal in action.animals) {
    animals[animal.id] = animal;
  }

  return state.copyWith(
    isLoading: false,
    data: animals,
  );
}

DataState<Animal> onAnimalLoadFailure(
  DataState<Animal> state,
  LoadAnimalFailedAction action,
) {
  return state.copyWith(isLoading: false, errorMessage: action.error);
}

final temporaryReducer = combineReducers<DataState<Animal>>([
  TypedReducer<DataState<Animal>, SaveTemporaryAnimalAction>(onAnimalSaving),
  TypedReducer<DataState<Animal>, SavedTemporaryAnimalAction>(onAnimalSaved),
  TypedReducer<DataState<Animal>, RemoveTemporaryAnimalAction>(onAnimalRemoved),
]);

DataState<Animal> onAnimalSaving(
  DataState<Animal> state,
  SaveTemporaryAnimalAction action,
) {
  return state.copyWith(
    isLoading: true,
  );
}

DataState<Animal> onAnimalSaved(
  DataState<Animal> state,
  SavedTemporaryAnimalAction action,
) {
  state.data.addAll({action.temproraryAnimal.id: action.temproraryAnimal});

  return state.copyWith(
    isLoading: false,
    data: state.data,
  );
}

DataState<Animal> onAnimalRemoved(
  DataState<Animal> state,
  RemoveTemporaryAnimalAction action,
) {
  state.data.remove(action.id);

  return state.copyWith(
    data: state.data,
  );
}
