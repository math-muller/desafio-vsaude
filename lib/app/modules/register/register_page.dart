import 'package:desafio_vsaude/app/global_components/gradient_background.dart';
import 'package:desafio_vsaude/app/modules/register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (_) => Scaffold(
        body: GradientBackground(
          child: Stack(
            children: [
              Positioned(
                left: 15,
                top: 10,
                child: SafeArea(
                  child: CupertinoButton(
                    color: Colors.transparent,
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.arrow_back_ios, size: 30),
                    onPressed: _.goBack,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
