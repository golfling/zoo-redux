import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:zoo_redux/logic/model.dart';
import 'package:zoo_redux/logic/redux/app_state.dart';
import 'package:zoo_redux/logic/view_model/animal_view_model.dart';
import 'package:zoo_redux/widgets/text_info_line.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({Key? key, required this.animal}) : super(key: key);

  final Animal animal;

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  final latinNameController = TextEditingController();
  final animalTypeController = TextEditingController();
  final activeTimeController = TextEditingController();
  final dietController = TextEditingController();
  final geoRangeController = TextEditingController();
  final habitatController = TextEditingController();

  Animal temproraryAnimal({
    required Animal animal,
    required TextEditingController latinNameController,
  }) {
    Animal temproraryAnimal = animal.copyWith(
      latinName: latinNameController.text,
      animalType: animalTypeController.text,
      activeTime: activeTimeController.text,
      diet: dietController.text,
      geoRange: geoRangeController.text,
      habitat: habitatController.text,
    );
    return temproraryAnimal;
  }

  @override
  void dispose() {
    latinNameController.dispose();
    animalTypeController.dispose();
    activeTimeController.dispose();
    dietController.dispose();
    geoRangeController.dispose();
    habitatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, AnimalViewModel>(
      converter: (store) => AnimalViewModel.converter(
        store,
        widget.animal,
      ),
      builder: (context, viewModel) {
        latinNameController.text = viewModel.animal.latinName;
        animalTypeController.text = viewModel.animal.animalType;
        activeTimeController.text = viewModel.animal.activeTime;
        dietController.text = viewModel.animal.diet;
        geoRangeController.text = viewModel.animal.geoRange;
        habitatController.text = viewModel.animal.habitat;
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(child: Text(viewModel.animal.name)),
                GestureDetector(
                  child: const Icon(Icons.save),
                  onTap: () => viewModel.saveChanges(
                    temproraryAnimal: temproraryAnimal(
                      animal: viewModel.animal,
                      latinNameController: latinNameController,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        viewModel.animal.imageLink,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextInfoLine(
                              name: const Text('Latin name: '),
                              controller: latinNameController,
                            ),
                            TextInfoLine(
                              name: const Text('Animal type: '),
                              controller: animalTypeController,
                            ),
                            TextInfoLine(
                              name: const Text('Active time: '),
                              controller: activeTimeController,
                            ),
                            TextInfoLine(
                              name: const Text('Diet: '),
                              controller: dietController,
                            ),
                            TextInfoLine(
                              name: const Text('Location: '),
                              controller: geoRangeController,
                            ),
                            TextInfoLine(
                              name: const Text('Habitat: '),
                              controller: habitatController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
