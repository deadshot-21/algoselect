import 'package:algoselect/constants.dart';
import 'package:algoselect/header.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Results extends StatefulWidget {
  const Results({super.key, required this.results});
  final List results;
  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    print(widget.results);
    return Scaffold(
        backgroundColor: kHeader,
        appBar: AppBar(
            toolbarHeight: 95,
            centerTitle: true,
            backgroundColor: kHeader,
            title: Image.asset('${imagePath}logo.png',
                width: MediaQuery.of(context).size.width * 0.38)),
        body: Container(
          height: MediaQuery.of(context).size.height - 100,
          decoration: BoxDecoration(
              color: kText,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.results[0].toString(),
                    style: TextStyle(
                        fontSize: 28,
                        color: kHeader,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Number of Question Answered: ${numberOfQuestions.toString()}",
                    style: TextStyle(
                        fontSize: 14,
                        color: kHeader,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Security: ",
                            style: TextStyle(
                                fontSize: 14,
                                color: kHeader,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            widget.results[1].toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: kHeader,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Flexibility: ",
                            style: TextStyle(
                                fontSize: 14,
                                color: kHeader,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            widget.results[5].toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: kHeader,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Runtime Efficiency:",
                            style: TextStyle(
                                fontSize: 14,
                                color: kHeader,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            widget.results[2].toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: kHeader,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Block Length: ",
                            style: TextStyle(
                                fontSize: 14,
                                color: kHeader,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            widget.results[8].toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: kHeader,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ease of Implementation: ",
                        style: TextStyle(
                            fontSize: 14,
                            color: kHeader,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      InkWell(
                        onTap: () async {
                          launchUrl(Uri.parse(links[widget.results[0]]));
                        },
                        child: Text(
                          widget.results[3].toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: kHeader,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Use Cases:",
                        style: TextStyle(
                            fontSize: 14,
                            color: kHeader,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          widget.results[4].toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 14,
                              color: kHeader,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Scalability:",
                            style: TextStyle(
                                fontSize: 14,
                                color: kHeader,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            widget.results[6].toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: kHeader,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Key Size:",
                            style: TextStyle(
                                fontSize: 14,
                                color: kHeader,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            widget.results[7].toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: kHeader,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Probable Attacks: ",
                        style: TextStyle(
                            fontSize: 14,
                            color: kHeader,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          widget.results[9].toString(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 14,
                              color: kHeader,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          "Empirical Time (on ECB mode on a P-4 2.4 GHz machine): ",
                          style: TextStyle(
                              fontSize: 14,
                              color: kHeader,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        empirical_time[widget.results[0].toString()],
                        style: TextStyle(
                            fontSize: 14,
                            color: kHeader,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // if (selectedIndex != -1) {
                        responses = [];
                        numberOfQuestions = 0;
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Header()));
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kButton,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                ],
              ),
            ),
          ),
        ));
  }
}
