import 'package:ctgformanager/bluetooth_connect/blue_provider.dart';
import 'package:ctgformanager/bluetooth_connect/connect_ble_flow/pairing_device/pairing_device_widget.dart';
import 'package:ctgformanager/bluetooth_connect/make_listtile_widget.dart';
import 'package:ctgformanager/bluetooth_connect/setting_sensor_flow/setting_args_page.dart';
import 'package:ctgformanager/contstants/constants.dart';
import 'package:ctgformanager/contstants/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WifiComplete extends StatelessWidget {
  const WifiComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BlueProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('기기 선택하기'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(NORMALGAP),
              child: Text(
                '와이파이 연결이 완료되었습니다. \n연결된 와이파이: ${provider.wifiSsid}\n설정하실 기기를 선택해주세요.',
                style: makeTextStyle(16, AppColors.black, 'medium'),
              ),
            ),
          ),
          SizedBox(
            height: SMALLGAP,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.pairingDevices.length,
              itemBuilder: (context, index) {
                return MakeListTileWidget(
                  context: context,
                  index: index,
                  TileData: TileData.PAIRING,
                  onTap: () {
                    provider
                        .selectDeviceSetting(provider.pairingDevices[index]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SettingArgsPage(provider.pairingDevices[index]),
                        ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
