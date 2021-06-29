import 'package:desafio_vsaude/app/global_components/gradient_background.dart';
import 'package:desafio_vsaude/app/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: GradientBackground(
          screenSize: 0.92,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Acesse sua conta',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(height: 100),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Entrar'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.pinkAccent,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Ainda não tem conta?',
                style: TextStyle(color: Colors.pinkAccent, fontSize: 16),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: controller.goToRegister,
                child: Text(
                  'Cadastre-se!',
                  style: TextStyle(
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.w600,
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