//valueNotifier
//valueListenableBuilder: liste to the data change (you don't need the setState here)

import 'package:flutter/widgets.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(true);
