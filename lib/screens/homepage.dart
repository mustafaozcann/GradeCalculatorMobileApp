import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grade_calculator_app/constants/app_constants.dart';
import 'package:grade_calculator_app/helper/data_helper.dart';
import 'package:grade_calculator_app/models/lesson.dart';
import 'package:grade_calculator_app/widgets/show_grade.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _selectedLetterValue = 4;
  double _selectedCreditValue = 1;
  String _lessonName = "";

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          Constants.titleText,
          textAlign: TextAlign.center,
          style: Constants.titleStyle,
        ),
      ),
      body: buildBody(),
    );
  }

  Column buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(flex: 2, child: _buildForm()),
            Expanded(
                flex: 1,
                child: ShowGrade(
                    gradeAverage: DataHelper.gradeCalculate(),
                    lessonCount: DataHelper.allAddedLesson.length)),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(child: _buildListview()),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: Constants.horizontalPadding,
              child: _buildTextFormField(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                      padding: Constants.horizontalPadding,
                      child: _buildGradeDropdown()),
                ),
                Expanded(
                  child: Padding(
                      padding: Constants.horizontalPadding,
                      child: _buildCreditDropdown()),
                ),
                IconButton(
                    onPressed: (() {
                      _addLessonAndGradeCalculate();
                    }),
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Constants.mainColor,
                      size: 32,
                    )),
              ],
            ),
          ],
        ));
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
      ],
      validator: (s) {
        if (s.toString().length <= 0) {
          return "Ders adı giriniz";
        }
        return null;
      },
      textCapitalization: TextCapitalization.sentences,
      onSaved: (newValue) {
        setState(() {
          _lessonName = newValue.toString();
        });
      },
      decoration: InputDecoration(
        hintText: "Matematik",
        border: OutlineInputBorder(
            borderRadius: Constants.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Constants.mainColor.shade100.withOpacity(0.3),
      ),
    );
  }

  _buildGradeDropdown() {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropdownPadding,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.3),
          borderRadius: Constants.borderRadius),
      child: DropdownButton<double>(
        value: _selectedLetterValue,
        onChanged: (selectedLetter) {
          setState(() {
            _selectedLetterValue = selectedLetter as double;
          });
        },
        items: DataHelper.allLessonLetterDropdown(),
        underline: Container(),
        iconEnabledColor: Constants.mainColor.shade200,
      ),
    );
  }

  _buildCreditDropdown() {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropdownPadding,
      decoration: BoxDecoration(
          color: Constants.mainColor.shade100.withOpacity(0.3),
          borderRadius: Constants.borderRadius),
      child: DropdownButton<double>(
        value: _selectedCreditValue,
        onChanged: (selectedCreditPoint) {
          setState(() {
            _selectedCreditValue = selectedCreditPoint as double;
          });
        },
        items: DataHelper.allCreditDropdown(),
        underline: Container(),
        iconEnabledColor: Constants.mainColor.shade200,
      ),
    );
  }

  _buildListview() {
    List<Lesson> allLessons = DataHelper.allAddedLesson;
    return allLessons.length > 0
        ? ListView.builder(
            itemCount: allLessons.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (n) {
                  DataHelper.allAddedLesson.removeAt(index);
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    color: Constants.harmoniColor,
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Constants.mainColor,
                          child: Text(
                              "${(allLessons[index].creditPoint * allLessons[index].letterPoint).toStringAsFixed(0)}")),
                      title: Text(allLessons[index].lessonName),
                      subtitle: Text(
                          "${allLessons[index].creditPoint} Kredi, Not Değeri : ${allLessons[index].letterPoint}"),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Container(
            child: Text(
              "Lütfen Ders Ekleyiniz",
              style: Constants.titleStyle,
            ),
          ));
  }

  void _addLessonAndGradeCalculate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var addLesson = Lesson(
          lessonName: _lessonName,
          letterPoint: _selectedLetterValue,
          creditPoint: _selectedCreditValue);

      DataHelper.addLesson(addLesson);

      setState(() {});
    }
  }
}
