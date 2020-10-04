import 'package:fcash_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Bem vindo'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: const Icon(
              Icons.local_atm,
            ),
            title: Text('Resumo'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(
              Icons.money_off,
            ),
            title: Text('Despesas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.EXPENSES);
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(
              Icons.monetization_on,
            ),
            title: Text('Receitas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.REVENUES);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}