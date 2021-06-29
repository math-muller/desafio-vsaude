import 'package:desafio_vsaude/app/global_components/gradient_background.dart';
import 'package:desafio_vsaude/app/modules/home/tabs/inicio/components/inicio_card.dart';
import 'package:flutter/material.dart';

class InicioTab extends StatelessWidget {
  const InicioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Stack(
        children: [
          Positioned(
            top: 80,
            left: 100,
            right: 20,
            child: Text(
              'Bella\nMaterna',
              style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 200,
            child: InicioCard(
              title: 'Quem somos',
              subtitle:
                  'Seja bem vinda! Saiba como o\nBellamaterna poderá te ajudar',
              icon: Icons.person_pin,
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: InicioCard(
              title: 'Como funciona o app',
              subtitle:
                  'Antes de realizar seu primeiro\natendimento, saiba como noss...',
              icon: Icons.send_to_mobile_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
