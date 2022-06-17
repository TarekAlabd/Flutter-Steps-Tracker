import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.config.dart';

GetIt getIt = GetIt.instance;

@injectableInit
Future<GetIt> configure() async => $initGetIt(getIt);
