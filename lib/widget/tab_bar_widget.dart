import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> views;

  const TabBarWidget({Key key, this.tabs, this.views}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabBarWidgetState(tabs, views);
  }
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  final List<Widget> _tabs;
  final List<Widget> _views;
  PageController _pageController = new PageController();

  _TabBarWidgetState(this._tabs, this._views);

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.white, child: Text("标题")),
      ),
      body: PageView(
        controller: _pageController,
        children: _views,
        onPageChanged: (index) {
          _tabController.animateTo(index,
              duration: Duration(milliseconds: 200));
        },
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
            child: TabBar(
          tabs: _tabs,
          controller: _tabController,
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.ease);
          },
        )),
      ),
    );
  }
}
