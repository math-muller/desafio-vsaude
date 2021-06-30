import 'package:desafio_vsaude/app/global_components/gradient_background.dart';
import 'package:desafio_vsaude/app/modules/home/tabs/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) => GestureDetector(
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
                  child: Form(
                    key: _.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() {
                          return !_.isValidEmail
                              ? AnimatedContainer(
                                  duration: Duration(milliseconds: 600),
                                  child: TextFormField(
                                    controller: _.editingController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: 'E-mail',
                                    ),
                                    onChanged: _.onEmailChanged,
                                    validator: _.validateEmail,
                                  ),
                                )
                              : AnimatedContainer(
                                  duration: Duration(milliseconds: 600),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      labelText: 'Senha',
                                    ),
                                    onChanged: _.onPasswordChanged,
                                    validator: _.validatePassword,
                                  ),
                                );
                        }),
                        SizedBox(height: 40),
                        SizedBox(
                          width: 200,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              _.isValidEmail
                                  ? _.validatePasswordError(context: context)
                                  : _.validateEmailError(context: context);
                            },
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
                ),
                SizedBox(height: 40),
                Text(
                  'Ainda não tem conta?',
                  style: TextStyle(color: Colors.pinkAccent, fontSize: 16),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: _.goToRegister,
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
      ),
    );
  }
}
