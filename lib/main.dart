import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:little_things_list/src/data/done_provider.dart';
import 'package:little_things_list/src/data/loader.dart';
import 'package:little_things_list/src/data/parse_agenda.dart';
import 'package:little_things_list/src/list.dart';
import 'package:little_things_list/src/themes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(ChangeNotifierProvider(
    create: (_) => DoneNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildTheme(true),
      darkTheme: buildTheme(false),
      themeMode: ThemeMode.system,
      home: Loader(
        () => parseAgenda(context),
        (agenda) => MyAgendaList(agenda),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
