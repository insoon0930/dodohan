import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginationController extends GetxController {
  static const _pageSize = 20;
  final PagingController<int, String> pagingController = PagingController(firstPageKey: 0);
  final List<String> items = [];

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      //todo   여기다가
      final newItems = List.generate(_pageSize, (index) => 'Item ${index + pageKey}');
      items.addAll(newItems);
      final isLastPage = items.length >= 100;
      if (isLastPage) {
        pagingController.appendLastPage(items);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}