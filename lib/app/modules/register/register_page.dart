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
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: GradientBackground(
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
                  Positioned(
                    top: 200,
                    left: 40,
                    right: 40,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Nome completo',
                              labelStyle: TextStyle(fontSize: 14),
                            ),
                          ),
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
                              child: Text('Cadastrar'),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
