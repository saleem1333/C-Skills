import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cskills/Pages/Home.dart';
import 'package:flutter/material.dart';
import 'hole_painter.dart';
import 'staggered_raindrop_animation.dart';

class AnimationScreen extends StatefulWidget {
  AnimationScreen({@required this.color});

  final Color color;

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  Size size = Size.zero;
  AnimationController _controller;
  StaggeredRaindropAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _animation = StaggeredRaindropAnimation(_controller);
    Future.delayed(Duration(seconds: 5), () {
      _controller.forward();
    });

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    setState(() {
      size = MediaQuery.of(context).size;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: HolePainter(
                color: widget.color,
                holeSize: _animation.holeSize.value * size.width),
          ),
        ),
        Positioned(
          top: _animation.dropPosition.value * size.height,
          left: size.width / 2 - _animation.dropSize.value / 2,
          child: SizedBox(
            width: _animation.dropSize.value,
            height: _animation.dropSize.value,
            child: CustomPaint(
              painter: DropPainter(visible: _animation.dropVisible.value),
            ),
          ),
        ),
        Center(
          child: Opacity(
            opacity: _animation.textOpacity.value,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 3,
                  ),
                  TextLiquidFill(
                    text: 'C S',
                    textStyle: TextStyle(
                      fontSize: size.height / 4.5,
                      fontFamily: 'AkayaKanadaka',
                    ),
                    boxBackgroundColor: ourColor,
                    waveDuration: Duration(seconds: 4),
                    waveColor: Colors.yellow,
                    loadDuration: Duration(seconds: 5),
                    boxHeight: 300,
                  ),
                  AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                    TyperAnimatedText('communication skills',
                        textStyle: TextStyle(
                            color: Colors.amberAccent,
                            fontFamily: 'AkayaKanadaka',
                            fontSize: size.height / 30),
                        curve: Curves.linear,
                        speed: Duration(milliseconds: 200))
                  ])
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class DropPainter extends CustomPainter {
  DropPainter({this.visible = true});

  bool visible;

  @override
  void paint(Canvas canvas, Size size) {
    if (!visible) {
      return;
    }

    Path path = new Path();
    path.moveTo(size.width / 2, 0);
    path.quadraticBezierTo(0, size.height * 0.8, size.width / 2, size.height);
    path.quadraticBezierTo(size.width, size.height * 0.8, size.width / 2, 0);
    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
