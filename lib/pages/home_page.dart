import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:zoo_redux/logic/redux/app_state.dart';
import 'package:zoo_redux/logic/view_model/home_view_model.dart';
import 'package:zoo_redux/pages/animal_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<ApplicationState, HomeScreenViewModel>(
      converter: HomeScreenViewModel.converter,
      builder: (context, viewModel) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              viewModel.loadAnimals();
            },
            child: const Icon(Icons.refresh),
          ),
          appBar: AppBar(
            title: const Text('Zoo animals'),
          ),
          body: Builder(
            builder: (context) {
              if (viewModel.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (viewModel.hasError) {
                return Center(
                  child: Text(viewModel.errorMessage!),
                );
              }

              return ListView.builder(
                itemCount: viewModel.animals.length,
                itemBuilder: (context, i) => SizedBox(
                  child: ListTile(
                    title: Image.network(
                      viewModel.animals[i].imageLink,
                      fit: BoxFit.cover,
                      height: 300,
                      loadingBuilder: (context, widget, loadingProgress) {
                        if (loadingProgress == null) {
                          return widget;
                        } else {
                          return SizedBox(
                            height: 300,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimalPage(
                            animal: viewModel.animals[i],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
