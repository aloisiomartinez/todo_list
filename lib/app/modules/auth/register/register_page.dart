import 'package:flutter/material.dart';
import 'package:todo_list/app/core/ui/theme_extensions.dart';
import 'package:todo_list/app/core/widget/todo_list_field.dart';
import 'package:todo_list/app/core/widget/todo_list_logo.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordlEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordlEC.dispose();
    confirmPasswordEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo List',
              style: TextStyle(fontSize: 12, color: context.primaryColor),
            ),
            Text(
              'Cadastro',
              style: TextStyle(fontSize: 15, color: context.primaryColor),
            )
          ],
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: ClipOval(
            child: Container(
                color: context.primaryColor.withAlpha(20),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 20,
                  color: context.primaryColor,
                )),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * .5,
              child: FittedBox(
                child: TodoListLogo(),
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Form(
                child: Column(
                  children: [
                    TodoListField(
                      label: 'E-mail',
                      controller: emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido')
                      ]),
                    ),
                    SizedBox(height: 20),
                    TodoListField(
                      label: 'Senha',
                      obscureText: true,
                      controller: passwordlEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha obrigatória'),
                        Validatorless.min(6, 'Senha deve ter pelo menos 6 caracteres')
                      ]),
                    ),
                    SizedBox(height: 20),
                    TodoListField(
                      label: 'Confirmar Senha',
                      obscureText: true,
                      controller: confirmPasswordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha obrigatória'),
                      ]),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Salvar'),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
