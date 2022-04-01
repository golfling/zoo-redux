import 'package:redux/redux.dart';
import 'package:zoo_redux/logic/model.dart';
import 'package:zoo_redux/logic/redux/animal.dart/actions.dart';
import 'package:zoo_redux/logic/redux/app_state.dart';

class AnimalViewModel {
  final Store<ApplicationState> store;
  final Animal animal;
  final bool isLoading;
  final String? errorMessage;

  bool get hasError => errorMessage != null;

  AnimalViewModel(
    this.store,
    this.animal,
    this.isLoading,
    this.errorMessage,
  );

  static AnimalViewModel converter(
    Store<ApplicationState> store,
    Animal animal,
  ) {
    if (store.state.temporaryState.data.isNotEmpty &&
        store.state.temporaryState.data.containsKey(animal.id)) {
      return AnimalViewModel(
        store,
        store.state.temporaryState.data[animal.id]!,
        store.state.temporaryState.isLoading,
        store.state.temporaryState.errorMessage,
      );
    } else {
      return AnimalViewModel(
        store,
        store.state.animalsState.data[animal.id]!,
        store.state.animalsState.isLoading,
        store.state.animalsState.errorMessage, 
      );
    }
  }

  void saveChanges({required Animal temproraryAnimal}) => store
      .dispatch(SaveTemporaryAnimalAction(temproraryAnimal: temproraryAnimal));
}
