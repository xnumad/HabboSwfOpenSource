package com.sulake.core.window.graphics.renderer
{
    import com.sulake.core.window.utils.IChildEntityArray;
    import flash.geom.Rectangle;

    public interface ISkinLayout extends IChildEntityArray 
    {
        function get name():String;
        function get width():uint;
        function get height():uint;
        function get blendMode():String;
        function get transparent():Boolean;
        function dispose():void;
        function isFixedWidth():Boolean;
        function isFixedHeight():Boolean;
        function getDefaultRegion(_arg_1:String, _arg_2:Rectangle):void;
    }
}
