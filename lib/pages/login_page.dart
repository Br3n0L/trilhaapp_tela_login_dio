import 'package:flutter/material.dart';
import 'package:trilhaapp_tela_login_dio/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  var emailController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 8,
                        child: SizedBox(
                          child: Image.network(
                            "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Já tem cadastro?",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Faça seu login e make the change.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 50, 16, 6),
                    child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: emailController,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                            ),
                            labelText: "E-mail",
                            labelStyle: TextStyle(color: Colors.white))),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 1, 16, 16),
                    child: TextField(
                        controller: passwordController,
                        obscureText: obscureText,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon(
                                obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            labelText: "Senha",
                            labelStyle: const TextStyle(color: Colors.white))),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.purple)),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  TextButton(
                    onPressed: () {
                      print(emailController.text);
                      print(passwordController.text);
                      if (emailController.text.trim() == "email@email.com" &&
                          passwordController.text.trim() == "123") {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainPage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Erro ao efetuar o login")));
                      }
                    },
                    child: const Text(
                      "Esqueci minha senha",
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
