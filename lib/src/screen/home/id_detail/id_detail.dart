
import 'package:wallet_apps/index.dart';
import 'package:wallet_apps/src/screen/home/id_detail/body_id_detail.dart';

class IdDetail extends StatefulWidget {

  final Map<String, dynamic>? data;
  final String? url;
  const IdDetail({Key? key, required this.data, this.url}) : super(key: key);

  @override
  State<IdDetail> createState() => _IdDetailState();
}

class _IdDetailState extends State<IdDetail> {

  final GlobalKey? keyQrShare = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return IdDetailBody(
      keyQrShare: keyQrShare,
      url: widget.url,
      data: widget.data
    );
    
  }
}