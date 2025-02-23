import 'package:eko_assignment/assignment_app.dart';
import 'package:eko_assignment/services/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

/// initialize Logger Service for global Access
final appLogger = Logger(
  printer: PrettyPrinter(),
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  // Note to Dev : Enable if the details of the Blocs are needed
  // Bloc.observer = AppBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const AssignmentApp());
}
