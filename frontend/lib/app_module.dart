import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/module/home/presenter/screens/home_screen.dart';
import 'package:frontend/module/home/presenter/screens/triage_create_screen.dart';
import 'package:frontend/module/home/presenter/screens/triage_info_screen.dart';
class AppModule extends Module {

  @override
  List<Bind> get binds => [

  ];

  @override
  List<ChildRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomeScreen()),
    ChildRoute('/triageinfo', child: (context, args) => const TriageInfoScreen()),
    ChildRoute('/triagecreate', child: (context, args) => const TriageCreateScreen())
  ];
}