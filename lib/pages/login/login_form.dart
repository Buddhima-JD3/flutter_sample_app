import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login_bloc.dart';
import '../../bloc/login_event.dart';
import '../../bloc/login_state.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      if (state is LoginLoading) {
        return const CircularProgressIndicator();
      } else {
        return Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.transparent, // Make card transparent
                elevation: 4.0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/highway.jpg"),
                      fit: BoxFit.fitHeight,
                      colorFilter: ColorFilter.mode(
                        Colors.lightBlue.withOpacity(0.85), 
                        BlendMode.srcATop, // Apply color filter as overlay
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _usernameController,
                          style: TextStyle(color: Colors.white), // Text color to white
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(color: Colors.white), // Label color to white
                            errorText:
                                state.usernameValid ? null : 'Invalid Username',
                            errorStyle: TextStyle(color: Colors.white), // Error color to white
                            suffixIcon: Icon(Icons.email, color: Colors.white), // Icon color to white
                          ),
                          onChanged: (value) {
                            BlocProvider.of<LoginBloc>(context)
                                .add(UsernameChanged(username: value));
                          },
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(color: Colors.white), // Text color to white
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white), // Label color to white
                            errorText: state.passwordValid
                                ? null
                                : 'Invalid password',
                            errorStyle: TextStyle(color: Colors.white), // Error color to white
                            suffixIcon: Icon(Icons.lock, color: Colors.white), // Icon color to white
                          ),
                          onChanged: (value) {
                            BlocProvider.of<LoginBloc>(context)
                                .add(PasswordChanged(password: value));
                          },
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity, // makes the button expand to fill the space
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<LoginBloc>(context)
                                  .add(LoginSubmitted());
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white), // Button text color to white
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange, // button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // round pill shape
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20), 
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    },
  );
}

}
