import 'package:flutter/material.dart';

import '../../ui/components/app_images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  final List<String> pageViewNames;
  final ValueNotifier<int> indexPage;
  const CustomAppBar({
    Key? key,
    required this.size,
    required this.pageViewNames,
    required this.indexPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: indexPage,
      builder: (context, value, _) => AppBar(
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
                pageViewNames[value],
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ],
          ),
        ),
        actions: [
          value == 0
              ? IconButton(
                  onPressed: () {
                    // setState(() {});
                  },
                  icon: const Icon(
                    Icons.autorenew,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
