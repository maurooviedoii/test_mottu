import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../core/di/di.dart';
import '../../core/route/app_routes.dart';
import 'error_page.dart';
import 'store/home_store.dart';
import 'widget/float_action_button_widget.dart';
import 'widget/grid_image_widget.dart';
import 'widget/loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController(initialScrollOffset: 0.0);
  final HomeStore _store = di<HomeStore>();
  final FocusNode _node = FocusNode();
  bool _isSearch = false;

  @override
  void initState() {
    super.initState();
    _store.fetchCharacters();

    reaction(
      (_) => _store.error,
      (String? error) {
        if (error != null) {
          Navigator.of(context).pushNamed(
            AppRoutes.error,
            arguments: ErrorPageArguments(() async {
              Navigator.of(context).pop();
              _store.updateOffset(value: 0);
              _store.updateError();
              await _store.fetchCharacters();
            }, error),
          );
        }
      },
    );

    _scrollController.addListener(
      () async {
        if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
            !_scrollController.position.outOfRange) {
          reaction(
            (_) => _store.isLoading,
            (bool value) {
              if (value) {
                showDialog(
                    barrierColor: Colors.grey,
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const LoadingWidget());
              } else {
                Navigator.of(context).pop();
              }
            },
          );

          await _store.fetchCharacters();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          floatingActionButton: _store.isLoading
              ? null
              : FloatActionButtonWidget(
                  iconData: _isSearch ? Icons.close : Icons.search_rounded,
                  onPressed: () {
                    _updateIsSearchCharacter();
                  }),
          body: GridImageWidget(
            characters: _store.characters,
            scrollController: _scrollController,
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: _isSearch
          ? TextField(
              focusNode: _node,
              decoration: const InputDecoration(hintText: 'Character'),
              onChanged: (value) => _store.findCharacter(value),
              onSubmitted: (String? value) {
                if (value == null || value.isEmpty || _store.characters.isEmpty) {
                  _updateIsSearchCharacter();
                }
              },
            )
          : const Text('Characters'),
    );
  }

  void _updateIsSearchCharacter() {
    setState(() {
      _isSearch = !_isSearch;
      if (_node.canRequestFocus) {
        _node.requestFocus();
      }
      if (!_isSearch) {
        _store.findCharacter('');
      }
    });
  }
}
