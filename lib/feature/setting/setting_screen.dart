import 'package:amary_cafe/data/api/model/dark_theme.dart';
import 'package:amary_cafe/data/api/model/notify.dart';
import 'package:amary_cafe/feature/setting/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Setting", style: Theme.of(context).textTheme.headlineMedium),
            Text(
              "Configure for smooth interaction.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dark Theme", style: Theme.of(context).textTheme.titleMedium),
            SizedBox.square(dimension: 4),
            ...DarkTheme.values.map(
              (state) => Consumer<SettingProvider>(
                builder: (_, provider, _) {
                  return RadioListTile(
                    value: state,
                    groupValue: provider.darkTheme,
                    title: Text(state.name),
                    onChanged: (value) async {
                      provider.changeTheme(value!);
                    },
                  );
                },
              ),
            ),
            SizedBox.square(dimension: 20),
            Text(
              "Scheduled 11AM Notification",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox.square(dimension: 4),
            ...Notify.values.map(
              (state) => Consumer<SettingProvider>(
                builder: (_, provider, _) {
                  return RadioListTile(
                    value: state,
                    groupValue: provider.notify,
                    title: Text(state.name),
                    onChanged: (value) async {
                      provider.changeNotify(value!);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
