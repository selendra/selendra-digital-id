import 'package:wallet_apps/index.dart';
import 'package:wallet_apps/src/components/appbar_c.dart';

class TrxHistoryDetailsBody extends StatelessWidget {
  final String? title;
  final Map<String, dynamic>? trxInfo;
  final void Function()? popScreen;

  const TrxHistoryDetailsBody({this.title, this.trxInfo, this.popScreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyAppBar(
          title: "$title Details",
          onPressed: popScreen,
        ),
        Container(
          /* Activity Information */
          margin: const EdgeInsets.only(top: 30, left: 16, right: 16),
          decoration: BoxDecoration(
            boxShadow: [
              shadow(context)
            ],
            borderRadius: BorderRadius.circular(5.0),
            color: hexaCodeToColor(AppColors.whiteHexaColor),
          ),
          child: Column(
            children: <Widget>[
              rowInformation("Amount: ", trxInfo!['amount']),
              rowInformation("Fee: ", trxInfo!['fee']),
              rowInformation("From: ", trxInfo!['sender']),
              rowInformation("To: ", trxInfo!['destination']),
              rowInformation(
                "Date: ",
                AppUtils.timeStampToDateTime(
                  trxInfo!['created_at'].toString(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
