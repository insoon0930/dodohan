import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/appbars/default_appbar.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBar('이용약관'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top : 12.0),
              child: Text("이용약관", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            ),
            Padding(
              padding: EdgeInsets.all(Get.width * 0.1),
              child: const Text("""
제1조 목적
 이 약관은 (주)ByulE(이하 "회사")에서 제공하는 "두근두근캠퍼스"및 "두근두근캠퍼스"에서 제공하는 제반 서비스(이하 "서비스")에 접속과 사용자에 의해서 업로드 및 다운로드 되어 표시되는 모든 정보, 텍스트, 이미지 및 기타 자료를 이용하는 이용자(이하 "회원")와 서비스 이용에 관한 권리 및 의무와 책임사항, 기타 필요한 사항을 규정하는 것을 목적으로 합니다.

제2조 약관의 게시와 효력, 개정
1. 회사는 서비스의 메인 페이지에 본 약관을 게시합니다.
2. 회사는 관련법에 위배되지 않는 범위에서 본 약관을 변경할 수 있습니다. 회사가 약관을 변경할 경우 그 적용일 최소한 7일 전부터 적용일 후 상당한 기간동안 회원에게 서비스 페이지를 통해 공지합니다. 만약 이용자에게 불리하거나 중대한 사항을 변경할 경우에는 최소한 30일 이전부터 공지합니다.
3. 회원은 회사가 전항에 따라 변경하는 약관에 동의하지 않을 권리가 있으며, 이 경우 회원은 회사에서 제공하는 서비스 이용 중단 및 탈퇴 페이지에서 의사를 표시하고 서비스 이용종료를 요청할 수 있습니다. 다만, 회사가 회원에게 변경된 약관의 내용을 통보하면서 회원에게 '7일 이내 의사표시를 하지 않을 경우 의사표시가 표명된 것으로 본다'는 뜻을 명확히 통지하였음에도 불구하고, 거부의 의사표시를 하지 아니한 경우는 회원이 변경된 약관에 동의하는 것으로 봅니다.
제3조 약관의 해석과 예외 준칙
1. 회사는 제공하는 개별 서비스에 대해서 별도의 이용약관 및 정책을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우 개별 서비스의 이용약관을 우선하여 적용합니다.
2. 본 약관에 명시되지 않은 사항과 본 약관의 해석에 관하여는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「정보통신망이용촉진 및 정보보호 등에 관한 법률」, 「콘텐츠산업진흥법」 등 관련법령 또는 상 관례에 따릅니다.
제4조 용어의 정의
1. 서비스: 개인용 컴퓨터 (PC), TV, 휴대형 단말기, 전기통신설비 등 포함 각종 유무선 장치와 같이 구현되는 단말기와 상관없이 회원이 이용할 수 있는 "두근두근캠퍼스" 및 "두근두근캠퍼스" 관련 제반 서비스를 의미합니다.
2. 회원: 회사와 서비스 이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 모든 사용자를 의미합니다.
3. 아이디: 회원의 식별 및 서비스 이용을 위하여 회원이 선정하고 회사가 부여한 문자 및 숫자의 조합을 의미합니다.
4. 비밀번호: 회원의 개인 정보 및 확인을 위해서 회원이 정한 문자 또는 숫자의 조합을 의미합니다.
5. 도메인: 회원의 서비스 이용을 위하여 회사가 부여한 고유한 인터넷 주소를 의미합니다. 회사는 제공하는 제반 서비스를 위해서 서비스에 따라 별도의 도메인 주소를 추가적으로 제공합니다.
6. 게시물: 회원이 서비스를 이용함에 있어 회원이 서비스에 게시한 문자, 문서, 그림, 음성, 링크, 파일 혹은 이들의 조합으로 이루어진 정보 등 모든 정보나 자료를 의미합니다.
7. 유료서비스: 회사가 유료로 제공하는 각종 온라인디지털콘텐츠 및 제반 서비스를 의미합니다.
8. 하트: 서비스를 이용 또는 구매하기 위해 사용되는 가상의 화폐 단위로서 회원이 대금을 지급하고 구입하는 것을 의미합니다.
제5조 이용계약의 체결
1. 이용계약은 회원이 "두근두근캠퍼스" 서비스 및 제반 서비스에서 제공하는 회원가입 페이지에서 서비스 이용약관에 동의한 후 이용신청을 하고 신청한 내용에 대해서 회사가 승낙함으로써 체결됩니다.
2. 회사는 이용약관에 동의한 후 이용 신청한 사용자에 대해서 원칙적으로 접수 순서에 따라 서비스 이용을 승낙함을 원칙으로 합니다. 다만 업무 수행 상 또는 기술 상 지장이 있을 경우 일정시간 가입승인을 유보할 수 있습니다.
3. 회사는 다음 각 호에 해당하는 신청에 대해서 승낙하지 않거나 사후에 이용계약을 해지할 수 있습니다.
	1. 가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우
	2. 제3자의 전자우편 주소를 이용하여 신청한 경우
	3. 허위의 정보를 기재하거나, 회사가 필수적으로 입력을 요청한 부분을 기재하지 않은 경우
	4. 부정한 용도로 서비스를 사용하고자 하는 경우
	5. 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
	6. 회사의 정책에 적합하지 않는 회원으로 판단되는 경우나 서비스 제공이 곤란한 경우
	7. 회원의 이용 목적이나 서비스 이용 방법이 회사의 재산권이나 영업권을 침해하거나 침해할 우려가 있는 경우
	8. 비정상적인 방법을 통하여 아이디 및 도메인을 대량으로 생성하는 행위
4. 회사는 회원에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
5. 회원은 회원 가입 시 기재한 개인정보의 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다. 변경의 지체로 인하여 발생한 회원의 손해에 대해 회사는 책임을 지지 않습니다.
6. 회사는 관련 법률 및 회사의 개인정보처리방침에서 정한 바에 따라 회원에게 요청하는 회원정보 및 기타정보 항목을 추가, 삭제 등 변경하여 수집 및 이용할 수 있습니다.
제6조 개인정보보호 의무
1. 회사는 정보통신망법 등 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 회사의 개인정보처리방침이 적용됩니다. 다만, 회사의 공식 사이트 이외의 링크된 사이트에서는 회사의 개인정보처리방침이 적용되지 않습니다.
2. 회사는 서비스를 중단하거나 회원이 개인정보 제공 동의를 철회한 경우에는 신속하게 회원의 개인정보를 파기합니다. 단, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관련 법률에서 정하는 바에 따라 일정 정보는 보관할 수 있습니다.
3. 회사는 서비스 개선 및 회원 대상의 서비스 소개 등의 목적으로 회원의 동의 하에 관계 법령에서 정하는 바에 따라 추가적인 개인정보를 수집할 수 있습니다.
4. 회사는 법률에 특별한 규정이 있는 경우를 제외하고는 회원의 별도 동의 없이 회원의 계정정보를 포함한 일체의 개인정보를 제3자에게 공개하거나 제공하지 아니합니다.
5. 회사는 향후 제공하는 서비스에서 회원의 편의를 위해서 회원의 계정 정보를 사용할 수 있도록 링크 및 기타 방법을 제공할 수 있습니다.
제7조 회원의 전화번호 및 인증번호
1. 회원은 인증번호에 관해서 관리책임이 있습니다.
2. 회원은 인증번호를 제3자가 이용하도록 제공하여서는 안됩니다.
3. 회사는 회원이 전화번호 및 인증번호를 소홀히 관리하여 발생하는 서비스 이용 상의 손해 또는 회사의 고의 또는 중대한 과실이 없는 제3자의 부정이용 등으로 인한 손해에 대해 책임을 지지 않습니다.
4. 회원은 전화번호 및 인증번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 회사에 통지하고 회사의 안내에 따라야 합니다.
제8조 결제, 환불 및 결제 취소
1. 회원은 회사가 제공하는 다양한 결제수단을 통해 유료서비스를 이용할 수 있으며, 결제가 비정상적으로 처리되어 정상처리를 요청할 경우 회사는 회원의 결제금액을 정상처리 할 의무를 가집니다.
2. 회사는 부정한 방법 또는 회사가 금지한 방법을 통해 충전 및 결제된 금액에 대해서는 이를 취소하거나 환불을 제한할 수 있습니다.
3. 회원은 다음 각 호의 사유가 있으면 아래의 4항의 규정에 따라서 회사로부터 결제 취소, 환불 및 보상을 받을 수 있습니다.
1. 결제를 통해 사용할 수 있는 서비스가 전무하며 그에 대한 책임이 전적으로 회사에 있을 경우 (단, 사전 공지된 시스템 정기 점검 등의 불가피한 경우는 제외)
2. 회사 또는 결제대행사의 시스템의 오류로 인하여 결제기록이 중복으로 발생한 경우
3. 서비스 종료 등의 명목으로 회사가 회원에게 해지를 통보하는 경우
4. 기타 소비자 보호를 위하여 당사에서 따로 정하는 경우.
5. 회원이 구입한 아이템을 유료 결제 후 7일 이내에 환불을 요청하는 경우
6. 미성년자가 디바이스에서 콘텐츠 구매계약을 체결하는 경우, 회사는 법정대리인의 동의가 없으면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있다는 내용을 고지하며, 미성년자가 법정대리인의 동의 없이 구매계약을 체결한 때에는 미성년자 본인 또는 법정대리인은 회사에 그 계약을 취소할 수 있습니다. 다만, 미성년자가 법정대리인이 범위를 정하여 처분을 허락한 재산으로 콘텐츠를 구매한 경우 또는 미성년자가 속임수로써 자기를 성년자로 믿게 하거나 법정대리인의 동의가 있는 것으로 믿게 한 경우에는 취소할 수 없습니다.
7. 콘텐츠 구매계약의 당사자가 미성년자인지 여부는 결제가 진행된 디바이스, 결제 실행자 정보, 결제 수단 명의자 등을 근거로 판단합니다. 또한 회사는 정당한 취소인지를 확인하기 위해 미성년자 및 법정대리인임을 증명할 수 있는 서류의 제출을 요청할 수 있습니다.
4. 회원은 위의 3항 각 호에 해당하는 경우라고 할지라도 묶음형으로 판매된 상품의 일부가 사용된 경우 청약철회가 제한될 수 있습니다.
5. 환불, 결제 취소 절차는 다음 각 항목과 같습니다.
1. 환불을 원하는 회원은 전자 우편을 통해 회원 본인임을 인증하는 절차를 거쳐 고객센터에 접수해야 하며 본인 인증과 동시에 환불을 신청하여야 합니다.
2. 회사는 회원의 환불 요청 사유가 적합한지를 판단하고 3항의 환불사유가 존재하며, 적합한 절차를 거친 것으로 판명된 회원에게 환불합니다.
3. 회사는 회원에게 환불되어야 할 금액 산정 방식과 절차를 회원에게 상세히 설명하고 난 후, 회원에게 해당 환불 및 결제 취소 처리합니다.
6. 회원은 구매시점으로부터 7일 이내인 경우 환불이 가능하며 구매시점 8일 이후에는 시스템 오류에 의한 미지급 등 회사의 귀책사유로 인정되는 경우에만 환불이 가능합니다.
7. 회원이 이용약관을 위반한 행위로 인해 사용금지, 강제탈퇴 등의 제재를 당하는 경우 위약벌로서 아이템 환불 및 보상이 불가합니다.
8. 회원의 자진탈퇴로 인해 계약이 해지되는 경우, 회원이 보유한 아이템은 자동으로 소멸되어 복구 및 환불이 불가능합니다.
9. 신원 인증과정에서 회원의 등록정보가 허위 정보로 판명되거나 가입 조건에 부합되지 않는 점이 판명될 경우 징계 및 강제 탈퇴가 되며 회원 본인의 귀책사유로 인해 환불 및 보상이 불가능합니다.
10. 회사와 이용자 간에 발생한 분쟁은 전자거래기본법 제32조에 의거하여 설치된 기관인 전자거래분쟁조정위원회의 조정에 따를 수 있습니다.
제9조 하트의 사용 및 소멸
1. 하트는 회사가 제공하는 서비스를 사용할 때 지불 수단으로 이용될 수 있습니다.
제10조 회사의 의무
1. 회사는 계속적이고 안정적인 서비스의 제공을 위하여 최선을 다하여 노력합니다.
2. 회사는 회원이 안전하게 서비스를 이용할 수 있도록 현재 인터넷 보안기술의 발전수준과 회사가 제공하는 서비스의 성격에 적합한 보안시스템을 갖추고 운영해야 합니다.
3. 회사는 서비스를 이용하는 회원으로부터 제기되는 의견이나 불만이 정당하다고 인정하는 경우 이를 처리하여야 합니다. 이때 처리과정에 대해서 고객에게 메일 및 게시판 등의 방법으로 안내합니다.
4. 회사는 정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법, 전기통신사업법 등 서비스의 운영, 유지와 관련 있는 법규를 준수합니다.
제11조 회원의 의무
1. 회원은 다음 각 호에 해당하는 행위를 해서는 안됩니다.
1. 이용 신청 또는 회원정보 변경 시 허위내용 등록하는 경우
2. 타인의 정보를 도용 하는 경우
3. 회사의 운영자, 임직원, 회사를 사칭하는 경우
4. 회사가 게시한 정보의 변경을 하는 경우
5. 해킹을 통해서 다른 사용자의 정보를 취득하는 행위를 하는 경우
6. 회사와 다른 회원 및 기타 제3자를 희롱하거나, 욕설·비속어·은어 등을 사용하거나, 위협하거나 명예를 손상시키는 행위를 하는 경우
7. 외설, 폭력적인 메시지, 기타 공서양속에 반하는 정보를 공개 또는 게시하는 행위를 하는 경우
8. 자신의 종교적 신념을 표현하거나 타인의 종교를 비하하는 경우
9. 허위사실 유포 및 사기 행위를 하는 경우
10. 국내법상 온라인 판매가 금지된 제품의 거래나 홍보를 하는 경우
11. 장물, 마약/향 정신성 약품 등 국내 반입 및 판매가 금지된 제품의 판매나 홍보를 하는 경우
12. 매점매석과 같이 공정거래에 위반되는 행위를 하는 경우
13. 음란물 및 성인물을 게시하거나 판매 혹은 홍보를 하는 경우
14. 유흥업, 퇴폐향락업 및 불법업태에 관련한 사항을 게시하거나 홍보하는 경우
15. 정치적, 사회적인 물의를 일으킬 수 있는 행위를 하는 경우
16. 회사와 기타 제3자의 저작권, 영업비밀, 특허권 등 지적재산권에 대한 침해를 하는 경우
17. 정보통신설비의 오작동이나 정보 등의 파괴를 유발시키는 악성코드나 데이터 등을 유포하는 경우
18. 기타 현행 법령에 위반되는 불법적인 행위를 하는 경우
19. 기타 "두근두근캠퍼스" 모바일 어플리케이션 또는 온라인 웹 페이지를 통하여 추가로 공지되는 사항에 위배되는 경우
20. 타인에게 동일한 사유로 3회 이상 신고당하거나 신고 사유가 입증된 경우
21. 회사와 다른 회원 및 기타 제3자에게 금전을 요구하거나 개인정보를 요구하는 행위를 하는 경우
2. 회사는 회원이 전항에서 금지한 행위를 하는 경우, 위반 행위의 경중에 따라 서비스의 이용 제한 및 수사 기관에의 고발 조치 등 합당한 조치를 취할 수 있으며, 이로 인하여 발생한 회원의 손해에 대해 회사는 책임을 지지 않습니다.
3. 회원은 회사의 명시적 사전 동의가 없는 한 서비스의 이용권한 및 기타 이용계약상의 지위를 제3자에게 양도, 증여, 대여할 수 없으며 이를 담보로 제공할 수 없습니다.
4. 회원은 관계법, 이 약관의 규정, 이용안내 및 서비스와 관련하여 공지한 주의사항, 회사가 통지하는 사항 등을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는 안 됩니다. 이로 인해 회사에 손실이 발생한 경우 회사는 회원에게 손해배상을 청구 할 수 있습니다.
5. 회원은 회사의 사전 허락 없이 회사가 정한 이용 목적과 방법에 반하여 영업/광고활동 등을 할 수 없고, 회원의 서비스 이용이 회사의 재산권, 영업권 또는 비즈니스 모델을 침해하여서는 안됩니다.
제12조 서비스의 제공 및 변경
1. 회사는 회원에게 아래와 같은 서비스를 제공합니다.
1. "두근두근캠퍼스" 및 "두근두근캠퍼스" 통합계정 서비스
2. 기타회사가 추가 개발하거나 다른 회사와의 제휴 계약 등을 통해 회원에게 제공하는 일체의 서비스
2. 서비스는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.
3. 회사는 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 서비스의 제공을 일시적으로 중단할 수 있습니다. 이 경우 회사는 회원에게 공지사항 게시판 및 메일 등의 방법으로 통지합니다. 다만, 회사가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
4. 회사는 회원과 별도로 서면 계약을 체결하여 "두근두근캠퍼스" 서비스 및 제반 서비스의 브랜드 특성을 이용할 수 있는 명시적인 권리를 부여하지 아니하는 한, 회원에게 회사 또는 "두근두근캠퍼스" 서비스의 상호, 상표, 서비스표, 로고, 도메인 네임 및 기타 식별력 있는 브랜드 특성을 이용할 수 있는 권리를 부여하지 않습니다.
5. "두근두근캠퍼스" 및 "두근두근캠퍼스" 에서 제공하는 서비스는 계속 발전하고 있습니다. 회사가 제공하는 서비스의 형태와 기능, 디자인 등 필요한 경우 수시로 변경되거나, 중단될 수 있습니다. 회사는 이 경우 개별적인 변경에 대해서 회원에게 사전 통지하지 않습니다. 다만, 회원에게 불리한 것으로 판단되는 경우 공지 또는 전자우편으로 통하여 이를 공지합니다.
6. 전항에 의해서 제공되는 서비스가 변경 및 중단될 경우 무료로 제공되는 서비스에 대해서는 회원에게 별도로 보상하지 않습니다.
제13조 광고의 게제
1. 회사는 서비스 운영과 관련하여 회원정보, 고객이 입력한 정보를 활용하여 광고를 게재할 수 있습니다. 회원은 서비스 이용 시 노출되는 맞춤 광고 게재에 대해 동의합니다.
2. 회사는 서비스 상에 게재되어 있거나 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래를 함으로써 발생하는 손실과 손해에 대해 책임을 지지 않습니다.
제14조 전자우편을 통한 정보의 제공
1. 회사는 회원이 서비스 이용에 필요하다고 인정되는 다양한 정보를 회원이 제공한 전자우편 주소로 제공할 수 있습니다.
2. 회사는 서비스 운영을 위해 회원정보를 활용하여 영리목적의 광고성 전자우편을 전송할 수 있습니다. 회원이 이를 원하지 않는 경우에는 수신거부를 할 수 있습니다.
3. 회사는 다음 각 호에 해당하는 경우 회원의 동의여부와 상관없이 전자우편으로 발송할 수 있습니다.
1. 이용 신청에서 입력한 전자우편 주소의 소유를 확인하기 위해서 인증메일을 발송하는 경우
2. 회원의 정보가 변경되어 확인하기 위해서 인증메일을 발송하는 경우
3. 기타 서비스를 제공함에 있어 회원이 반드시 알아야 하는 중대한 정보라고 회사가 판단하는 경우
제15조 서비스 이용의 제한
1. 회사는 천재지변이나 국가비상사태, 해결이 곤란한 기술적 결함 또는 서비스 운영의 심각한 변화 등 불가항력적인 경우가 발생 또는 발생이 예상될 때는 서비스의 전부 또는 일부를 예고 없이 제한하거나 중지할 수 있습니다.
2. 서비스를 이용하게 됨으로써 서비스 영역에서 발생하는 회원 사이의 문제에 대해 회사는 책임을 지지 않습니다.
3. 회원의 관리 소홀로 인하여 ID 및 비밀번호의 유출로 인해 회원에게 서비스 이용 상의 손해가 발생하거나 제3자에 의한 부정이용 등으로 회원의 의무조항을 위반한 경우 ID및 해당 도메인의 이용이 제한될 수 있습니다.
4. 회사가 본 약관 제9조의 위반 행위를 조사하는 과정에서 당해 회원 ID 및 도메인이 특정 위반행위에 직접적으로 관련되어 있는 경우 등 다른 회원의 권익 보호 및 서비스의 질서유지를 위해 불가피할 경우에는 해당 ID 및 도메인의 이용을 일시적으로 정지할 수 있습니다. 이에 대해 회원은 "두근두근캠퍼스" 서비스 홈페이지 또는 전자우편 등을 통해 이의신청을 할 수 있습니다.
제16조 게시물의 권리와 책임
1. 회원이 서비스 내에 작성한 텍스트, 이미지, 동영상, 링크 등의 기타 정보(이하 "게시물")에 대한 책임 및 권리는 게시물을 등록한 회원에게 있습니다.
2. 회사는 회원이 작성한 콘텐츠에 대해서 감시 및 관리할 수 없으며 이에 대해서 책임지지 않습니다. 회사는 회원이 등록하는 게시물의 신뢰성, 진실성, 정확성 등에 대해서 책임지지 않으며 보증하지 않습니다.
3. 서비스에 대한 저작권 및 지적재산권, 회사가 작성한 게시물의 저작권은 회사에 귀속됩니다. 단, 회원이 단독 또는 공동으로 작성한 게시물 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.
4. 회원이 서비스 내에 게시하는 게시물은 검색결과 내지 서비스 운영 및 홍보 등을 위해서 매체, 홈페이지, 자사의 다른 서비스, 기타의 방법(현재 알려져 있고 향후 개발되는 것을 포함)에서 사용될 수 있습니다. 이때 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, 회사는 저작권법 규정을 준수하며, 회원은 언제든지 고객센터 또는 서비스 내 관리기능을 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.
5. 회원이 회원탈퇴를 한 경우에는 본인이 생성한 게시물은 삭제되지 않습니다. 단, 탈퇴 하기 전 본인의 게시물은 스스로 삭제할 수 있습니다. 게시물이 제3자에 의하여 보관되거나 무단복제 등을 통하여 복제됨으로써 해당 저작물이 삭제되지 않고 재 게시된 경우에 대하여 회사는 책임을 지지 않습니다. 또한, 본 약관 및 관계 법령을 위반한 회원의 경우 다른 회원을 보호하고, 법원, 수사기관 또는 관련 기관의 요청에 따른 증거자료로 활용하기 위해 회원탈퇴 후에도 관계 법령이 허용하는 한도에서 회원의 아이디 및 회원정보를 보관할 수 있습니다.
6. 회원의 게시물 또는 저작물이 회사 또는 제3자의 저작권 등 지적재산권을 침해함으로써 발생하는 민•형사상의 책임은 전적으로 회원이 부담하여야 합니다.
제17조 게시물의 관리
1. 회원의 게시물이 정보통신망법 및 저작권법등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 게시물의 게시중단 및 삭제 등을 요청할 수 있으며, 회사는 관련법에 따라 조치를 취하여야 합니다.
2. 회사는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 본 약관 및 기타 회사 정책, 관련법, 지적재산권, 공서양속에 위반되는 경우에는 관련법에 따라 해당 게시물에 대해 임시조치 등을 취할 수 있습니다.
제18조 거래 행위에 대한 책임
1. 회사는 효율적인 서비스를 위한 시스템 운영 및 관리 책임만을 부담하며, 재화 또는 용역의 거래와 관련하여 구매자 또는 판매자를 대리하지 아니하고, 사용자 사이에 성립된 거래 및 사용자가 제공하고 등록한 정보에 대해서는 해당 사용자가 그에 대한 모든 책임을 부담하여야 합니다.
2. 회사는 회사가 제공하는 시스템을 통하여 이루어지는 구매자와 판매자 간의 거래와 관련하여 판매의사 또는 구매의사의 존부 및 진정성, 등록물품의 품질, 완전성, 안정성, 적법성 및 타인의 권리에 대한 비침해성, 구매자 또는 판매자가 입력하는 정보 및 그 정보를 통하여 링크된 URL에 게재된 자료의 진실성 또는 적법성 등 일체에 대하여 보증하지 아니하며, 이와 관련한 일체의 위험과 책임은 해당 사용자가 전적으로 부담합니다.
3. 회사는 "두근두근캠퍼스"을 기반으로 한 거래시스템만을 제공할 뿐이며, 거래 내용에 관한 모든 분쟁에 대해서는 해당 거래 당사자가 책임을 져야 합니다.
제19조 책임제한
1. 회사는 회원의 약관, 서비스 이용 방법 및 이용 기준을 준수하지 않는 등 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.
2. 회사는 서비스를 통하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 보증하지 않습니다.
3. 회사는 회원 간 또는 회원과 제3자 상호간에 서비스를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
4. 회사는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.
5. 회사는 천재지변, 전쟁, 기간통신사업자의 서비스 중지, 해결이 곤란한 기술적 결함 기타 불가항력으로 인하여 서비스를 제공할 수 없는 경우 책임이 면제됩니다.
6. 회사는 사전에 공지된 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 서비스가 중지되거나 장애가 발생한 경우에 대하서는 책임이 면제됩니다.
7. 회원은 자신의 결정에 의하여 회사의 서비스를 사용하여 특정 프로그램이나 정보 등을 다운받거나 접근함으로써 입게 되는 컴퓨터 시스템상의 손해나 데이터, 정보의 상실에 대한 책임을 집니다.
8. 회사는 기간통신사업자가 전기통신서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우에는 책임이 면제됩니다.
9. 회원의 컴퓨터 오류, 신상정보 및 전자우편 주소의 부정확한 기재, 비밀번호 관리의 소홀 등 회원의 귀책사유로 인해 손해가 발생한 경우 회사는 책임을 지지 않습니다.
10. 회사는 회원의 컴퓨터 환경이나 회사의 관리 범위에 있지 아니한 보안 문제로 인하여 발생하는 제반 문제 또는 현재의 보안기술 수준으로 방어가 곤란한 네트워크 해킹 등 회사의 귀책사유 없이 발생하는 문제에 대해서 책임을 지지 않습니다.
11. 회사는 서비스가 제공한 내용에 대한 중요 정보의 정확성, 내용, 완전성, 적법성, 신뢰성 등에 대하여 보증하거나 책임을 지지 않으며, 사이트의 삭제, 저장실패, 잘못된 인도, 정보에 대한 제공에 대한 궁극적인 책임을 지지 않습니다. 또한, 회사는 회원이 서비스 내 또는 웹사이트상에 게시 또는 전송한 정보, 자료, 사실의 신뢰도, 정확성, 완결성, 품질 등 내용에 대해서는 책임을 지지 않습니다.
12. 사용자가 자신의 개인정보를 타인에게 유출 또는 제공함으로써 발생하는 피해에 대해서는 회사는 일체의 책임을 지지 않습니다.
13. 회사는 회원이 서비스를 이용하여 기대하는 효용을 얻지 못한 것에 대하여 책임을 지지 않으며 서비스에 대한 취사 선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
14. 회사는 회원의 게시물을 등록 전에 사전심사 하거나 상시적으로 게시물의 내용을 확인 또는 검토하여야 할 의무가 없으며, 그 결과에 대한 책임을 지지 않습니다.
15. WiFi환경이 아닌 곳에서 접속하여 데이터 요금 발생 시, 사용자는 부과된 요금에 대해 회사에게 일체 지불 요청을 할 수 없습니다.
제20조 준거법 및 재판관할
1. 회사와 회원 간 제기된 소송에는 대한민국법을 준거법으로 합니다.
2. 회사와 회원간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.
제21조 회사의 연락처
회사의 상호 및 주소 등은 다음과 같습니다.

1. 상호 : ByulE
2. 대표자 : 최인창
3. 사업자등록번호 : 524-28-01299
4. 고객센터 : byule@gmail.com
부칙
시행일 : 이 약관은 2023년 8월 1일부터 시행합니다.
              """),
            ),
          ],
        ),
      ),
    );
  }
}