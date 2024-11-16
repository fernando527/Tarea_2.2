import 'package:flutter/material.dart';
import 'package:inicio_de_sesion/inputs.dart';
import 'package:inicio_de_sesion/pantalla_inicio.dart';
import 'package:inicio_de_sesion/pantalla_sesion.dart';

void main() => runApp(pantalla_registro());

class pantalla_registro extends StatelessWidget {
  pantalla_registro({super.key});

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController contraseniaController = TextEditingController();
  final TextEditingController confirmarcontraseniaController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 253, 253),
        title: const Center(
          child: Text(
            'Registrarse',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.grey,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => pantalla_inicio()),
              );
            }),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CuntomInput(
                  label: 'Nombre',
                  controller: nombreController,
                  maxLength: 10,
                  icon: Icons.person,
                  borderColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El nombre es obligatorio';
                    }
                    if (value.length <= 2) {
                      return 'El nombre debe tener entre 3 y 10 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CuntomInput(
                  controller: correoController,
                  label: 'Correo',
                  icon: Icons.email,
                  maxLength: 50,
                  borderColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El correo es obligatorio';
                    }

                    if (!value.endsWith('edu.hn') &&
                        !value.endsWith('unah.hn')) {
                      return 'El correo debe finalizar con "edu.hn" o "unah.hn"';
                    }

                    int countAt = value.split('@').length - 1;

                    if (countAt != 1) {
                      return 'El correo debe contener exactamente una "@"';
                    }

                    if (value.contains(' ')) {
                      return 'No deben haber espacios en blanco';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CuntomInput(
                  controller: telefonoController,
                  label: 'Teléfono',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  maxLength: 8,
                  borderColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El teléfono es obligatorio';
                    }

                    if (value.length != 8) {
                      return 'El teléfono debe tener 8 dígitos';
                    }

                    if (!value.startsWith('3') && !value.startsWith('9')) {
                      return 'El teléfono debe empezar con 3 o 9';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CuntomInput(
                  controller: contraseniaController,
                  label: 'Contraseña',
                  icon: Icons.lock,
                  obscureText: true,
                  maxLength: 30,
                  keyboardType: TextInputType.visiblePassword,
                  borderColor: Colors.grey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'La contraseña es obligatoria';
                    }
                    if (value.length < 8) {
                      return 'La contraseña debe tener al menos 8 caracteres';
                    }

                    if (!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>_]'))) {
                      return 'La contraseña debe tener un carácter especial';
                    }

                    if (!value.contains(RegExp(r'[A-Z]'))) {
                      return 'La contraseña debe tener una mayúscula';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CuntomInput(
                  controller: confirmarcontraseniaController,
                  label: 'Confirmar Contraseña',
                  icon: Icons.lock,
                  obscureText: true,
                  maxLength: 30,
                  keyboardType: TextInputType.visiblePassword,
                  borderColor: Colors.grey,
                  validator: (value) {
                    if (value == null) {
                      return 'Debe confirmar su contraseña';
                    }
                    if (value != contraseniaController.text) {
                      return 'Sus contraseñas deben coincidir';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }

                    final data = {
                      'nombre': nombreController.text,
                      'correo': correoController.text,
                      'telefono': telefonoController.text,
                      'contrasenia': contraseniaController.text,
                      'confirmarcontrasenia':
                          confirmarcontraseniaController.text,
                    };
                    print(data);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => pantalla_sesion()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.grey, width: 2)),
                  ),
                  child: Text(
                    'Crear Cuenta',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
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
