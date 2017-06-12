/+ ------------------------------------------------------------ +
 + Author : aoitofu <aoitofu@dr.com>                            +
 + This is part of CAFE ( https://github.com/aoitofu/CAFE ).    +
 + ------------------------------------------------------------ +
 + Please see /LICENSE.                                         +
 + ------------------------------------------------------------ +/
module cafe.project.timeline.effect.Effect;
import cafe.project.timeline.property.PropertyList,
       cafe.project.timeline.PropertyKeepableObject,
       cafe.renderer.World;

/+ エフェクトクラス                                +
 + 多重継承の予定が無いので抽象クラスを使用します。+/
abstract class Effect : PropertyKeepableObject
{
    private:
        PropertyList props;

    public:
        static @property string name ();

        override @property PropertyList properties ()
        {
            return props;
        }

        @property Effect copy ();

        this ( Effect src )
        {
            props = new PropertyList( src.properties );
        }

        this ()
        {
            initProperties;
        }

        /+ Worldクラスにエフェクトをかける +/
        World apply ( World w )
        {
            return w;
        }
}