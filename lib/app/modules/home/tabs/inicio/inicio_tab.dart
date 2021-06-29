import 'package:desafio_vsaude/app/modules/home/tabs/inicio/components/inicio_card.dart';
import 'package:flutter/material.dart';

class InicioTab extends StatelessWidget {
  const InicioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.58],
          colors: [
            Colors.pinkAccent,
            Colors.purple,
          ],
        ),
      ),
      child: Stack(
        children: [
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
