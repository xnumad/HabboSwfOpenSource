//com.sulake.core.window.components.IScrollableWindow

package com.sulake.core.window.components{
    import com.sulake.core.window.IWindow;
    import flash.geom.Rectangle;

    public /*dynamic*/ interface IScrollableWindow extends IWindow {

        function get scrollH():Number;
        function get scrollV():Number;
        function set scrollH(k:Number):void;
        function set scrollV(k:Number):void;
        function get scrollStepH():Number;
        function get scrollStepV():Number;
        function set scrollStepH(k:Number):void;
        function set scrollStepV(k:Number):void;
        function get maxScrollH():int;
        function get maxScrollV():int;
        function get visibleRegion():Rectangle;
        function get scrollableRegion():Rectangle;

    }
}//package com.sulake.core.window.components

