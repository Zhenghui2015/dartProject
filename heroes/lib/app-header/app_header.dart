import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../hero.dart';
import '../heroData/heroDataService.dart';
import '../hero_list/hero_list.dart';
import '../hero_table/hero_table.dart';
import '../hero_detail/hero_detail.dart';

@Component (
    selector: 'app-header',
    templateUrl: 'app_header.html',
    styleUrls: const ['app_header.css'],
    providers: const [ROUTER_PROVIDERS,HeroDataService],
    directives: const [ROUTER_DIRECTIVES]
)

@RouteConfig( const[
    const Route(path: '/heroes', name: 'Heroes', component: HeroList),
    const Route(path: '/dashboard', name: 'Dashboard', component: HeroTable, useAsDefault: true),
    const Route(path: '/detail/:id', name: 'HeroDetail', component: HeroDetail)
])

class AppHeader {
    String title = "Tour of Heroes";
}