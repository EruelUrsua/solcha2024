import 'package:flutter/material.dart';

class LanguageDropdown extends StatefulWidget {
  //const LanguageDropdown({super.key});
  //final GlobalKey key = GlobalKey();  // final List<String> languages;
  // final ValueChanged<int> onChange;

  //final Function() onDropDownChanged;

  LanguageDropdown({
    Key? key,
    //required this.onDropDownChanged,
    //required this.languages,
    //required this.onChange,
  }) : super(key: key);

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

const List<String> langs = <String>[
  'Tagalog',
  'English',
  'Cebuano',
  'Bisaya',
  'Ilocano'
];

class _LanguageDropdownState extends State<LanguageDropdown> {
  //GlobalKey _key = key;

  String selectedItem = langs.first;

  // AnimationController? _animationController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 8.0, bottom: 8.0),
      child: DropdownButton(
        value: selectedItem,
        hint: Text(
          'Languages',
          style: TextStyle(
            color: const Color(0xFF8E8BE6),
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(Icons.add),
        items: langs.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            selectedItem = value!;
          });
        },
      ),
    );
  }
}
