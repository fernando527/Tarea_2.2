import 'package:flutter/material.dart';
import 'package:inicio_de_sesion/main.dart';
import 'package:inicio_de_sesion/pantalla_sesion.dart';
import 'package:inicio_de_sesion/pantalla_registro.dart';

void main() => runApp(pantalla_inicio());

class pantalla_inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaInicio(),
    );
  }
}

class PantallaInicio extends StatefulWidget {
  @override
  _PantallaInicioState createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contraseniaController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 250, child: Image.asset('assets/image.png')),
                const SizedBox(height: 20),
                TextFormField(
                  controller: correoController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelText: 'Correo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  maxLength: 50,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El correo es obligatorio';
                    }

                    if (!value.contains('@') || !value.contains('.hn')) {
                      return 'El correo no es válido';
                    }
                    if (value != 'fj.murillo@unah.hn') {
                      return 'Correo Incorrecto';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: contraseniaController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscurePassword,
                  maxLength: 30,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'La contraseña es obligatoria';
                    }
                    if (value != '20222001186') {
                      return 'La contraseña es incorrecta';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'De momento esta opción no está habilitada espere una futura versión'),
                        ),
                      );
                    },
                    child: const Text(
                      '¿Olvido su contraseña?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      final data = {
                        'correo': correoController.text,
                        'contrasenia': contraseniaController.text,
                      };

                      print(data);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => pantalla_sesion()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB2FF59),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Iniciar sesión',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pantalla_registro(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      side: MaterialStateProperty.all<BorderSide>(
                        const BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                    child: const Text(
                      'Registrarse',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Al registrarte, aceptas nuestros',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Términos de servicio',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const Text(
                        'y nuestra',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Política de privacidad',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
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
