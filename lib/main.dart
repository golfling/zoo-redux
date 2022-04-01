import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:zoo_redux/logic/redux/animal.dart/mildware.dart';
import 'package:zoo_redux/logic/redux/app_state.dart';
import 'package:zoo_redux/logic/redux/reduser.dart';
import 'package:zoo_redux/pages/home_page.dart';

void main() {
  final store = Store<ApplicationState>(
    reducer,
    initialState: ApplicationState.initial(),
    middleware: [AnimalMiddleware(), SaveAnimalMiddleware()],
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store<ApplicationState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.green.shade100,
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            bodyText2: TextStyle(fontSize: 17),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
