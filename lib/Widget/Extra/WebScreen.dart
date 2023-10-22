import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mohan/Widget/Extra/ToolBarArea.dart';
import 'package:mohan/Widget/Extra/WebView.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatelessWidget {
  final String title;
  static const route = '/WebviewScreen';

  const WebviewScreen({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AboutWebviewScreenController());
    return Scaffold(
      body: Column(
        children: [
          TopBarArea(title: title),
          Expanded(child: WebViewWidget(controller: controller.controller)),
        ],
      ),
    );
  }
}

class SocialWebviewScreen1 extends StatelessWidget {
  final String title;
  
  const SocialWebviewScreen1({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SocialScreenController1());
    return Scaffold(
      body: Column(
        children: [
          TopBarArea(title: title),
          Expanded(child: WebViewWidget(controller: controller.controller)),
        ],
      ),
    );
  }
}


class SocialWebviewScreen2 extends StatelessWidget {
  final String title;

  const SocialWebviewScreen2({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SocialScreenController2());
    return Scaffold(
      body: Column(
        children: [
          TopBarArea(title: title),
          Expanded(child: WebViewWidget(controller: controller.controller)),
        ],
      ),
    );
  }
}


class SocialWebviewScreen3 extends StatelessWidget {
  final String title;

  const SocialWebviewScreen3({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AboutWebviewScreenController());
    return Scaffold(
      body: Column(
        children: [
          TopBarArea(title: title),
          Expanded(child: WebViewWidget(controller: controller.controller)),
        ],
      ),
    );
  }
}


class SocialWebviewScreen4 extends StatelessWidget {
  final String title;

  const SocialWebviewScreen4({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AboutWebviewScreenController());
    return Scaffold(
      body: Column(
        children: [
          TopBarArea(title: title),
          Expanded(child: WebViewWidget(controller: controller.controller)),
        ],
      ),
    );
  }
}


class SocialWebviewScreen5 extends StatelessWidget {
  final String title;

  const SocialWebviewScreen5({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AboutWebviewScreenController());
    return Scaffold(
      body: Column(
        children: [
          TopBarArea(title: title),
          Expanded(child: WebViewWidget(controller: controller.controller)),
        ],
      ),
    );
  }
}

