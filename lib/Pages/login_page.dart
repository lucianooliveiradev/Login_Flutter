import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Informe o login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }
    return null;
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Text(
                //   "LRO",
                //   style: TextStyle(fontSize: 50),
                // ),
                // Container(
                //   color: Colors.black.withOpacity(0.8),
                //   height: MediaQuery.of(context).size.height,
                //   width: MediaQuery.of(context).size.width,
                // ),
                Container(
                  child: Image.asset("assets/images/logo.png"),
                ),
                textFormFieldLogin(),
                Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                textFormFieldSenha(),
                Container(
                  width: double.infinity,
                  height: 65,
                  child: containerButton(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField textFormFieldLogin() {
    return TextFormField(
      controller: _tLogin,
      validator: _validateLogin,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: "Login",
        labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
        border: OutlineInputBorder(),
        // hintText: "Informe o login",
      ),
    );
  }

  TextFormField textFormFieldSenha() {
    return TextFormField(
      controller: _tSenha,
      validator: _validateSenha,
      obscureText: true,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: "Senha",
        labelStyle: TextStyle(fontSize: 20.0, color: Colors.black),
        border: OutlineInputBorder(),
        // hintText: "Informe a senha",
      ),
    );
  }

  Container containerButton(BuildContext context) {
    return Container(
      height: 40.0,
      margin: EdgeInsets.only(top: 10.0),
      child: RaisedButton(
        color: Colors.blue,
        child: Text("Login",
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
        onPressed: () {
          _onClickLogin(context);
        },
      ),
    );
  }

  _onClickLogin(BuildContext context) {
    final login = _tLogin.text;
    final senha = _tSenha.text;

    /*if (!_formKey.currentState.validate()) {
      return;
    }*/
    if (login.isEmpty || senha.isEmpty) {
      showDialogLoginError(context);
    } else {
      if (login == "admin" && senha == "123") {
        // Navega exibindo o voltar na outra tela, rota manual
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => HomePage(
        //       title: "LRO",
        //     ),
        //   ),
        // );

        // Navega sem exibir o voltar na outra tela, rota manual
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (context) => HomePage(
        //       title: "Home",
        //     ),
        //   ),
        // );

        //Navega sem exibir o voltar na outra tela, rota automática
        Navigator.of(context).pushReplacementNamed("/home");
      } else {
        showDialogLoginError(context);
      }
    }
  }

  showDialogLoginError(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Erro"),
          content: Text("Login e/ou Senha inválido(s)"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
