import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../hero.dart';
import '../heroData/heroDataService.dart';

@Component (
    selector: 'hero-list',
    templateUrl: 'hero_list.html',
    styleUrls: const ['hero_list.css']
)

class HeroList implements OnInit{
    final HeroDataService _heroDataService;
    final Router _router;

    List<Hero> heroes;
    Hero selectedHero;

    HeroList(this._heroDataService, this._router);

    void ngOnInit() {
      getHeroes();
    }

   Future<Null> getHeroes() async {
      heroes = await _heroDataService.getHeroes();
   }

    void onSelect(Hero hero) {
        selectedHero = hero;
    }

    void gotoDetail(Hero hero) {
      var link = ['HeroDetail', {'id':hero.id.toString()}];
      _router.navigate(link);
    }
}
