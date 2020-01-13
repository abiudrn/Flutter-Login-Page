import 'package:flutter_login_page/models/auth_state_model.dart';
import 'package:flutter_login_page/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model with UserModel, AuthStateModel {}
