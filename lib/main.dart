import 'package:doable_todo_list_app/screens/add_task_page.dart';
import 'package:doable_todo_list_app/screens/edit_task_page.dart';
import 'package:doable_todo_list_app/screens/home_page.dart';
import 'package:doable_todo_list_app/screens/settings_page.dart';
import 'package:doable_todo_list_app/todos_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doable_todo_list_app/todos_notifier.dart';

final todosProvider =
    StateNotifierProvider<TodosNotifier, TodosState>((ref) => TodosNotifier());

void main() {
  //status bar & navigation bar colors and themes
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xffFDFDFF),
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Color(0xffFDFDFF),
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Color(0xffD6D6D6)
  ));

  //Riverpod globally enabled
  runApp(
    const ProviderScope(
      child: DoableApp(),
    ),
  );
}

class DoableApp extends StatelessWidget {
  const DoableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //Text color & Main icon color: Black
          primaryColor: const Color(0xff0c120c),
          //Accent color: Blue
          focusColor: const Color(0xff4285F4),
          //Background color: White
          scaffoldBackgroundColor: const Color(0xffFDFDFF),
          //Sub icon color
          cardColor: const Color(0xff565656),
          //Border color
          shadowColor: const Color(0xffD6D6D6),
          //Description text color & Hint text color
          hintColor: const Color(0xff565656),

          //font family
          fontFamily: "Inter",
          textTheme: const TextTheme(
            //Main heading font style - "Create to-do, Modify to-do"
            displayLarge: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                color: Color(0xff0c120c)),
            //Subheading font style - "Today, Settings"
            displayMedium: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff0c120c)),
            //Regular app font style - "Set Reminder, Daily, Save, License, ..."
            displaySmall: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff0c120c)),
            //box heading font style - "Tell us about your task, Date & Time, Completion status, ..."
            labelSmall: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff565656)),

            //Task list heading font style - "Return Library Book"
            bodyLarge: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff0c120c)),

            //Task list description font style - "Gather overdue library books and return..."
            bodyMedium: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff565656)),

            //Task list icon text font style - "11:30 AM, 26/11/24"
            bodySmall: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Color(0xff565656)),
          )),

      //routes
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'add_task': (context) => const AddTaskPage(),
        'edit_task': (context) => const EditTaskPage(),
        'settings': (context) => const SettingsPage(),
      },
    );
  }
}

double verticalPadding(BuildContext context) {
  return MediaQuery.of(context).size.height / 20;
}

double horizontalPadding(BuildContext context) {
  return MediaQuery.of(context).size.width / 20;
}

double mainSpacing(BuildContext context) {
  return MediaQuery.of(context).size.height / 18;
}

double taskSpacing(BuildContext context) { // 25
  return MediaQuery.of(context).size.width / 20;
}

// final todosProvider =
//     StateNotifierProvider<TodosNotifier, List<TodosModel>>((ref) {
//   return TodosNotifier;
// });