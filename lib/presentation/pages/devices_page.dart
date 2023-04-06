import 'dart:ui';

import 'package:flutter/material.dart';
import '../../model/device_model.dart';
import '../widgets/device_item_widget.dart';
import '../../model/devices_model.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/background_color_widget.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({Key? key}) : super(key: key);

  @override
  DevicesPageState createState() => DevicesPageState();
}

class DevicesPageState extends State<DevicesPage> {
  Widget appBarTitle = const Text(
    "Devices",
    style: TextStyle(color: Colors.white),
  );
  Icon actionIcon = const Icon(
    Icons.search,
    color: Colors.white,
  );
  final TextEditingController _searchQuery = TextEditingController();
  bool _isSearching = false;
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appBar(),
        drawer: const DrawerWidget(),
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          const BackgroundColorWidget(),
          ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: const EdgeInsets.symmetric(vertical: 128.0),
            children: _isSearching ? _buildSearchList() : _buildList(),
          )
        ]),
      ),
    );
  }

  List<DeviceItemWidget> _buildList() {
    return devices.devices!.map((device) => DeviceItemWidget(device)).toList();
  }

  List<DeviceItemWidget> _buildSearchList() {
    if (_searchText.isEmpty) {
      return devices.devices!
          .map((device) => DeviceItemWidget(device))
          .toList();
    } else {
      List<DeviceModel> searchList = [];
      for (int i = 0; i < devices.devices!.length; i++) {
        String? name = devices.devices![i].title;
        if (name!.toLowerCase().contains(_searchText.toLowerCase())) {
          searchList.add(devices.devices![i]);
        }
      }
      return searchList.map((device) => DeviceItemWidget(device)).toList();
    }
  }

  appBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, kToolbarHeight),
      child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AppBar(
              backgroundColor: Colors.white.withOpacity(.5),
              elevation: 0,
              title: appBarTitle,
              actions: [
                IconButton(
                  icon: actionIcon,
                  onPressed: () {
                    setState(() {
                      if (actionIcon.icon == Icons.search) {
                        actionIcon = const Icon(
                          Icons.close,
                          color: Colors.white,
                        );
                        appBarTitle = TextField(
                          controller: _searchQuery,
                          onChanged: (value) {
                            setState(() {
                              _searchText = value;
                            });
                          },
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.white),
                              hintText: " Search...",
                              hintStyle: TextStyle(color: Colors.white)),
                        );
                        _handleSearchStart();
                      } else {
                        _handleSearchEnd();
                      }
                    });
                  },
                ),
              ],
            ),
          )),
    );
  }

  void _handleSearchStart() {
    setState(() {
      _searchText = '';
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      actionIcon = const Icon(
        Icons.search,
        color: Colors.white,
      );
      appBarTitle = const Text(
        "Devices",
        style: TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _searchQuery.clear();
    });
  }
}
