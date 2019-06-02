package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindow;
    import flash.geom.Rectangle;

    public interface IScrollableWindow extends IWindow 
    {
        function get scrollH():Number;
        function get scrollV():Number;
        function set scrollH(_arg_1:Number):void;
        function set scrollV(_arg_1:Number):void;
        function get scrollStepH():Number;
        function get scrollStepV():Number;
        function set scrollStepH(_arg_1:Number):void;
        function set scrollStepV(_arg_1:Number):void;
        function get maxScrollH():int;
        function get maxScrollV():int;
        function get _Str_3707():Rectangle; //visibleRegion
        function get visibleRegion():Rectangle;
    }
}
