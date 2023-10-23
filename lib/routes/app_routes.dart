abstract class Routes {
  static const splash = '/';
  static const loginBy = '/login-by';
  static const login = '/login';
  static const register = '/register';
  static const waiting = '/waiting';
  static const lobby = '/lobby';

  static const admin = Paths.admin;
  static const test = Paths.admin + Paths.test;
  static const profileImageRequest = Paths.admin + Paths.profileImageRequest;
  static const womanUser = Paths.admin + Paths.womanUser;
  static const match = Paths.admin + Paths.match;
  static const application = Paths.admin + Paths.application;

  static const meInfo = '/me-info';
  static const youInfo = '/you-info';
  static const dailyCard = '/daily-card';

  static const currentCard = Paths.currentCard;
  static const currentCardItem = Paths.currentCard + Paths.item;

  static const termsOfUse = '/terms-of-use';
  static const privacy = '/privacy';

  static const setting = Paths.setting;
  static const businessInfo = Paths.setting + Paths.businessInfo;
  static const inquire = Paths.setting + Paths.inquire;
  static const updates = Paths.setting + Paths.updates;
  static const questions = Paths.setting + Paths.questions;

  static const store = Paths.store;
  static const storeSuccess = Paths.store + Paths.success;
  static const storeFail = Paths.store + Paths.fail;
  static const storeHistory = Paths.store + Paths.history;
}

abstract class Paths {
  static const admin = '/admin';
  static const test = '/test';
  static const profileImageRequest = '/profile-image-request';
  static const womanUser = '/woman-user';
  static const match = '/match';
  static const application = '/application';

  static const currentCard = '/current-card';
  static const item = '/item';

  static const setting = '/setting';
  static const businessInfo = '/business-info';
  static const inquire = '/inquire';
  static const updates = '/updates';
  static const questions = '/questions';

  static const store = '/store';
  static const success = '/success';
  static const fail = '/fail';
  static const history = '/history';
}
