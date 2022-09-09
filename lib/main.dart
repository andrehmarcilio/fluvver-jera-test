import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'data/local/dao/viagem_dao.dart';
import 'data/local/viagem_database.dart';
import 'data/remote/maps/maps_repository.dart';
import 'data/remote/maps/maps_service.dart';
import 'domain/repository/imaps_repository.dart';
import 'domain/useCases/auto_completar_campo_cidade_use_case.dart';
import 'domain/useCases/buscar_rota_do_trajeto_use_case.dart';
import 'presentation/home/view/home_view.dart';
import 'presentation/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hiverBox  = await ViagemDatabase.initDataBase();
  runApp(MyApp(box: hiverBox));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.box}) : super(key: key);
  final Box<Map> box;
  @override
  Widget build(BuildContext context) {
    _mudarCorDaStatusBar();
    return MultiProvider(
      providers: [
        Provider(create: (_) => MapsService()),
        // ignore: unnecessary_cast
        Provider(create: (context) => MapsRepository(context.read()) as IMapsRepository),
        Provider(
          create: (context) => AutoCompletarCampoCidadeUseCase(context.read()),
        ),
        Provider(
          create: (context) => AutoCompletarCampoCidadeUseCase(context.read()),
        ),
        Provider(
          create: (context) => BuscarRotaTrajetoUseCase(context.read()),
        ),
        Provider(
          create: (context) {
           final viagemDao = ViagemDao(box);
           print("-----------------------");
           print(viagemDao.getViagens());
            return viagemDao;
          },
        )
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale("pt", "BR")],
        debugShowCheckedModeBanner: false,
        title: 'Muvver',
        theme: theme,
        home: const HomeView(),
      ),
    );
  }
}

void _mudarCorDaStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
}
