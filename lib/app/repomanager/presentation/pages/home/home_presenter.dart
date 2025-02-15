import 'package:repomanager/app/repomanager/presentation/pages/home/home_store.dart';
import 'package:repomanager/app/repomanager/shared/injector/injector.dart';

class HomePresenter {
  final homeStore = Injector.instance.get<HomeStore>();
}