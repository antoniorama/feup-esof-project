import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/languages_remote_selection_model.dart';

class LanguageConsumer extends StatelessWidget {

  final String language;

  const LanguageConsumer({Key? key, required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageSelectionModel>(
      builder: (_, provider, __) => CheckboxListTile(
        activeColor: const Color.fromRGBO(102, 152, 173, 1),
        title: Text(
          language,
          style: const TextStyle(
            color: Color(0xffffffff),
            fontFamily: 'Poppins',
            fontSize: 20,
            height: 1.3,
          ),
        ),
        value: provider.selectedLanguages.contains(language),
        onChanged: (value) {
          provider.toggleLanguage(language);
        },
      ),
    );
  }
}
