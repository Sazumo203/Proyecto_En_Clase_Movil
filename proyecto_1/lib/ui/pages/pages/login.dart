import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/ui/pages/controllers/login_controller.dart';
import 'package:proyecto_1/ui/pages/pages/main_uc.dart';
import 'package:proyecto_1/ui/pages/pages/report_list.dart';

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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Bienvenido",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: const Key('TextFormFieldLoginEmail'),
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Correo'),
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
                  decoration: const InputDecoration(labelText: "Contraseña"),
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
                  height: 20,
                ),
                OutlinedButton(
                    key: const Key('ButtonLoginSubmit'),
                    onPressed: () async {
                      // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                      FocusScope.of(context).requestFocus(FocusNode());
                      final form = _formKey.currentState;
                      form!.save();
                      if (form.validate()) {
                        if (await loginController.login(_emailController.text,_passwordController.text)) {
                          if(loginController.rol == "uc"){
                            Get.offAll(const MainUcScreen(
                              key: Key('MainUcScreen'),
                            ));
                          }else if(loginController.rol == "us"){
                            Get.offAll(const Reportlist(
                              key: Key('Reportlist'),
                            ));
                          }
                          
                          const snackBar = SnackBar(
                            content: Text('User or password ok'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          const snackBar = SnackBar(
                            content: Text('User or password nok'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else {
                        const snackBar = SnackBar(
                          content: Text('Validation nok'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text("Iniciar sesión")),
                const SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
