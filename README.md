# game

class Bezigon
{
    
    List<Anchor> anchors;
    double smoothness;
    Continuity continuity;
    bool closed;

    Bezigon(List<Vector2D> points, {this.closed:true, this.smoothnes:.55,this.continuity:Continuity.C1} )
    {
        this.anchors = new List<Anchor>();
        for(p:points)
        {
            Anchor a = new Anchor(p, cn:cn);
            this.anchors.add(a);            
        }
        recalculate();
    }

    recalculate
    {
        int l = this.anchors.length();
        for(int i = 0; i < this.anchors.length;i++)
        {
            Anchor a = this.anchors[i];
            previous = i != 0 ? i - 1 : (this.closed ? l - 1 : 0);
            next = i != l - 1 ? i + 1 : (this.closed ? 0 :l - 1);
            _updateControlPoints(a,this.anchors[previous].middle,this.anchors[next].middle,this.smoothness);           
        }
        this.beziers = new List<Bezier>();
        for(i = 0; i < this.anchors.length;i++)
        {
            if(this.closed && i == l - 1)
                continue;
            Anchor c = this.anchors[i];
            next = i != l - 1 ? i + 1 : (this.closed ? 0 :l - 1);
            Anchor n = this.anchors[next];            
            Bezier bezier = new CubicBezier(c.middle,c.right,n.left,n.middle);
            this.beziers.add(bezier);
        }

    }


    _updateControlPoints(Anchor a, Vector2 p0, Vector2 p2, double smoothness, Continuity cn)
    {
        Vector2 p1 = a.middle;
        let d01 = Math.sqrt(Math.pow(p1.x-p0.x,2)+Math.pow(p1.y-p0.y,2));
        let d12=Math.sqrt(Math.pow(p2.x-p1.x,2)+Math.pow(p2.y-p1.y,2));
        let fa=smoothness*d01/(d01+d12);   // scaling factor for triangle Ta
        let fb=smoothness*d12/(d01+d12);   // ditto for Tb, simplifies to fb=t-fa
        if (cn == Continuity.C2)
        {
            fa = (fa + fb) / 2;
        }
        a.left.x=p1.x-fa*(p2.x-p0.x);    // p2.x-p0.x is the width of triangle T
        a.left.y=p1.y-fa*(p2.y-p0.y);    // p2.y-p0.y is the height of T
        a.right.x=p1.x+fb*(p2.x-p0.x);
        a.right.y=p1.y+fb*(p2.y-p0.y);            
    }

    List<Vector2> lookupTable({int steps:100})
    {
        List<Vector2> lut = new List<Vector2>();

        for(Bezier b in this.beziers)
        {



        }

    }
}

BezigonCache extends Bezier
{
    get derivarives;

}

class Anchor
{
    Vector2 left;
    Vector2 right;
    Vector2 middle;
    Continuity cn;

    Anchor(Vector2 this.middle, {this.cn:Continuity.C1, this.left:new Vector2(), this.right:new Vector2()})
    {

    }

}

enum Continuity
{
    C0,C1,C2
}

