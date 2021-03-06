import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_components/global_components.dart';

import '../register/register.dart';

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
                      child: Form(
                        key: _.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Nome completo',
                              ),
                              validator: _.validateFullName,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                              ),
                              validator: _.validateEmail,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Senha',
                              ),
                              validator: _.validatePassword,
                            ),
                            SizedBox(height: 40),
                            SizedBox(
                              width: 200,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  _.validateForm(context: context);
                                },
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
