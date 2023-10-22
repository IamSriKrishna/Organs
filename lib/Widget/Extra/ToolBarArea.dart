import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class TopBarArea extends StatelessWidget {
  final String title;
  final Function()? onQrCodeTap;
  final bool isQrCodeVisible;
  final bool enablearrow;

  const TopBarArea(
      {Key? key,
      required this.title,
      this.isQrCodeVisible = false,
      this.onQrCodeTap,
      this.enablearrow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            enablearrow
                ? Align(
                    alignment: Directionality.of(context) == TextDirection.rtl
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        //Get.back();
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right:
                                Directionality.of(context) == TextDirection.rtl
                                    ? 10
                                    : 0,
                            left:
                                Directionality.of(context) == TextDirection.rtl
                                    ? 0
                                    : 10),
                        child: const Icon(
                          BoxIcons.bx_arrow_back,
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
                Text( title)
            ,
          ],
        ),
      ),
    );
  }
}
