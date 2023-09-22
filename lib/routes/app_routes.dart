abstract class Routes {
  static const splash = '/';
  static const loginBy = '/login-by';
  static const login = '/login';
  static const register = '/register';
  static const waiting = '/waiting';
  static const lobby = '/lobby';
  static const admin = '/admin';
  static const test = '/test'; //hm
  static const profileImageRequest = '/profile-image-request'; //hm
  static const womanUser = '/woman-user'; //hm
  static const match = '/match'; //hm
  static const application = '/application'; //hm
  static const meInfo = '/me-info';
  static const youInfo = '/you-info';
  static const dailyCard = '/daily-card';
  static const termsOfUse = '/terms-of-use';
  static const privacy = '/privacy';
  static const setting = '/setting';
  static const businessInfo = Paths.setting + Paths.businessInfo;
  static const inquire = Paths.setting + Paths.inquire;
  static const updates = Paths.setting + Paths.updates;
  static const questions = Paths.setting + Paths.questions;
  static const store = Paths.store;
  static const storeSuccess = Paths.store + Paths.success;
  static const storeFail = Paths.store + Paths.fail;
}

abstract class Paths {
  static const setting = '/setting';
  static const businessInfo = '/business-info';
  static const inquire = '/inquire';
  static const updates = '/updates';
  static const questions = '/questions';

  static const store = '/store';
  static const success = '/success';
  static const fail = '/fail';
}
