import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class InfiniteAlbumList extends StatefulWidget {
  @override
  _InfiniteAlbumListState createState() => _InfiniteAlbumListState();
}

class _InfiniteAlbumListState extends State<InfiniteAlbumList> {
  final _scrollController = ScrollController();
  final _pageSize = 20; // 페이지당 이미지 수
  List<AssetEntity> _images = [];
  int _currentPage = 0;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchImages();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchImages() async {
    final albums = await PhotoManager.getAssetPathList(
      onlyAll: true,
      type: RequestType.image,
    );
    final album = albums.first;
    final images = await album.getAssetListPaged(page: _currentPage, size: _pageSize);
    if (images.isEmpty) {
      setState(() {
        _hasMore = false;
      });
    } else {
      setState(() {
        _images.addAll(images);
        _currentPage++;
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (_hasMore) {
        _fetchImages();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Infinite Album List')),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _hasMore ? _images.length + 1 : _images.length,
        itemBuilder: (context, index) {
          if (index == _images.length) {
            return Center(child: CircularProgressIndicator());
          }
          final image = _images[index];
          return ListTile(
            leading: Container(
                width: 80,
                height: 80,
                color: Colors.orangeAccent,
                child: Image(
                  image: AssetEntityImageProvider(image),
                  fit: BoxFit.cover,
                )),
            // title: Text(image.title),
          );
        },
      ),
    );
  }
}
