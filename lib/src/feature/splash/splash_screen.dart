import 'package:app/flavors.dart';
import 'package:app/src/common/bloc/auth/auth_bloc.dart';
import 'package:app/src/common/theme/app_colors.dart';
import 'package:app/src/feature/home/presentation/home_screen.dart';
import 'package:app/src/shared/widgets/images/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'loading';
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AuthBloc authBloc;
  late Animation<double> animation;
  late AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 800),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    authBloc = context.read<AuthBloc>();

    _animationController(begin: 0, end: 0.9);
    animationController.forward().then(
      (value) => {authBloc.add(AuthValidateEvent())},
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _animationController({
    required double begin,
    required double end,
    int? duration,
  }) {
    animationController = AnimationController(
      duration: Duration(milliseconds: duration ?? 800),
      vsync: this,
    );
    animation = Tween(begin: begin, end: end).animate(animationController)
      ..addListener(() {
        setState(() {
          /* the state that has changed here is the animation object’s value*/
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (context, state) async {
          if (state is AuthenticatedState) {
            _animationController(begin: 0.9, end: 1);
            await animationController.forward().then((value) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<void>(
                  settings: const RouteSettings(name: HomeScreen.routeName),
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false,
              );
            });
          }
          if (state is AuthNoAuthenticatedState) {
            authBloc.add(AuthInitialEvent());
            _animationController(begin: 0.9, end: 1);
            await animationController.forward().then((value) => {});
          }
          if (state is AuthFinishWithError) {
            _animationController(begin: 0.9, end: 1);
            await animationController.forward().then((value) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<void>(
                  settings: const RouteSettings(name: HomeScreen.routeName),
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false,
              );
            });
          }
          if (state is AuthOnboardingState) {
            _animationController(begin: 0.9, end: 1);
            await animationController.forward().then(
              (value) => {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                    settings: const RouteSettings(name: HomeScreen.routeName),
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false,
                ),
              },
            );
          }
        },
        child: _loading(screenSize),
      ),
    );
  }

  Widget _loading(Size screenSize) {
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: screenSize.height * 0.3,
                bottom: screenSize.height * 0.3,
              ),
              child: Hero(
                tag: 'Catbreeds',
                child: Text(
                  'Catbreeds',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            CustomImage(
              FlavorsConfig.iconApp,
              height: screenSize.height * 0.25,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: screenSize.width * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  minHeight: 5,
                  value: animation.value,
                  color: AppColors.primaryColor,
                  backgroundColor: AppColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
