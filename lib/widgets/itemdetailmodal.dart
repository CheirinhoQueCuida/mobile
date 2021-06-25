import 'package:flutter/material.dart';
import 'package:mobile/models/oleo.dart';
import 'package:mobile/views/oleo/oleodetailpage.dart';

class ItemDetailModal extends ModalRoute<void> {
  ItemDetailModal(this.oleo);

  Oleo oleo;

  @override
  Duration get transitionDuration => Duration(milliseconds: 400);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor {
    return Colors.white.withOpacity(0);
  }

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        minimum: EdgeInsets.only(top: 60),
        child: OleoDetailPage(
          oleo: oleo,
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var tween = Tween(begin: begin, end: end);
    Animation<Offset> offsetAnimation = animation.drive(tween);
    return SlideTransition(
      position: offsetAnimation,
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
