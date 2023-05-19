import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ConnecTen/firebase_options.dart';
import 'package:ConnecTen/routes/app_route.dart';
import 'package:ConnecTen/utils/size_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://ggvpaosmyunvtsxievre.supabase.co';
const supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdndnBhb3NteXVudnRzeGlldnJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQzOTUzNzUsImV4cCI6MTk5OTk3MTM3NX0.TN-N73C7Nc8JdVXJpwHvCx3ENegqr1dwtdYY_DjI_-I";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'ConnecTen',
              theme: ThemeData(
                textTheme:
                    GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
                appBarTheme: const AppBarTheme(elevation: 0),
              ),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRoute.generateRoute,
              // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            );
          },
        );
      },
    );
  }
}
