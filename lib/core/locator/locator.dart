import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../modules/authentication/viewmodel/auth_vm.dart';
import '../base/bottom_nav_bar.dart';

///multi-providers as a single child widget
final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BottomNavModel()),
  ChangeNotifierProvider(create: (_) => AuthViewModel()),
];
