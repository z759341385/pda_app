import 'package:flutter/material.dart';

//容器闪烁
class ContainerFlash extends StatefulWidget {
  final Widget child;
  final bool play; //是否播放
  final int duration; //动画时长(毫秒)
  final double speed; //动画速度
  final Color initColor; //初始颜色
  final Color flashColor; //闪烁颜色
  final bool loop; //是否循环播放
  ContainerFlash(
      {Key? key,
      required this.child,
      this.play = false,
      this.duration = 2000,
      this.speed = 0.5,
      required this.initColor,
      required this.flashColor,
      this.loop = false})
      : super(key: key);

  @override
  _ContainerFlashState createState() => _ContainerFlashState();
}

class _ContainerFlashState extends State<ContainerFlash> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  late int _singleAniPeriod; //单次动画时长

  @override
  void initState() {
    super.initState();

    //控制单次动画时长实现动画速度变化
    _singleAniPeriod = (1000 / widget.speed).truncate();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _singleAniPeriod),
    );

    Animation<double> curveAnimation = CurvedAnimation(parent: _animationController!, curve: Curves.linear);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation);
  }

  @override
  void dispose() {
    if (_animationController != null) {
      _animationController!.dispose();
      _animationController = null;
    }

    super.dispose();
  }

  @override
  void didUpdateWidget(ContainerFlash oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (_animationController != null) {
      if (widget.play) {
        this._playAnimation();
      } else {
        _animationController!.stop();
        _animationController!.reset();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ContainerFlashAnimation(_animationController!, widget.child, widget.initColor, widget.flashColor),
    );
  }

  //播放动画
  _playAnimation() {
    _animationController!.reset();
    _animationController!.repeat();
    if (widget.loop) return;
    Future.delayed(Duration(milliseconds: widget.duration), () {
      if (_animationController != null) {
        _animationController!.stop();
        _animationController!.reset();
      }
    });
  }
}

class ContainerFlashAnimation extends AnimatedWidget {
  final Widget child;
  final Color initColor;
  final Color flashColor;
  final AnimationController controller;
  ContainerFlashAnimation(this.controller, this.child, this.initColor, this.flashColor) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    Animation animation = controller;
    int numVal = (animation.value * 10).truncate();
    bool active = numVal % 2 == 1;
    Color curColor =
        active ? (flashColor != null ? flashColor : Colors.white.withOpacity(0.2)) : (initColor != null ? initColor : Colors.transparent);
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(color: curColor, borderRadius: BorderRadius.all(Radius.circular(4))),
      child: child != null ? child : Container(),
    );
  }
}
