import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/ui/pages/controllers/login_controller.dart';
import 'package:proyecto_1/ui/pages/pages/report_list.dart';
import 'package:proyecto_1/ui/pages/pages/report_list_uc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "BIENVENIDO",
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        key: const Key('TextFormFieldLoginEmail'),
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Correo',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .blue), // Establecer el color azul para la línea cuando el campo está habilitado
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .blue), // Establecer el color azul para la línea cuando el campo está enfocado
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Ingresa correo";
                          } else if (!value.contains('@')) {
                            return "Ingresa un correo valido";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        key: const Key('TextFormFieldLoginPassword'),
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: "Contraseña",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .blue), // Establecer el color azul para la línea cuando el campo está habilitado
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .blue), // Establecer el color azul para la línea cuando el campo está enfocado
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Ingresa contraseña";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          key: const Key('ButtonLoginSubmit'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          onPressed: () async {
                            // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                            FocusScope.of(context).requestFocus(FocusNode());
                            final form = _formKey.currentState;
                            form!.save();
                            if (form.validate()) {
                              if (await loginController.login(
                                  _emailController.text,
                                  _passwordController.text)) {
                                if (loginController.rol == "uc") {
                                  Get.offAll(const ReportListUc(
                                    key: Key('ReportListUc'),
                                  ));
                                } else if (loginController.rol == "us") {
                                  Get.offAll(const Reportlist(
                                    key: Key('Reportlist'),
                                  ));
                                }

                                const snackBar = SnackBar(
                                  content: Text('User or password ok'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                const snackBar = SnackBar(
                                  content: Text('User or password nok'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            } else {
                              const snackBar = SnackBar(
                                content: Text('Validation nok'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: const Text("Iniciar sesión",
                              style: TextStyle(color: Colors.black))),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.business,
                  size: 200.0, // Tamaño grande del icono
                  color: Colors.white,
                ),
                SizedBox(
                    height: 20.0), // Espacio vertical entre el icono y el texto
                Text(
                  'Repcontroller',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
