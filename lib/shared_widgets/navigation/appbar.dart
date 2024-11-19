import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qmdb/services/connectivity_service.dart';

import '../../design/constants/assets.dart';

class QMDBAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const QMDBAppBar({super.key, this.leading, this.title});

  final Widget? leading;
  final Widget? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 18,
      leadingWidth: 48,
      leading: Padding(
        /// Asset has padding around the edges so this counters that to align the icon with 20px padding
        padding: const EdgeInsets.only(left: 17.0),
        child: leading ??
            FittedBox(
              child: SvgPicture.asset(QMDBAssets.qAgencyLogoSVG,
                  semanticsLabel: 'Q agency logo'),
            ),
      ),
      title: Text(
        ref.watch(connectivityProvider).when(data: (bool data) {
          return data ? 'Connected' : 'Not connected';
        }, error: (Object error, StackTrace stackTrace) {
          return 'Error reading connectivity state';
        }, loading: () {
          return 'Loading';
        }),
      ),
    );
  }
}
