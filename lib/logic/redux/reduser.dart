import 'package:zoo_redux/logic/redux/animal.dart/reducers.dart';
import 'package:zoo_redux/logic/redux/app_state.dart';

ApplicationState reducer(ApplicationState state, action) {
  return ApplicationState(
    animalsState: animalReducer(state.animalsState, action),
    temporaryState: temporaryReducer(state.temporaryState, action),
  );
}
