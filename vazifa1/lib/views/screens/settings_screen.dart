import 'package:flutter/material.dart';
import 'package:lesson43/utils/app_constants.dart';
import 'package:lesson43/views/widgets/custom_drawer.dart';
import 'package:lesson43/views/widgets/save_data.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  const SettingsScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final imageController = TextEditingController();
  final _textColors = [
    0xffFA0808,
    0xff01C8E3,
    0xff01E350,
    0xff060606,
  ];
  final _interfeysColors = [
    0xffFFC300,
    0xff9F1BEA,
    0xff0906CE,
  ];

  @override
  void dispose() {
    imageController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppConstants.interfeysColor),
        title: Text(
          "Sozlamalar",
          style: TextStyle(
              fontSize: AppConstants.textSize,
              color: Color(AppConstants.textColor)),
        ),
        actions: [
          DropdownButton(
            borderRadius: BorderRadius.circular(20),
            dropdownColor: Color(AppConstants.interfeysColor),
            menuMaxHeight: 200,
            isDense: true,
            value: AppConstants.checkLanguage,
            items: [
              DropdownMenuItem(
                value: 0,
                child: Text(
                  "Uz",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: Color(AppConstants.textColor)),
                ),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text(
                  "Eng",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: Color(AppConstants.textColor)),
                ),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text(
                  "Ru",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: Color(AppConstants.textColor)),
                ),
              ),
            ],
            onChanged: (value) {
              saveCheckLanguage(value!);
              setState(() {
                AppConstants.checkLanguage = value;
              });
            },
          ),
          IconButton(
            onPressed: () {
              saveBackgroundImageUrl(imageController.text);
              String imageUrl = imageController.text;
              imageController.clear();
              widget.onBackgroundImageChanged(imageUrl);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: CustomDrawer(
        onThemeChanged: widget.onThemeChanged,
        onBackgroundImageChanged: widget.onBackgroundImageChanged,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: AppConstants.backgroundImageUrl.isEmpty
              ? null
              : DecorationImage(
                  image: NetworkImage(AppConstants.backgroundImageUrl),
                ),
        ),
        child: ListView(
          children: [
            SwitchListTile(
              value: AppConstants.themeMode == ThemeMode.dark,
              onChanged: widget.onThemeChanged,
              title: Text(
                "Tungi holat",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: Color(AppConstants.textColor)),
              ),
            ),
            TextField(
              controller: imageController,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Text hajmini tanlang hozirgi holat: ${AppConstants.textSize}',
                    style: TextStyle(
                        fontSize: AppConstants.textSize,
                        color: Color(AppConstants.textColor)),
                  ),
                  Slider(
                    value: AppConstants.textSize,
                    min: 14,
                    max: 30,
                    divisions: 16,
                    label: AppConstants.textSize.round().toString(),
                    onChanged: (double value) {
                      saveTextSize(value);
                      setState(() {
                        AppConstants.textSize = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Text Rangini tanlang: ',
                      style: TextStyle(
                          fontSize: AppConstants.textSize,
                          color: Color(AppConstants.textColor)),
                    ),
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(20),
                    dropdownColor: Color(AppConstants.interfeysColor),
                    menuMaxHeight: 200,
                    isDense: true,
                    value: AppConstants.checkTextColor,
                    items: [
                      DropdownMenuItem(
                        value: 0,
                        child: Text(
                          "Qizil",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: Color(AppConstants.textColor)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text(
                          "Havorang",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: Color(AppConstants.textColor)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text(
                          "Yashil",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: Color(AppConstants.textColor)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text(
                          "Qora",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: Color(AppConstants.textColor)),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      AppConstants.checkTextColor = value!;
                      saveTextColor(
                          value, _textColors[AppConstants.checkTextColor]);
                      setState(() {
                        AppConstants.textColor =
                            _textColors[AppConstants.checkTextColor];
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Interfeys Rangini tanlang: ',
                      style: TextStyle(
                          fontSize: AppConstants.textSize,
                          color: Color(AppConstants.textColor)),
                    ),
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(20),
                    dropdownColor: Color(AppConstants.interfeysColor),
                    menuMaxHeight: 200,
                    isDense: true,
                    value: AppConstants.checkInterfeysColor,
                    items: [
                      DropdownMenuItem(
                        value: 0,
                        child: Text(
                          "Amber",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: Color(AppConstants.textColor)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text(
                          "Siyohrang",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: Color(AppConstants.textColor)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text(
                          "Ko'k",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: Color(AppConstants.textColor)),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      AppConstants.checkInterfeysColor = value!;
                      saveIntefeysColor(value,
                          _interfeysColors[AppConstants.checkInterfeysColor]);
                      setState(() {
                        AppConstants.interfeysColor =
                            _interfeysColors[AppConstants.checkInterfeysColor];
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
