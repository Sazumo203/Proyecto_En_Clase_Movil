import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/ui/pages/controllers/Report_controller.dart';
import 'package:proyecto_1/ui/pages/controllers/login_controller.dart';
import 'package:proyecto_1/ui/pages/pages/login.dart';


class Reportlist extends StatefulWidget {
  const Reportlist({super.key});

  @override
  State<Reportlist> createState() => _Reportlist();
}

class _Reportlist extends State<Reportlist> {
  //ReportController reportController = Get.find();
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bienvenido"), actions: [
        IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
               loginController.logout();
               Get.offAll(const LoginScreen(
                            key: Key('LoginScreen'),
                          ));
            }),
      ]),
      //body: Center(child: _getXlistView()),
      //floatingActionButton: FloatingActionButton(
      //  onPressed: () async {
      //    //logInfo("Add user from UI");
      //    //Get.to(() => const NewUserPage());
      //  },
      //  child: const Icon(Icons.add),
      //),
    );
  }

  //Widget _getXlistView() {
  //  return Obx(
  //    () => ListView.builder(
  //      itemCount: ReportController.users.length,
  //      itemBuilder: (context, index) {
  //        User user = userController.users[index];
  //        return Dismissible(
  //          key: UniqueKey(),
  //          background: Container(
  //              color: Colors.red,
  //              alignment: Alignment.centerLeft,
  //              child: const Padding(
  //                padding: EdgeInsets.only(left: 20),
  //                child: Text(
  //                  "Deleting",
  //                  style: TextStyle(color: Colors.white),
  //                ),
  //              )),
  //          onDismissed: (direction) {
  //            //userController.deleteUser(user.id!);
  //          },
  //          child: Card(
  //            child: ListTile(
  //              title: Text(user.name),
  //              subtitle: Text(user.email),
  //              onTap: () {
  //                //Get.to(() => const EditUserPage(),
  //                    arguments: [user, user.id]);
  //              },
  //            ),
  //          ),
  //        );
  //      },
  //    ),
  //  );
  //}
}
