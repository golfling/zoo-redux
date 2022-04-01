import 'package:redux/redux.dart';
import 'package:zoo_redux/logic/redux/animal.dart/actions.dart';
import 'package:zoo_redux/logic/redux/app_state.dart';
import 'package:zoo_redux/logic/api_repository.dart';

class AnimalMiddleware implements MiddlewareClass<ApplicationState> {
  final api = ApiRepository();

  @override
  void call(
    Store<ApplicationState> store,
    dynamic action,
    NextDispatcher next,
  ) async {
    next(action);
    if (action is LoadAnimalAction) {
      try {
        final animals = await api.getAnimals();
        store.dispatch(LoadAnimalSucceededAction(animals));
      } on ApiException catch (e) {
        store.dispatch(LoadAnimalFailedAction(e.message));
      }
    }
  }
}

class SaveAnimalMiddleware implements MiddlewareClass<ApplicationState> {
  @override
  void call(
    Store<ApplicationState> store,
    dynamic action,
    NextDispatcher next,
  ) async {
    next(action);
    if (action is SaveTemporaryAnimalAction) {
      try {
        if (store.state.temporaryState.data
            .containsValue(action.temproraryAnimal.id)) {
          store.dispatch(
              RemoveTemporaryAnimalAction(id: action.temproraryAnimal.id));
        }
        store.dispatch(SavedTemporaryAnimalAction(
            temproraryAnimal: action.temproraryAnimal));
      } on ApiException catch (e) {
        store.dispatch(SaveAnimalFailedAction(e.message));
      }
    }
  }
}
