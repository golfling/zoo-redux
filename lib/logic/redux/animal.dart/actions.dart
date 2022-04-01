import 'package:zoo_redux/logic/model.dart';

abstract class AnimalAction {}

class LoadAnimalAction implements AnimalAction {}

class SaveTemporaryAnimalAction implements AnimalAction {
  final Animal temproraryAnimal;

  SaveTemporaryAnimalAction({required this.temproraryAnimal});
}

class SavedTemporaryAnimalAction implements AnimalAction {
  final Animal temproraryAnimal;

  SavedTemporaryAnimalAction({required this.temproraryAnimal});
}

class RemoveTemporaryAnimalAction implements AnimalAction {
  final int id;

  RemoveTemporaryAnimalAction({required this.id});
}

class LoadAnimalSucceededAction implements AnimalAction {
  final List<Animal> animals;

  LoadAnimalSucceededAction(this.animals);
}

class LoadAnimalFailedAction implements AnimalAction {
  final String error;

  LoadAnimalFailedAction(this.error);
}

class SaveAnimalFailedAction implements AnimalAction {
  final String error;

  SaveAnimalFailedAction(this.error);
}
