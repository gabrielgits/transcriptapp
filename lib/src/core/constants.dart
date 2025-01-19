class AppConstants {
  //app
  static const debug = bool.fromEnvironment('DEBUG_MODE', defaultValue: false);
  static const name = 'Transcript';
  static const schoolName = 'Instituto Superior Politecnico Lusíada de Benguela';
  static const version = '1.2';
  static const copyrith = 'Copyright © 2024 GV. All Rights Reserved.';
  static const dev = 'GV';
  static const suporteContacto = '+244943962996';
  static const suporteEmail = 'gabriel.vieira24@outlook.com';
  static const suporteLink = 'https://github.com/gabrielgits';

  //url
  static const url = debug ?  'http://10.0.2.2:8000' : 'https://stranscript.online';
  static const urlStorage = '$url/storage/';
  static const urlApi = '$url/api/v1';

  // keys
  static const keyApi = 'binary';

  static var updatedUserToken = '';
  
}
