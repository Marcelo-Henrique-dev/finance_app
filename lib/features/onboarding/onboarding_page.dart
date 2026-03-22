import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              color: AppColors.iceWhite,
              child: FloatingMan(),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Spend Smarter \n Save More',
                      style: AppTextStyles.mediumText.copyWith(color: AppColors.greenLigthTwo),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.greenLigthTwo.withAlpha(90),
                              offset: const Offset(5, 5),
                              blurRadius: 10,
                              spreadRadius: 2
                            )
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: AppColors.greenGradient,
                          ),
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                            )
                          ),
                          onPressed: (){},
                          child: Text(
                            'Get Started',
                            style: AppTextStyles.smallText.copyWith(color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Already Habe Account? Log In',
                      style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FloatingMan extends StatefulWidget {
  const FloatingMan({super.key});

  @override
  State<FloatingMan> createState() => _FloatingManState();
}

class _FloatingManState extends State<FloatingMan>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Duração de um ciclo completo
      vsync: this,
    )..repeat(reverse: true); // Repete a animação invertendo a direção

    _animation = Tween<double>(begin: 0, end: 15).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Curva suave para aceleração e desaceleração
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value), // Aplica o deslocamento vertical
          child: child,
        );
      },
      child: Image.asset(
        'assets/images/man.png',
      ),
    );
  }
}