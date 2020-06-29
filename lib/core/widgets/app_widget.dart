import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/state_management/page_view_bloc/citiesoftheworld_bloc.dart';
import 'package:cities_of_the_world_demo/cities_of_the_world/presentation/state_management/query_bloc/querycities_bloc.dart';
import 'package:cities_of_the_world_demo/core/routes/router.gr.dart';
import 'package:cities_of_the_world_demo/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark)); // style of the status bar
    return MultiBlocProvider(
      //for state management purposes
      providers: [
        BlocProvider<CitiesoftheworldBloc>(
          create: (context) => getIt<CitiesoftheworldBloc>(),
        ),
        BlocProvider<QuerycitiesBloc>(
          create: (context) => getIt<QuerycitiesBloc>(),
        )
      ],
      child: MaterialApp(
        builder: ExtendedNavigator(
          router: Router(), // lib/core/routes/router.dart
        ),
        debugShowCheckedModeBanner: false,
        title: 'Cities of the world',
        theme: ThemeData(fontFamily: 'Ingleby'),
      ),
    );
  }
}
