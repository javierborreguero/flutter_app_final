import 'package:flutter_app_final/model/Questions.dart';

abstract class PrincipalView {
  openAnswersScreen(int position);

  showQuestions(List<Questions> questions);

  showLoading();

  hideLoading();

  showError();


}
