import 'package:redux/redux.dart';
import 'package:zoo_redux/logic/model.dart';
import 'package:zoo_redux/logic/redux/animal.dart/actions.dart';
import 'package:zoo_redux/logic/redux/app_state.dart';

class HomeScreenViewModel {
  final Store<ApplicationState> _store;
  final bool isLoading;
  final List<Animal> animals;
  final String? errorMessage;

  bool get hasAnyAnimals => animals.isNotEmpty;
  bool get hasError => errorMessage != null && animals.isEmpty;

  HomeScreenViewModel(
    this._store,
    this.isLoading,
    this.animals,
    this.errorMessage,
  );

  static HomeScreenViewModel converter(Store<ApplicationState> store) {
    return HomeScreenViewModel(
      store,
      store.state.animalsState.isLoading,
      store.state.animalsState.data.values.toList(),
      store.state.animalsState.errorMessage,
    );
  }

  void loadAnimals() => _store.dispatch(LoadAnimalAction());
}
