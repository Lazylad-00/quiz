import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/presentation/pages/questionPage.dart';

import '../bloc/bloc/connectivitybloc.dart';

class ConnectivityCheck extends StatelessWidget {
  const ConnectivityCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is ConnectivityGainedState) {
            return HomePage();
          } else if (state is ConnectivityLostState) {
            return Center(
              child: const Text(
                "Internet Gone",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return Center(
              child: const Text(
                "Loading",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Game"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Welcome to the Quiz Game",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "There will be 20 easy question on General Knowledge for every correct answer you will be granted 1 marks and non for wrong answer",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Questions()));
              },
              icon: Icon(
                Icons.arrow_circle_right_rounded,
                size: 50.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
