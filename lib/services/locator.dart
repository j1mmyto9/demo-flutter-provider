import 'package:my_app/features/favorites/controller/facorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void setupLocator() {
  // Get.lazyPut(() => ThemeService(), fenix: true);
}

List<SingleChildWidget> get setupProvider => [
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
    ];
