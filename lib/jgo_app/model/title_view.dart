
import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const TitleView(
      {Key? key,
        this.titleTxt = "",
        this.subTxt= "",
        this.animationController,
        this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      titleTxt,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: 0.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  /*InkWell(
                    highlightColor: Colors.transparent,
                    borderRadius:const BorderRadius.all(Radius.circular(4.0)),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            subTxt,
                            textAlign: TextAlign.left,
                            style:const TextStyle(
                              fontFamily: DomaAppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              letterSpacing: 0.5,
                              color: DomaAppTheme.nearlyDarkBlue,
                            ),
                          ),
                          const SizedBox(
                            height: 38,
                             child: Icon(
                              Icons.arrow_forward,
                              color: DomaAppTheme.darkText,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )*/
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
