import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:love_app/src/presentation/shareds/shareds.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  static const name = '/config';

  @override
  Widget build(BuildContext context) {
    final Object? params = GoRouterState.of(context).extra;

    final HomeProvider provider = params as HomeProvider;

    return ChangeNotifierProvider.value(
      value: provider,
      child: Scaffold(
        appBar: AppBar(
          title: const TextCustomShared(text: 'Configuración', fontSize: 18),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Ionicons.arrow_back_outline),
          ),
        ),
        body: const _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final messageCtrl = TextEditingController();
  bool isLoveCtrl = true;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                autocorrect: true,
                controller: nameCtrl,
                decoration: const InputDecoration(
                  labelText: 'Nombre de tu Amor',
                ),
                onChanged: (value) => nameCtrl.text = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa el nombre de tu Amor';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              TextFormField(
                autocorrect: true,
                controller: messageCtrl,
                decoration: const InputDecoration(
                  labelText: 'Mensaje para tu Amor',
                ),
                onChanged: (value) => messageCtrl.text = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa el mensaje para tu Amor';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              SwitchListTile.adaptive(
                contentPadding: const EdgeInsets.all(0),
                title: const TextCustomShared(
                  text: '¿Tu Amor es mujer?',
                  fontSize: 19,
                ),
                value: isLoveCtrl,
                onChanged: (value) => setState(() {
                  isLoveCtrl = value;
                }),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;

                    Map<String, dynamic> data = {
                      'name': nameCtrl.text,
                      'message': messageCtrl.text,
                      'isWomen': isLoveCtrl,
                    };
                    provider.save(data: data);

                    Future.delayed(
                      const Duration(seconds: 1),
                      () => context.pop(),
                    );
                  },
                  child: const TextCustomShared(
                    text: 'Guardar',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const TextCustomShared(
                    text: 'Generar enlace',
                    fontSize: 16,
                    fontFamily: 'Regular',
                    color: Colors.black54,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
