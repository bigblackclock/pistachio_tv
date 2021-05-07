import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pistachio_tv/l10n/l10n.dart';
import 'package:pistachio_tv/screens/screens.dart';
import 'package:pistachio_tv/theme/theme.dart';
import 'package:pistachio_tv/widgets/video/src/cubit/cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      allowFontScaling: false,
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => VideoCubit(),
          )
        ],
        child: MaterialApp(
          theme: AppTheme.themeData,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomePage(),
        ),
      ),
    );
  }
}
