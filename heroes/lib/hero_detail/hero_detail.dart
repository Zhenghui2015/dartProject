import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../hero.dart';
import '../heroData/heroDataService.dart';

@Component (
    selector: 'hero-detail',
    templateUrl: 'hero_detail.html',
    styleUrls: const ['hero_detail.css']
)

class HeroDetail implements OnInit{
    final HeroDataService _heroDataService;
    final RouteParams _routeParams;
    final Router _router;

    Hero hero;

    HeroDetail(this._heroDataService, this._routeParams, this._router);

    Future<Null> ngOnInit() async {
        var idString = _routeParams.get("id");
        var id = int.parse(idString, onError: (_)=>null);
        if(id != null) hero = await (_heroDataService.getHero(id));
    }

    //goBack function
    void goBack() {
        var link = ['Dashboard'];
        _router.navigate(link);
    }
}