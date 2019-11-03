import 'dart:math';

class SlotMachine
{
  int _balance = 0;
  int _autobet = 0;
  List<Reel> _reels = new List<Reel>();
  Random _random = new Random(0);
  int balance()
  {
    return _balance;
  }
  int payout()
  {
    int payout = _balance;
    _balance = 0;
    return payout;
  }
  void spin(int bet)
  {
    
    _reels.forEach((reel)=>reel._hit = _random.nextInt(reel._symbs.length));
  }
  List<Symb> current()
  {
    List<Symb> result = new List<Symb>();
    _reels.forEach((reel)=>result.add(reel._symbs[reel._hit]));    
    return result;
  }
  
  SlotMachine(int reels, int symbs){
    for(int i = 0;i < reels;i++)
    {
      Reel r = new Reel();
      for(int j = 0;j < symbs;j++)
      {
        Symb s = new Symb();
        s.value = (j+1).toString();
        r._symbs.add(s);
      }
      this._reels.add(r);
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
}

class Symb
{
  String value;
}