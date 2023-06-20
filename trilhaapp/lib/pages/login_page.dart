import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "t");
  TextEditingController passwordController = TextEditingController(text: "1");

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  margin: const EdgeInsets.only(top: 60),
                  child: Center(
                    child: Image.network(
                      "https://as1.ftcdn.net/v2/jpg/05/24/44/10/1000_F_524441051_APX4pWcQaBS3gN33Js5myH6ZF1mqibTc.jpg",
                      width: 150,
                      height: 100,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color.fromARGB(255, 119, 118, 118),
                      ),
                      contentPadding: EdgeInsets.only(top: 10),
                      enabledBorder: OutlineInputBorder(),
                      hintText: "E-mail",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ), //email
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: TextField(
                    obscureText: isObscureText,
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.key_off_outlined,
                        color: Color.fromARGB(255, 119, 118, 118),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(
                            color: const Color.fromARGB(255, 119, 118, 118),
                            isObscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility),
                      ),
                      contentPadding: const EdgeInsets.only(top: 10),
                      enabledBorder: const OutlineInputBorder(),
                      hintText: "Password",
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ), // senha
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      emailController.text.trim() == "t" &&
                              passwordController.text.trim() == "1"
                          ? Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainPage()))
                          : ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Erro ao efetuar Login"),
                              ),
                            );
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.blueAccent)),
                    child: const Text(
                      "Entrar",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ), // login
                const SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Text("Esqueceu a Senha"),
                      ),
                      Center(
                        child: Text("Cadastre aqui"),
                      )
                    ],
                  ),
                ), // cadastro e esqueceu a senha
              ],
            ),
          ),
        ),
      ),
    );
  }
}
