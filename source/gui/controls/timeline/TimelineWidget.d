/+ ------------------------------------------------------------ +
 + Author : aoitofu <aoitofu@dr.com>                            +
 + This is part of CAFE ( https://github.com/aoitofu/CAFE ).    +
 + ------------------------------------------------------------ +
 + Please see /LICENSE.                                         +
 + ------------------------------------------------------------ +/
module cafe.gui.controls.timeline.TimelineWidget;
import cafe.project.Project,
       cafe.project.timeline.Timeline,
       cafe.gui.controls.timeline.Cache,
       cafe.gui.controls.timeline.Grid;
import dlangui;

/+ タイムラインウィジェット +/
class TimelineWidget : VerticalLayout
{
    enum LineHeaderWidth = 150;

    enum HScrollLayout = q{
        ScrollBar {
            id:hscroll;
            orientation:Horizontal
        }
    };
    enum MainLayout = q{
        HorizontalLayout {
            layoutWidth:FILL_PARENT;
            VerticalLayout {
                HorizontalLayout {
                    HSpacer { id:grid_spacer }
                    TimelineGrid { id:grid }
                }
                HSpacer { id:canvas }
            }
            ScrollBar { id:vscroll; orientation:Vertical }
        }
    };

    private:
        Cache cache;

        ScrollBar hscroll;
        ScrollBar vscroll;
        TimelineGrid grid;

        auto hscrolled ( AbstractSlider, ScrollEvent e )
        {
            if ( !cache.timeline ) return false;

            cache.timeline.leftFrame  = hscroll.position;
            cache.timeline.rightFrame = cache.timeline.leftFrame + hscroll.pageSize;
            cache.updateGridCache( grid.pos );
            grid.invalidate;
            return true;
        }

    public:
        this ( string id, Project p, Timeline t )
        {
            super( id );
            layoutWidth  = FILL_PARENT;
            layoutHeight = FILL_PARENT;

            cache = new Cache( p, t );

            addChild( parseML( HScrollLayout ) );
            addChild( parseML( MainLayout ) );

            hscroll = cast(ScrollBar)childById( "hscroll" );
            vscroll = cast(ScrollBar)childById( "vscroll" );
            grid = cast(TimelineGrid)childById( "grid" );

            hscroll.scrollEvent = &hscrolled;

            grid.setCache( cache );
        }

        override void measure ( int w, int h )
        {
            childById("grid_spacer").minWidth = LineHeaderWidth;
            grid.minHeight = 50;
            grid.minWidth  = w - LineHeaderWidth;

            childById("canvas").minHeight = h;

            super.measure( w, h );
            cache.updateGridCache( grid.pos );
        }
}
