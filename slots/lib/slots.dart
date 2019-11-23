import 'dart:math';

class SlotMachine
{

  List<Reel> reels = new List<Reel>();
  Random _random = new Random(0);

  Symb next(int reel)
  {
    return reels[reel].next();
  }
  int spin(int reel)
  {
    return 100 + _random.nextInt(9);
  }

  SlotMachine(int reelCount, int symbCount){
    for(int i = 0;i < reelCount;i++)
    {
      Reel r = new Reel();
      for(int j = 0;j < symbCount;j++)
      {
        Symb s = new Symb();
        s.value = (j+1).toString();
        r._symbs.add(s);
      }
      reels.add(r);
    }
  }
 

}
class Reel
{
  List<Symb> _symbs = new List<Symb>();
  int _hit = 0;
  Symb current()
  {
    return _symbs[_hit];
  }
  Symb next()
  {
    _hit++;
    if (_hit == _symbs.length)
      _hit = 0;
    return _symbs[_hit];
  }

}

class Symb
{
  String value;
}