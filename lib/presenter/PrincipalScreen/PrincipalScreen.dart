import 'package:flutter/material.dart';
import 'package:flutter_app_final/presenter/Answers/AnswersScreen.dart';
import 'package:flutter_app_final/presenter/PrincipalScreen/PrincipalPresenter.dart';
import 'package:flutter_app_final/presenter/PrincipalScreen/PrincipalView.dart';
import 'package:flutter_app_final/model/Questions.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen>
    implements PrincipalView {
  PrincipalPresenter _PrincipalPresenter;
  List<Questions> _questions = [];
  bool _isLoading = true;
  bool _isError = false;

  _PrincipalScreenState() {
    _PrincipalPresenter = PrincipalPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _PrincipalPresenter.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  @override
  hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  showError() {
    setState(() {
      _isError = true;
    });
  }

  @override
  showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  showQuestions(List<Questions> questions) {
    setState(() {
      this._questions = questions;
    });
  }

  @override
  openAnswersScreen(int position) {
    Navigator.push(context, MaterialPageRoute(builder: (c) {
      return AnswersScreen(position);
    }));
  }

  buildBody() {
    if (_isLoading) {
      return Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 90.0),
        child: CircularProgressIndicator(),
      ));
    } else if (_isError) {
      return Center(child: Text("Ha habido un error"));
    } else {
      return RefreshIndicator(
        onRefresh: () {
          _PrincipalPresenter.fetchData();
        },
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              leading: Icon(Icons.device_unknown),
              title: Text(_questions[position].question + " "),
              onTap: () {
                _PrincipalPresenter.elementClicked(position);
              },
            );
          },
          itemCount: _questions.length,
          reverse: false,
        ),
      );
    }
  }
}
