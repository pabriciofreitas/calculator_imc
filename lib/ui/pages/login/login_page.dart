import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../components/app_images.dart';
import 'widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: const [1, 0.32],
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primary,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.10,
                  bottom: size.height * 0.15,
                ),
                child: Image.asset(
                  AppImages.logoLogin,
                  width: size.width * 0.424,
                  height: size.height * 0.11,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * 0.15,
                ),
                alignment: Alignment.topLeft,
                child: const TextLoginWidget(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.055, bottom: size.height * 0.03),
                child: TextFieldLoginWidget(
                  size: size,
                  text: "usuario",
                ),
              ),
              TextFieldLoginWidget(
                size: size,
                text: "senha",
                isObscureText: true,
              ),
              Container(
                height: size.height * 0.03,
              ),
              CustomButton(
                text: "ENTRAR",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/home");
                },
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




  // Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => const HomePage()));