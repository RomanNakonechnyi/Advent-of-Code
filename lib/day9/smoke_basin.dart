//Thanks to https://www.youtube.com/watch?v=CDK4TxkEd60 for part 2...

void main(List<String> args) {
  //part 1
  var res = findAllLowPoints(input).fold<int>(
      0, (previousValue, element) => previousValue + element.value + 1);
  print(res);

  //part2
  var lowPoints = findAllLowPoints(input);
  var part2 =
      lowPoints.map<int>((e) => flodFill(e.row, e.column, input)).toList();
  part2.sort((a, b) => b.compareTo(a));
  print(part2[0] * part2[1] * part2[2]);
}

int flodFill(int i, int j, List<String> input) {
  if (input[i][j] == '9') return 0;
  input[i] = input[i].replaceRange(j, j + 1, '9');

  var size = 1;

  if (i - 1 >= 0) {
    size += flodFill(i - 1, j, input);
  }
  if (i + 1 < input.length) {
    size += flodFill(i + 1, j, input);
  }
  if (j - 1 >= 0) {
    size += flodFill(i, j - 1, input);
  }
  if (j + 1 < input.first.length) {
    size += flodFill(i, j + 1, input);
  }

  return size;
}

// - while <= 9 && prev < next
//
//
//
//
//
//
//
//
//
//

List<int> findAllLowPointsBasins(List<LowPoint> lowPoints, List<String> input) {
  return [0];
}

List<LowPoint> findAllLowPoints(List<String> input) {
  var finalRes = <LowPoint>[];
  for (var i = 0; i < input.length; i++) {
    for (var j = 0; j < input[i].length; j++) {
      var maybeLowPoint = input[i][j];
      if (maybeLowPoint == '9') continue;
      var up = i - 1;
      var down = i + 1;
      var right = j + 1;
      var left = j - 1;

      var lowerThanLeft =
          left >= 0 ? maybeLowPoint.compareTo(input[i][left]) < 0 : true;
      if (!lowerThanLeft) {
        continue;
      }
      var lowerThanRight = right < input[i].length
          ? maybeLowPoint.compareTo(input[i][right]) < 0
          : true;
      if (!lowerThanRight) {
        continue;
      }
      var lowerThanUp =
          up >= 0 ? maybeLowPoint.compareTo(input[up][j]) < 0 : true;
      if (!lowerThanUp) {
        continue;
      }
      var lowerThanDown = down < input.length
          ? maybeLowPoint.compareTo(input[down][j]) < 0
          : true;

      if (!lowerThanDown) {
        continue;
      }

      finalRes.add(LowPoint(i, j, int.parse(maybeLowPoint)));
    }
  }
  return finalRes;
}

class LowPoint {
  int row;
  int column;
  int value;

  LowPoint(this.row, this.column, this.value);
}

final testInput = [
  '2199943210',
  '3987894921',
  '9856789892',
  '8767896789',
  '9899965678'
];

final input = [
  '6689921013498789902346789201997567893294212349421234789439898765498665457689964987654312357896565678',
  '5578892154987699894559894399875478789989901268992345696598769896987543274597893298775201256987434789',
  '3456789369876545689698976987754395678977892456789459987987654998987632123456789109764215345899676993',
  '4997999878987679898987989876543234589456789567899998899498543129876542046797899919875636656789997892',
  '9889999999398789987856899989954465694375899678999876789397684012987657657898999891986547789998789921',
  '8679897679209899876545779998895578943234878989998765699989765123598798769999998793987698999989679910',
  '6569793498999999876434568987679989776123567895987654678979543234679999978999998659798789319876559891',
  '4458679997678987654323457898567897654234679934699875699568954345989899899578899548679895409654346789',
  '3356567896542399543212345987678998966995989223568986789457895469898789764476798934567976598753235597',
  '2123458999431298657423456798789319989879892101456797892346796598784679843345987923569987989632123456',
  '4244567998910239776534867899992101299865679212359998901235897978663567932129876894678998976543436567',
  '5656678997894349899646789978989212987654578996567989432346789865542358943098765789899019998957545978',
  '9767789656789478998787896365678929897543456789789876543456991974321467892129954889902998999898656799',
  '9879896545699567999998954234579998786532345678999987656569892985210276943339973678919877898789798899',
  '0989965434568979889029532123767999654321534569989798787698789976371345894598982567898765675678999979',
  '1999654322378998768998921012348998765210125778978659998987659876562656789697651486789654794567898767',
  '9898932101489997654567892543459989876533259899765434879986545987978787899987632345689563123456987856',
  '8767894212599988323456989656789878987844345998972123459865432498989898979876545467895432094667896545',
  '5456789323459876512345678967896764398756457897894234598764301239895939567989876568976593989778975439',
  '2345678934567965434456989878975321299897767966789355987654212345794323498999987678998989878999654328',
  '1256799545679876545677894989764210989998878954878967898965345499895436579567898789109878767899876546',
  '0127897656889987756789943299965329876419989543567899999876756578987677893478909899998765645794987657',
  '2938949877999998987897892109876539854323497652459988999987897899498988912346912999876543134893298768',
  '9899932989798999098986789919987698765635569763498767989999998912349999434959899989999432012954129878',
  '9779891297687899129875689898998989896745679854999652878998769209498976569898798878998764123993299989',
  '8656799986566798934993998767899876987856798769898741667899854398987897898767657767899875254789989995',
  '6545678984345987899879899856798965499967899898765432456999765987656798979754346456789976465699878994',
  '7656899975956986598766789867987532399878999979876573467898979876545899459863212367891987899895467989',
  '8768999899899767454345679879998653589989998765987665678997899988734991398974334478910998978954349878',
  '9979998798798654321236789998999764678999897654399876789976789999323789997899465699329879567965498765',
  '1989987657549543210197899987789876789998789767999987899765857898915699876788976989598765457899987654',
  '0996798743239765421989929876677999899987679979889898998974345987923986585687989878999976345678996543',
  '9895697621029878439878913975456899939876567898765689687993253456899894344556798767899865456989886532',
  '8784598534134989598768899894345998921999678987654598546989012345698789212345679878998976577899764321',
  '7642987693257997699656799783245987892988999996543987434567993457987678905467899989567897689969865210',
  '9831098989368998989745789610139876789877689899764965425378989579876587896567998793456789992456976321',
  '6432139878999989876432596531299765679766598789999762101234578989865456789878987654798899891567897432',
  '6543298967789975976563469642987654799654435678987653324345679998754345699989798765689989689978999545',
  '7754397856678964988974678953496542398543212568998765435459798869543234789997689896789678567899989656',
  '9865986743457893299985679764965321987698623456789897645689987654321045678976542997896543456789979967',
  '7999875442446789101396989899876459898786546567890998796789998796532123489989659898989932139998767898',
  '6987654321235679212987999989996598789898657678921249899899989987648234678998798759679893398797656799',
  '5398765745347889329998999879989987678999788799843458967978976598757656789129989543498789987653345899',
  '3129879856768995498999998967879876567899899897654567954567895439868787899998965432345678997632136789',
  '4015989997878996987899997656768965446689975999868879883477989323979898999877896543456789876532012989',
  '5124599998989989876789878543457987334456799899999997672376678901989999998766789654587898765432124678',
  '3235678979999879965698765432346899212347987789989876541234567932399899989654578965698919887654289789',
  '4999989657899767854569764321245678924479876579876995430123698949998789876523689896799324999765678999',
  '9878996545987654323459843210236799734569965468994989921235679998754698765434898789895455699876989878',
  '9967896434699543212349654321347897645698986356789878892356798999865789986545689578987579987987994667',
  '8954594323498784329498967865458999767987658264598967799567987899876897987656895456799698976798923456',
  '7863489914989895498987899878567898978996532123987545678979876789997896898967954345678977645899216567',
  '6572378895678976987876989989678967899987644379976234789998765678998955679879879458789765439999928788',
  '5451258789789989976765878999889456794598876569995445789987654367899543256989998669999879598987899899',
  '4210145678991098765674568993992346789679997678986896896798765459969864347896549789013998977676789921',
  '5543234569989998654643459982101256998798798989998987965659986578943985856798729892134987766545678910',
  '6654346778979876543232368976342347899987659199989698954349997789894596767899913943245976553234578921',
  '7787656989556997652101458975453458987898541019876549695298998896789987899999899876356985432123489932',
  '8898767895447698787312467896784567896987632156995435579976689965678998956798789985459876541012567893',
  '9989879964323479876523456998895678954296545247984323467894579754349999548987678976589987632123789999',
  '8978989553212367995434678959976889992198654349976012389943019543202987659876467897678999843545678988',
  '7869895432101456987655789545987899989239765698765124569652198654399898799865356899789798768798789767',
  '6758789543212368998976891236898999878949876987654245778943239768989789986544237678995679878919898756',
  '4345678965327456799988910123469998769899987898864345689659349879878678996433124567894579999109997645',
  '1234599995496567893499899234567987656789998949765767998798957989964567894321034578943234767998754234',
  '2876789989989878999987678995879876545678999656979878929987898999873456789432345689432123459876543125',
  '3989898769878989998996566789999986534767899798989989219896789998731567896564556796543536567989754576',
  '4599997654667899887987345678998897323458998999999999998765678986542879987875678897956787689998969697',
  '5678989543456999766799456789986789214567897898998889897654568998753499998989989999878998999877698989',
  '6799878932345678945988969899997894325678966987987679798532367899984578969998795689989989998766567978',
  '7988967921234789029877798998998995434589245976798556689965456932975679456965634567998978997653456567',
  '9877359890345678939965677987999987646789134985897434567896578921098794349874326678956767899432123456',
  '8866238789467989997894356976789998657891095954986546789997789932129893198765435689545456899321012345',
  '7654345679589999876795234954548998768932989893298656799219897893939954349879876789434349987432145956',
  '9765656889678998965799659893237899899899878789109789898901956789898765599999988899621238996553234898',
  '9878967898789987654678998765356789956789365678929898967992349898789896989989999967990126987664345789',
  '1989878989899876543459999877867894345892134569946987648689498989678989879878933456789334599765456799',
  '0199989877945988432345789988878954234789023456897898734579987674569876567767912345896545679876567898',
  '9978998765432398543657999899989432145678934567998939923469976563498965434456899766799697893999878986',
  '8767897654321987654798998756798555236789645878989029313498975432987654322345678979898989912499989775',
  '9878999795690298765899976545987654345899756989678998901297654321298865401266899998976778923989997654',
  '3989797989989349876999831036798765456789887896567987892999775410349876616477998987894569939979876543',
  '2094596767878956989698752123459876798896998954349876989898765321299987726589997896943457898868988632',
  '2123985454567899996569643234569988989987999769499965678789887532989699897699876545894568976757994210',
  '9249874323879968995498755455678999878999899898989874465678998649876512998789765434789678985246789321',
  '8956965314689256789379876898789434569898799987878983234589998798654323459897654123678989764137995452',
  '7897975465892148993267987999896323479767679876567890123478999899876734789976543012569899892019896574',
  '6798986576791027894356798998965213568955589987699921334569998967998965678976432123498789999198789689',
  '5989998789892546789767999987654323479543456798989932456998897654559876789987543234987678998995678999',
  '9878999893999656789899894398765434599212345679879893569876799943234987891098854569886567897684569679',
  '7567898912498767899987789219876655678905479998768789798765688890123599992129765698765456796563499798',
  '6456987201999978989875699323987868989999569895656578999874567789294689989939876799854347897412989897',
  '2349876349899989976564568954598979399878998784343467899943248679989789877895987899965467893209878976',
  '1298765498799999965443657965679999298966987673212456789650134568978998765634998929876588965398767445',
  '2399976597678999874321347897989988997655696542102345678931246779769997643129899436988678976987654236',
  '3982989976567898765210256789998967789943987664213456899545656895656897654298789545698789987998532145',
  '9873498965456789874321387899876454677892199875354897987656987954346789865999679678939895499876543256',
  '9964987654356699985453598998765333456789019765465789499967898943256899977899989899125954345987654367',
  '9865698965234569876567679329874212345793129876576894329878969420123679998999896921034985456798798589',
  '9878789210125679987798989212983101234895234989987893212989654321234567899998765432129876568999897678'
];
