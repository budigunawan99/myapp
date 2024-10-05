import 'package:flutter/material.dart';
import 'package:uwunotes/widgets/theme_switcher.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isFirstPage;
  const Appbar({super.key, required this.isFirstPage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Uwunotes'),
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(11.0, 11.0, 0, 11.0),
        child: leadingOptions(context),
      ),
      actions: const [ThemeSwitcher()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget leadingOptions(context) {
    if (isFirstPage) {
      return Image.asset('images/uwulogo.png');
    } else {
      return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios, size: 25,),
      );
    }
  }
}
