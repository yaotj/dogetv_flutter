import 'package:dogetv_flutter/pages/search_page/view.dart';
import 'package:dogetv_flutter/pages/search_page/effect.dart';
import 'package:dogetv_flutter/pages/search_page/state.dart';
import 'package:dogetv_flutter/pages/search_page/reducer.dart';
import 'package:dogetv_flutter/pages/search_page/adapter.dart';
import 'package:fish_redux/fish_redux.dart';

class SearchPage extends Page<SearchPageState, Map<String, dynamic>> {
  SearchPage()
      : super(
          view: buildView,
          effect: buildEffect(),
          initState: initState,
          reducer: buildReducer(),
          dependencies: Dependencies<SearchPageState>(
              adapter: NoneConn<SearchPageState>()+SearchResultListAdapter(),
              slots: <String, Dependent<SearchPageState>>{}),
        );
}
