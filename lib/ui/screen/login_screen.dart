import 'package:app_navigator/app_navigator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/bloc/user/user_bloc.dart';
import 'package:trivia/ui/screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const route = 'sign_in';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoginForm(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Dont have an account?'),
              TextButton(
                  onPressed: () => {
                        AppNavigator().push(const RegisterScreen(),
                            name: RegisterScreen.route)
                      },
                  child: const Text('Sign up'))
            ],
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _key = GlobalKey<FormState>();
  final controllers = <String, TextEditingController>{};
  @override
  void initState() {
    controllers['email'] = TextEditingController(text: '');
    controllers['password'] = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login:',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: controllers['email'],
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if(value == '' || value == null) {
                  return 'Empty field';
                } else if(!EmailValidator.validate(value)){
                  return 'This field is only for email';
                }
                return null;
              },
              decoration: InputDecoration(
                label: const Text('Email'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.tealAccent.shade400,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controllers['password'],
              obscureText: true,
              decoration: InputDecoration(
                label: const Text('Password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.tealAccent.shade400,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder(
                bloc: context.read<UserBloc>(),
                builder: (context, state) {
                  if (state is InErrorState) {
                    return Card(
                      child: Text(
                        state.message,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.error),
                      ),
                    );
                  }
                  return Container();
                }),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      final validForm = _key.currentState?.validate();
                      if (validForm ?? false) {
                        context.read<UserBloc>().add(SignInEvent(
                            controllers['email']!.text,
                            controllers['password']!.text));
                        setState(() {});
                      }
                    },
                    child: const Text('Login'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
