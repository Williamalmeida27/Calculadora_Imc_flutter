import 'package:flutter/material.dart';

import '../pages/configuracoes_page.dart';
import '../pages/imc_app.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: InkWell(
              child: Container(
                height: 10,
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.calculate),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Calculadora",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext bc) => const AppImc()));
              },
            ),
          ),
          Expanded(
            child: InkWell(
              child: Container(
                height: 10,
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.manage_accounts),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Configurações",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext bc) =>
                            const ConfiguracoesPage()));
              },
            ),
          ),
          Expanded(child: InkWell())
        ],
      ),
    );
  }
}
