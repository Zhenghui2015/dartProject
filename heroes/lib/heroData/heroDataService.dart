import 'dart:async';

import 'package:angular2/core.dart';

import 'heroesDataSet.dart';
import '../hero.dart';

@Injectable()
class HeroDataService{
    Future<List<Hero>> getHeroes()  async {
      return mockHeroes;
    }

    Future<Hero> getHero(int id) async {
      return (await getHeroes()).firstWhere((hero) => hero.id == id);
    }
}