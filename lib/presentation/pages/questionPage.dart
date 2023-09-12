import 'package:flutter/material.dart';
import 'package:quiz_game/data/base_api.dart';
import 'package:quiz_game/data/question_model.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  Future<QuestionModel>? questions;
  @override
  void initState() {
    questions = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Questions"),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<QuestionModel>(
            future: questions,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.results.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Card(
                        elevation: 5.0,
                        margin: EdgeInsets.all(16.0),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                snapshot.data!.results[index].question,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20.0),
                              OptionButton(
                                text:
                                    snapshot.data!.results[index].correctAnswer,
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text('Correct answer'),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                              ),
                              OptionButton(
                                text: snapshot
                                    .data!.results[index].incorrectAnswers[0],
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text('Incorrect answer'),
                                    backgroundColor: Colors.red,
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                              ),
                              OptionButton(
                                text: snapshot
                                    .data!.results[index].incorrectAnswers[1],
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Incorrect answer'),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                              ),
                              OptionButton(
                                  text: snapshot
                                      .data!.results[index].incorrectAnswers[2],
                                  onPressed: () {
                                    final snackBar = SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('Incorrect answer'),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Test Complete'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                });
          },
          child: Text("Submit"),
        ));
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const OptionButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onPressed;
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
