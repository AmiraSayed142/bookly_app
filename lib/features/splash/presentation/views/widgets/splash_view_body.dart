import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController; // bytl3 values from 0 to 1 bs
  late Animation<Offset>
  slidingAnimation; // 3ashan a8er fe el values of animation controller
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateToHomeView();
  }

  // ay controller lazem yt3mlo dispose 34an el memory leek
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetsData.logo),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigateToHomeView() {
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push("/homeView");
      //   Get.to(
      //     () => HomeView(),
      //     transition: Transition.fade,
      //     duration: kTransitionDuration,
      //   );
    });
  }
}
