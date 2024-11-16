import 'package:flutter/material.dart';

void main() => runApp(const pantalla_sesion());

class pantalla_sesion extends StatelessWidget {
  const pantalla_sesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Correo Institucional',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: SizedBox(
                      height: 180, child: Image.asset('assets/image1.png'))),
              ListTile(
                title: const Text(
                  'Bienvenido:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '${ModalRoute.of(context)?.settings.arguments?.toString() ?? 'fj.murillo@unah.hn'}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                trailing: const Icon(
                  Icons.supervised_user_circle,
                  size: 50,
                  color: Color(0xFF28AEE7),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Mas informacion de su cuenta',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF28AEE7),
                ),
              ),
              const Divider(),
              const ListTile(
                title: Text(
                  'Verificacion de privacidad',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Elige la configuracion de la privacidad indicada para ti con esta guia paso a paso\n',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                trailing: Icon(
                  Icons.shield,
                  size: 50,
                  color: Color(0xFF28AEE7),
                ),
              ),
              const Text(
                'Realizar la verificaccion de privacidad',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF28AEE7),
                ),
              ),
              const Divider(),
              const Text(
                '¿Buscas otra informacion?\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  Text(
                    ' Buscar en la cuenta de google         ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(
                    Icons.help,
                    color: Colors.black,
                  ),
                  Text(
                    ' Ver las opciones de ayuda               ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(
                    Icons.message,
                    color: Colors.black,
                  ),
                  Text(
                    ' Enviar comentarios                          ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
