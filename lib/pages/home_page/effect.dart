import 'package:dogetv_flutter/pages/category_page/page.dart';
import 'package:dogetv_flutter/pages/search_page/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:dogetv_flutter/pages/home_page/action.dart';
import 'package:dogetv_flutter/pages/home_page/state.dart';
import 'package:dogetv_flutter/pages/tv_page/page.dart';
import 'package:dogetv_flutter/repository/dogeTV.dart';

Effect<HomePageState> buildEffect() {
  return combineEffects(<Object, Effect<HomePageState>>{
    Lifecycle.initState: _init,
    HomePageAction.onFetch: _onFetch,
    HomePageAction.onShowTV: _onShowTV,
    HomePageAction.onShowLibrary: _onShowLibrary,
    HomePageAction.onShowSearch: _onShowSearch
  });
}

dynamic _init(Action action, Context<HomePageState> ctx) async {
  APIs.getHome().then((home) {
    ctx.dispatch(HomePageActionCreator.didLoadAction(home));
  });
}

void _onFetch(Action action, Context<HomePageState> ctx) async {
  APIs.getHome().then((home) {
    ctx.dispatch(HomePageActionCreator.didLoadAction(home));
  });
}

void _onShowTV(Action action, Context<HomePageState> ctx) async {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return TVPage().buildPage(null);
  }));
}

void _onShowLibrary(Action action, Context<HomePageState> ctx) async {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return CategoryPage().buildPage({"index": 0});
  }));
}

void _onShowSearch(Action action, Context<HomePageState> ctx) async {
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return SearchPage().buildPage(action.payload);
  }));
}
