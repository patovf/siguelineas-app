import 'dart:developer';
import 'package:flutter/material.dart';

class MenuOption {
  const MenuOption({required this.name, this.route});

  final String name;
  final dynamic route;
}

class PrimaryMenuItem extends StatelessWidget {
  PrimaryMenuItem({
    required this.menuOption,
  }) : super(key: ObjectKey(menuOption));

  final MenuOption menuOption;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
        MaterialPageRoute(builder: (context) => menuOption.route),
        );
      },
      child: Text(menuOption.name),
    );
  }
}

class PrimaryMenu extends StatefulWidget {
  const PrimaryMenu({required this.menuOptions, super.key});

  final List<MenuOption> menuOptions;

  @override
  State<PrimaryMenu> createState() => _PrimaryMenuState();
}

class _PrimaryMenuState extends State<PrimaryMenu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: ListView(
        children: widget.menuOptions.map((menuOption) {
          return PrimaryMenuItem(
            menuOption: menuOption,
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Siguelíneas',
    home: PrimaryMenu(
      menuOptions: [
        MenuOption(name: 'Controlar Motores', route: SecondaryMenuMotors()),
        MenuOption(name: 'Controlar LEDs', route: SecondaryMenuLEDs()),
      ]
    ),
  ));
}

class SecondaryMenuMotors extends StatelessWidget {
  const SecondaryMenuMotors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controlar motores'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: const Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ItemWidget(id: 1, text: 'Encender'),
                  ItemWidget(id: 2, text: 'Apagar'),
                ],
              ),
            ),
          );
        }),
    );
  }
}

class SecondaryMenuLEDs extends StatelessWidget {
  const SecondaryMenuLEDs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controlar LEDs'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: const Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ItemWidget(id: 3, text: 'Encender'),
                  ItemWidget(id: 4, text: 'Apagar'),
                ],
              ),
            ),
          );
      }),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.text,
    required this.id,
  });

  final String text;
  final int id;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        log(text);
        log(id.toString());
      },
      child: Text(text),
    );
  }
}