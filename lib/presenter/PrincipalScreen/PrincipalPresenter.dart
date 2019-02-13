import 'dart:convert';

import 'package:flutter_app_final/model/Questions.dart';
import 'package:flutter_app_final/presenter/PrincipalScreen/PrincipalView.dart';
import 'package:flutter_app_final/presenter/Answers/AnswersScreen.dart';
import 'package:http/http.dart' as network;

class PrincipalPresenter {
  PrincipalView _view;

  PrincipalPresenter(this._view);

  fetchData() async {
    _view.showLoading();
    network.Response response =
        await network.get('https://opentdb.com/api.php?amount=10');
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      List<Questions> questions = jsonBody['results'].map<Questions>((element) {
        String category = element['category'];
        String type = element['type'];
        String difficulty = element['difficulty'];
        String question = element['question'];
        return Questions(category, type, difficulty, question);
      }).toList();
      _view.showQuestions(questions);
    } else {
      _view.showError();
    }
    _view.hideLoading();
  }

  elementClicked(int position) {
    _view.openAnswersScreen(position);
  }
}
