import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_ddd/domain/auth/i_auth_facade.dart';

@GenerateMocks([MyAuthFacade])
class MyAuthFacade extends Mock implements IAuthFacade {}
