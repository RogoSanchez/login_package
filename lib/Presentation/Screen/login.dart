import 'package:flutter/material.dart';
import 'package:login/Presentation/widgets/login_tab.dart';
import 'package:login/Presentation/widgets/signup_tab.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Container(
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: TabBar(
                      tabs: [
                        Tab(
                          child: Text(
                            "Iniciar",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Registrar",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ],

                      unselectedLabelColor: Color.fromARGB(255, 8, 6, 6),
                      labelColor: const Color.fromARGB(255, 245, 245, 245),
                      indicatorColor: const Color.fromARGB(255, 2, 3, 8),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: <double>[0.0, 1],
                        colors: <Color>[AppColor.secondary, AppColor.blue],
                      ),
                    ),
                    child: TabBarView(
                      children: [
                        // Log In Form
                        LogIn(),
                        // Sign Up Form
                        SignUp(),
                      ],
                    ),
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
