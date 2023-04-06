import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/device_model.dart';
import '../pages/device_details_page.dart';

class DeviceItemWidget extends StatefulWidget {
  final DeviceModel device;

  const DeviceItemWidget(this.device, {super.key});

  static BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: borderBoxRadius,
      border: Border.all(color: Colors.black45, width: 1));

  static BorderRadius borderBoxRadius = BorderRadius.circular(8);

  @override
  State<DeviceItemWidget> createState() => _DeviceItemWidgetState();
}

class _DeviceItemWidgetState extends State<DeviceItemWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -50).animate(CurvedAnimation(
        parent: _controller2, curve: Curves.fastLinearToSlowEaseIn));

    _controller.forward();
    _controller2.forward();
  }

  @override
  Widget build(BuildContext context) {
    return card(
      widget.device.title!,
      widget.device.price.toString(),
      widget.device.imageUrl!,
      DeviceDetailsPage(
        device: widget.device,
      ),
    );
  }

  Widget card(String title, String subtitle, IconData icon, Widget route) {
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => route));
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                      color: Colors.white.withOpacity(.1), width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
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
                          maxLines: 1,
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.white.withOpacity(1),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.device.description.toString(),
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      icon: const Icon(
                        Icons.info,
                        color: Colors.white54,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeviceDetailsPage(
                              device: widget.device,
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
