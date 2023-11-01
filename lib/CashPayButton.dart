
import 'package:flutter/material.dart';

class CashPayButton extends StatelessWidget {


  CashPayButton({
    Key? key,

    this.width,

     this.alignment, this.margin, this.height, this.padding, this.decoration, this.child, this.onTap
  ,
  }) : super(
    key: key,
  );

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: cashPayButtonWidget,
    )
        : cashPayButtonWidget;
  }

  Widget get cashPayButtonWidget =>     Padding(padding: EdgeInsets.all(10),
    child:GestureDetector(
        onTap: onTap,
        child:
        Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
              color:  Color(0xff0A6868),

              borderRadius: BorderRadius.circular(10),
              // color: HomeTabTheme.grey.withOpacity(0.2),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color:  Color(0xff0A6868),
                    offset: const Offset(1.1, 1.1),
                    blurRadius: 5.0),
              ],
            ),



            child: Image(image:AssetImage('assets/images/cashpay.png', package: 'iframe_cashpay_plugin') ,)
        )) ,);
}
