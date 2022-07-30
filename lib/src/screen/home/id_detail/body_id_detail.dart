import 'package:flip_card/flip_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_apps/index.dart';
import 'package:wallet_apps/src/components/dialog_c.dart';
import 'package:wallet_apps/src/components/document_card_c.dart';
import 'package:wallet_apps/src/screen/home/id_detail/share_id/share_id.dart';

class IdDetailBody extends StatelessWidget {

  final Map<String, dynamic>? data;

  final GlobalKey? keyQrShare;

  IdDetailBody({this.data, this.keyQrShare});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: hexaCodeToColor(AppColors.textColor)),
        titleSpacing: 0,
        elevation: 0,
        title: MyText(text: data!['type'], color: AppColors.textColor, fontSize: 17, fontWeight: FontWeight.bold,),
        actions: [
          IconButton(
            icon: Icon(
              Iconsax.scan_barcode,
              color: hexaCodeToColor(AppColors.textColor),
            ),
            onPressed: () {
              DialogComponents().dialogQR(context: context, keyQrShare: keyQrShare, data: data);
              // Navigator.push(context, Transition(child: ShareID(), transitionEffect: TransitionEffect.RIGHT_TO_LEFT));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(paddingSize),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
        
              FlipCard(
                direction: FlipDirection.HORIZONTAL,
                front: CardDocument(data: data!, isDetail: true, margin: EdgeInsets.zero,),
                back: ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: Image.network("https://www.identity-cards.net/sites/default/files/Cambodia%20ID.jpg")
                )
              ),
        
              SizedBox(height: paddingSize*2),
        
              _cardInformation(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _idCard(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(8),
      child: Stack(
        children: [
          
          Card(
            margin: EdgeInsets.all(0),
            color: Colors.white.withOpacity(0.06),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: paddingSize),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        text: data!['type'],
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ],
                  ),
                  SizedBox(height: paddingSize,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SvgPicture.asset("assets/male_avatar.svg", width: 50)
                          ),
                          const SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  MyText(
                                    fontSize: 14,
                                    text: 'Name: ',
                                    fontWeight: FontWeight.bold,
                                    
                                    color: AppColors.textColor,
                                  ),
                                  MyText(
                                    fontSize: 14,
                                    text: data!['name'],
                                    
                                    color: AppColors.textColor,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  MyText(
                                    fontSize: 14,
                                    text: 'Date Of Birth: ',
                                    fontWeight: FontWeight.bold,
                                    
                                    color: AppColors.textColor,
                                  ),
                                  MyText(
                                    fontSize: 14,
                                    text: data!['dob'],
                                    
                                    color: AppColors.textColor,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      fontSize: 14,
                                      text: 'Address: ',
                                      fontWeight: FontWeight.bold,
                                      
                                    color: AppColors.textColor,
                                    ),
                                    Expanded(
                                      child: MyText(
                                        fontSize: 14,
                                        textAlign: TextAlign.start,
                                        // width: MediaQuery.of(context).size.width / 1.5,
                                        text: data!['address'],
                                        
                                    color: AppColors.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration:  BoxDecoration(
                color: hexaCodeToColor('#FFD90F').withOpacity(0.3),
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), topRight: Radius.circular(20))
              ),
              child: MyText(
                text: 'Verifying',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: "#FFD90F",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardInformation(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          // fontSize: 18,
          text: 'Name ',
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
          bottom: paddingSize,
        ),

        MyText(
          text: data!['name'],
          color: AppColors.textColor,
          bottom: paddingSize*2,
        ),

        Row(
          children: [
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Date Of Birth ',
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                    bottom: paddingSize,
                  ),
            
                  MyText(
                    text: data!['dob'],
                    color: AppColors.textColor,
                  )
                ],
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Gender',
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                    bottom: paddingSize,
                  ),
            
                  MyText(
                    text: data!['gender'],
                    color: AppColors.textColor,
                  )
                ],
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Height',
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                    bottom: paddingSize,
                  ),
            
                  MyText(
                    text: data!['height'],
                    color: AppColors.textColor,
                  )
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: paddingSize*2,),

        MyText(
          text: 'Gender',
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
          bottom: paddingSize,
        ),
        MyText(
          textAlign: TextAlign.start,
          // width: MediaQuery.of(context).size.width / 1.5,
          text: data!['gender'],
          color: AppColors.textColor,
          bottom: paddingSize*2,
        ),

        MyText(
          text: 'Address',
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
          bottom: paddingSize,
        ),
        MyText(
          textAlign: TextAlign.start,
          // width: MediaQuery.of(context).size.width / 1.5,
          text: data!['address'],
          color: AppColors.textColor,
          bottom: paddingSize*2,
        ),

        MyText(
          text: 'Identity: ',
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
          bottom: paddingSize,
        ),
        MyText(
          textAlign: TextAlign.start,
          // width: MediaQuery.of(context).size.width / 1.5,
          text: data!['identity'],
          color: AppColors.textColor,
          bottom: paddingSize*2,
        ),

        MyText(
          text: 'Expired Date: ',
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
          bottom: paddingSize,
        ),
        MyText(
          textAlign: TextAlign.start,
          // width: MediaQuery.of(context).size.width / 1.5,
          text: data!['expired_date'],
          color: AppColors.textColor,
          bottom: paddingSize*2,
        ),
      ],
    );
  }

}