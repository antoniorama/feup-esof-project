import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/languages_remote_selection_model.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/views/widgets/languageConsumer.dart';
import 'package:myapp/views/widgets/rectangularButtonWidget.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LanguageSelectionDropdown extends StatefulWidget {
  const LanguageSelectionDropdown({super.key});

  @override
  State<LanguageSelectionDropdown> createState() =>
      _LanguageSelectionDropdownState();
}



class _LanguageSelectionDropdownState extends State<LanguageSelectionDropdown>{


  Color squaresColor = const Color.fromRGBO(102, 152, 173, 1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: ThemeData(
        unselectedWidgetColor: squaresColor,
      ),
      child: GestureDetector(
        onTap: () {
          Provider.of<LanguageSelectionModel>(context, listen: false)
              .toggleIsOpen();
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Atualiza as tuas competências \n para usá-las como filtro',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  color: const Color(0xffffffff),
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: ExpansionTile(
                  title: Selector<LanguageSelectionModel, String>(
                    selector: (_, provider) =>
                        provider.selectedLanguages.isNotEmpty
                            ? provider.selectedLanguages.join(', ')
                            : 'Linguagens de programação',
                    builder: (_, value, __) => Text(
                      value,
                      style: const TextStyle(
                        color: Color(0xffffffff),
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        height: 1.3,
                      ),
                    ),
                  ),
                  children: const [
                    LanguageConsumer(language: 'Python'),
                    LanguageConsumer(language: 'Java'),
                    LanguageConsumer(language: 'JavaScript'),
                    LanguageConsumer(language: 'SQL'),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: ExpansionTile(
                  title: Selector<LanguageSelectionModel, String>(
                    selector: (_, provider) =>
                    provider.selectedRemote.isNotEmpty
                        ? 'Interesse em trabalho remoto: Sim'
                        : 'Interesse em trabalho remoto',
                    builder: (_, value, __) => Text(
                      value,
                      style: const TextStyle(
                        color: Color(0xffffffff),
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        height: 1.3,
                      ),
                    ),
                  ),
                  children: [
                    Consumer<LanguageSelectionModel>(
                      builder: (_, provider, __) => CheckboxListTile(
                        activeColor: const Color.fromRGBO(102, 152, 173, 1),
                        title: const Text(
                          'Sim',
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            height: 1.3,
                          ),
                        ),
                        value: provider.selectedRemote.contains('Sim'),
                        onChanged: (value) {
                          if (value!) {
                            provider.toggleRemote(true);
                          } else {
                            provider.toggleRemote(false);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}
