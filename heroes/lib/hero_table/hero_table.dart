import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../hero.dart';
import '../heroData/heroDataService.dart';

@Component (
    selector: 'hero-table',
    templateUrl: 'hero_table.html',
    styleUrls: const ['hero_table.css']
)

class HeroTable implements OnInit{
    final HeroDataService _heroDataService;
    final Router _router;
    List<Hero> heroes;

    HeroTable(this._heroDataService, this._router);

    Future<Null> ngOnInit() async{
        heroes = (await _heroDataService.getHeroes()).skip(1).take(4).toList();
    }

    void gotoDetail(Hero hero) {
        var link = ['HeroDetail', {'id':hero.id.toString()}];
        _router.navigate(link);
    }


}