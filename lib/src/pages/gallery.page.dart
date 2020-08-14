// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
// import 'package:gallery/l10n/gallery_localizations.dart';

enum GridListDemoType {
  imageOnly,
  header,
  footer,
}

class GridListDemo extends StatelessWidget {
  const GridListDemo({Key key, this.type}) : super(key: key);

  final GridListDemoType type;

  List<_Photo> _photos(BuildContext context) {
    return [
      _Photo(
        assetName:
            'http://3.bp.blogspot.com/-gC-cPGYlbig/TekvY0261DI/AAAAAAAAC1g/PODaZEjS_qo/s1600/sasha_grey_photos_vryu2d.jpg',
        title: 'S gr 1',
        subtitle: 'Escritora',
      ),
      _Photo(
        assetName:
            'http://3.bp.blogspot.com/-gC-cPGYlbig/TekvY0261DI/AAAAAAAAC1g/PODaZEjS_qo/s1600/sasha_grey_photos_vryu2d.jpg',
        title: 'S gr 1',
        subtitle: 'Escritora',
      ),
      _Photo(
        assetName:
            'http://3.bp.blogspot.com/-gC-cPGYlbig/TekvY0261DI/AAAAAAAAC1g/PODaZEjS_qo/s1600/sasha_grey_photos_vryu2d.jpg',
        title: 'S gr 1',
        subtitle: 'Escritora',
      ),
      _Photo(
        assetName:
            'http://3.bp.blogspot.com/-gC-cPGYlbig/TekvY0261DI/AAAAAAAAC1g/PODaZEjS_qo/s1600/sasha_grey_photos_vryu2d.jpg',
        title: 'S gr 1',
        subtitle: 'Escritora',
      ),
      _Photo(
        assetName:
            'http://3.bp.blogspot.com/-gC-cPGYlbig/TekvY0261DI/AAAAAAAAC1g/PODaZEjS_qo/s1600/sasha_grey_photos_vryu2d.jpg',
        title: 'S gr 1',
        subtitle: 'Escritora',
      ),
      _Photo(
        assetName:
            'http://3.bp.blogspot.com/-gC-cPGYlbig/TekvY0261DI/AAAAAAAAC1g/PODaZEjS_qo/s1600/sasha_grey_photos_vryu2d.jpg',
        title: 'S gr 1',
        subtitle: 'Escritora',
      ),
      _Photo(
        assetName:
            'http://3.bp.blogspot.com/-gC-cPGYlbig/TekvY0261DI/AAAAAAAAC1g/PODaZEjS_qo/s1600/sasha_grey_photos_vryu2d.jpg',
        title: 'S gr 1',
        subtitle: 'Escritora',
      ),
      _Photo(
        assetName:
            'http://3.bp.blogspot.com/-gC-cPGYlbig/TekvY0261DI/AAAAAAAAC1g/PODaZEjS_qo/s1600/sasha_grey_photos_vryu2d.jpg',
        title: 'S gr 1',
        subtitle: 'Escritora',
      ),
      _Photo(
        assetName:
            'http://3.bp.blogspot.com/-gC-cPGYlbig/TekvY0261DI/AAAAAAAAC1g/PODaZEjS_qo/s1600/sasha_grey_photos_vryu2d.jpg',
        title: 'S gr 1',
        subtitle: 'Escritora',
      ),
      _Photo(
        assetName:
            'http://3.bp.blogspot.com/-gC-cPGYlbig/TekvY0261DI/AAAAAAAAC1g/PODaZEjS_qo/s1600/sasha_grey_photos_vryu2d.jpg',
        title: 'S gr 1',
        subtitle: 'Escritora',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      childAspectRatio: 1,
      children: _photos(context).map<Widget>((photo) {
        return _GridDemoPhotoItem(
          photo: photo,
          tileStyle: type,
        );
      }).toList(),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     title: Text('Galeria'),
    //   ),
    //   body: GridView.count(
    //     crossAxisCount: 1,
    //     mainAxisSpacing: 8,
    //     crossAxisSpacing: 8,
    //     padding: const EdgeInsets.all(8),
    //     childAspectRatio: 1,
    //     children: _photos(context).map<Widget>((photo) {
    //       return _GridDemoPhotoItem(
    //         photo: photo,
    //         tileStyle: type,
    //       );
    //     }).toList(),
    //   ),
    // );
  }
}

class _Photo {
  _Photo({
    this.assetName,
    this.title,
    this.subtitle,
  });

  final String assetName;
  final String title;
  final String subtitle;
}

/// Allow the text size to shrink to fit in the space
class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  _GridDemoPhotoItem({
    Key key,
    @required this.photo,
    @required this.tileStyle,
  }) : super(key: key);

  final _Photo photo;
  final GridListDemoType tileStyle;
  final GridListDemoType tileStyles = GridListDemoType.footer;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        // 'http://3.bp.blogspot.com/-gC-cPGYlbig/TekvY0261DI/AAAAAAAAC1g/PODaZEjS_qo/s1600/sasha_grey_photos_vryu2d.jpg',
        photo.assetName,
        // package: 'flutter_gallery_assets',
        fit: BoxFit.cover,
      ),
    );

    switch (tileStyles) {
      case GridListDemoType.imageOnly:
        return image;
      case GridListDemoType.header:
        return GridTile(
          header: Material(
            color: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
            ),
            clipBehavior: Clip.antiAlias,
            child: GridTileBar(
              title: _GridTitleText(photo.title),
              backgroundColor: Colors.black45,
            ),
          ),
          child: image,
        );
      case GridListDemoType.footer:
        return GridTile(
          footer: Material(
            color: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Row(
              children: [
                FlatButton.icon(
                  onPressed: () {
                    print('hola');
                  },
                  color: Colors.purpleAccent[200],
                  icon: const Icon(Icons.not_interested, color: Colors.white),
                  label: Text('Hate', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 3),
                FlatButton.icon(
                  onPressed: () {
                    print('hola');
                  },
                  color: Colors.purpleAccent[200],
                  icon: const Icon(Icons.file_download, color: Colors.white),
                  label:
                      Text('Descargar', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            // GridTileBar(
            //   backgroundColor: Colors.black45,
            //   title: _GridTitleText(photo.title),
            //   subtitle: _GridTitleText(photo.subtitle),
            // ),
          ),
          child: image,
        );
    }
    return null;
  }
}
