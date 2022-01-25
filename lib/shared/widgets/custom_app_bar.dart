import 'package:flutter/material.dart';

import '../../ui/components/components.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  final List<String> pageViewNames;
  const CustomAppBar({
    Key? key,
    required this.size,
    required this.pageViewNames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        },
      ),
      centerTitle: true,
      title: Expanded(
        child: Row(
          children: [
            Image.asset(AppImages.logoHome),
            Container(
              width: size.width * 0.1,
            ),
            Text(
              pageViewNames[1],
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // setState(() {});
          },
          icon: const Icon(
            Icons.autorenew,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
