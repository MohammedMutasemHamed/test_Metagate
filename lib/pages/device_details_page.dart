import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/device_model.dart';
import '../widgets/background_color_widget.dart';

class DeviceDetailsPage extends StatefulWidget {
  final DeviceModel device;

  const DeviceDetailsPage({Key? key, required this.device}) : super(key: key);

  @override
  State<DeviceDetailsPage> createState() => _DeviceDetailsPageState();
}

class _DeviceDetailsPageState extends State<DeviceDetailsPage> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.device.isFavorite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: Stack(children: [
        const BackgroundColorWidget(),
        ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16),
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                widget.device.imageUrl!,
                color: Colors.white,
                size: 50,
              ),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text(
                      widget.device.title!,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        wordSpacing: 1,
                      ),
                    ),
                    Text(
                      ' ${widget.device.price.toString()} ${widget.device.currency!}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.device.type.toString(),
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white.withOpacity(1),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.device.description.toString(),
                softWrap: true,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        )
      ]),
    ));
  }

  appBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, kToolbarHeight),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AppBar(
            backgroundColor: Colors.white.withOpacity(.5),
            elevation: 0,
            title: Text(
              widget.device.title!,
              style: const TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red.shade300,
                ),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
