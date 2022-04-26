import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/politicasdeprivacidade.dart';
import 'package:flutter_application_1/ui/termosdeuso.dart';
import 'package:flutter_application_1/ui/referencias.dart';
import 'package:flutter_application_1/ui/user_page.dart';

class NavDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Equipe';
    final name2 = "Trate Sífilis";
    final clique = "Clique aqui e conheça a equipe!";

    return Drawer(
      child: Material(
        color: Color.fromARGB(255, 121, 215, 148),
        child: ListView(
          children: <Widget>[
            buildHeader(
              name: name,
              name2: name2,
              clique: clique,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserPage(),
              )),
            ),
            Divider(color: Colors.white70),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Termos de uso',
                    icon: Icons.document_scanner_rounded,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Políticas de privacidade',
                    icon: Icons.workspaces_outline,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Referências',
                    icon: Icons.update,
                    onClicked: () => selectedItem(context, 2),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    String name,
    String name2,
    String clique,
    VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 142, 197, 231),
                        backgroundImage:
                            AssetImage('assets/images/imagem_do_app.png')),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          name2,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  clique,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            )),
      );

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TermosDeUso(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PoliticasDePrivacidade(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Referencias(),
        ));
        break;
    }
  }
}
