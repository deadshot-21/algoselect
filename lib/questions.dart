import 'dart:convert';
import 'dart:io';

import 'package:algoselect/constants.dart';
import 'package:algoselect/header.dart';
import 'package:algoselect/loader.dart';
import 'package:algoselect/results.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, this.question, this.answer});
  final String? question;
  final String? answer;
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int currentQuestion = 0;
  int selectedIndex = -1;
  bool isLoading = true;

  Future<void> setQuestion() async {
    print(widget.question.toString());
    print(widget.answer.toString());
    try {
      Dio dio = Dio();
      Response response = await dio.post(
        "${baseUrl}nextQuestion",
        options: Options(
            headers: {HttpHeaders.contentTypeHeader: "application/json"}),
        data: FormData.fromMap({
          "current_question": widget.question,
          "user_answer": widget.answer,
        }),
      );
      print(responses);
      if (response.data['response']['next_question'] == "-1") {
        Response responseFinal = await dio.post(
          "${baseUrl}results",
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: "application/json"}),
          data: FormData.fromMap({"responses": jsonEncode(responses)}),
        );
        if (!mounted) return;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Results(
                      results: responseFinal.data['result']["algo_details"],
                    )));
      } else {
        setState(() {
          currentQuestion =
              int.parse(response.data['response']['next_question']);
        });
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.question != null && widget.answer != null) {
      setQuestion();
    } else if (widget.question != null) {
      setState(() {
        currentQuestion = int.parse(widget.question!) + 1;
        isLoading = false;
      });
    } else {
      setState(() {
        responses = [];
        isLoading = false;
      });
    }
    // setQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? loader(context)
        : Scaffold(
            backgroundColor: kHeader,
            body: Center(
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                decoration: BoxDecoration(
                    color: kText,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Select any one',
                          style: TextStyle(
                              fontSize: 20,
                              color: kHeader,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          questions[currentQuestion],
                          style: TextStyle(
                            fontSize: 16,
                            color: kHeader,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        for (var i = 0;
                            i < answers[currentQuestion].length;
                            i++) ...[
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 40,
                              height: 50,
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = i;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: (selectedIndex != -1 &&
                                              selectedIndex == i)
                                          ? kButton
                                          : kHeader,
                                      width: 1.5),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      answers[currentQuestion][i].toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: kHeader,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Icon(
                                      (selectedIndex != -1 &&
                                              selectedIndex == i)
                                          ? Icons.check_circle
                                          : Icons.circle_outlined,
                                      size: 20,
                                      color: (selectedIndex != -1 &&
                                              selectedIndex == i)
                                          ? kButton
                                          : kHeader,
                                    )
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 40,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  selectedIndex = 100;
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    color: (selectedIndex != -1 &&
                                            selectedIndex == 100)
                                        ? kButton
                                        : kHeader,
                                    width: 1.5),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Don't Know",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: kHeader,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Icon(
                                    (selectedIndex != -1 &&
                                            selectedIndex == 100)
                                        ? Icons.check_circle
                                        : Icons.circle_outlined,
                                    size: 20,
                                    color: (selectedIndex != -1 &&
                                            selectedIndex == 100)
                                        ? kButton
                                        : kHeader,
                                  )
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  // if (selectedIndex != -1) {
                                  responses = [];
                                  numberOfQuestions = 0;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Header()));
                                  // }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kButton,
                                  elevation: 0,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                child: Text(
                                  'RESTART',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: kText,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () async {
                                  numberOfQuestions = currentQuestion + 1;
                                  if (selectedIndex != -1 &&
                                      currentQuestion != 2 &&
                                      selectedIndex != 100) {
                                    // Navigator.of(context).pop();
                                    responses.add([
                                      currentQuestion,
                                      answers[currentQuestion][selectedIndex]
                                    ]);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Header(
                                                  question: currentQuestion
                                                      .toString(),
                                                  answer:
                                                      selectedIndex.toString(),
                                                )));
                                  } else if (selectedIndex != -1 &&
                                      currentQuestion == 2) {
                                    responses.add([
                                      currentQuestion,
                                      answers[currentQuestion][1]
                                    ]);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Header(
                                                  question: currentQuestion
                                                      .toString(),
                                                  answer: "0",
                                                )));
                                  } else if (selectedIndex == 100) {
                                    // responses.add([
                                    //   currentQuestion,
                                    //   "Don't Know"
                                    // ]);
                                    if (currentQuestion != 8) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Header(
                                                    question: currentQuestion
                                                        .toString(),
                                                  )));
                                    } else {
                                      Dio dio = Dio();
                                      Response responseFinal = await dio.post(
                                        "${baseUrl}results",
                                        options: Options(headers: {
                                          HttpHeaders.contentTypeHeader:
                                              "application/json"
                                        }),
                                        data: FormData.fromMap({
                                          "responses": jsonEncode(responses)
                                        }),
                                      );
                                      if (!mounted) return;
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Results(
                                                    results: responseFinal
                                                            .data['result']
                                                        ["algo_details"],
                                                  )));
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kButton,
                                  elevation: 0,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                child: Text(
                                  'NEXT',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: kText,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
