part of splash;

class SplashScreen extends StatefulWidget {
  final SplashController mainController = Get.find<SplashController>();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late Animation? animation;
  late AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 1300),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController!, curve: Curves.fastOutSlowIn),
    );
    animationController!.forward();
  }

  @override
  dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        AnimatedContainer(
          duration: Duration(milliseconds: 1800),
          curve: Curves.fastOutSlowIn,
          color: widget.mainController.bgColor.value,
          padding: const EdgeInsets.only(top: 16.0),
          child: FadeTransition(
            opacity: animationController!.drive(CurveTween(curve: Curves.fastOutSlowIn)),
            child: Center(
              child: Hero(
                tag: 'appLogo',
                child: SizedBox(
                  width: Get.size.width / 2,
                  child: Image.asset(AssetsPath.icShowTvLogo),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
