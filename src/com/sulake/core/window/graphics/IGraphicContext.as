package com.sulake.core.window.graphics
{
    import flash.display.IBitmapDrawable;
    import flash.events.IEventDispatcher;
    import com.sulake.core.runtime.IDisposable;
    import flash.display.DisplayObjectContainer;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.display.BitmapData;
    import flash.display.DisplayObject;

    public interface IGraphicContext extends IBitmapDrawable, IEventDispatcher, IDisposable 
    {
        function get parent():DisplayObjectContainer;
        function set parent(_arg_1:DisplayObjectContainer):void;
        function get filters():Array;
        function set filters(_arg_1:Array):void;
        function get visible():Boolean;
        function set visible(_arg_1:Boolean):void;
        function get blend():Number;
        function set blend(_arg_1:Number):void;
        function get _Str_10223():Boolean;
        function set _Str_10223(_arg_1:Boolean):void;
        function _Str_24550(_arg_1:Point):void;
        function getDrawRegion():Rectangle;
        function _Str_15334(_arg_1:Rectangle, _arg_2:Boolean, _arg_3:Rectangle):BitmapData;
        function getDisplayObject():DisplayObject;
        function setDisplayObject(_arg_1:DisplayObject):DisplayObject;
        function getAbsoluteMousePosition(_arg_1:Point):void;
        function getRelativeMousePosition(_arg_1:Point):void;
        function fetchDrawBuffer():IBitmapDrawable;
        function _Str_23788(_arg_1:Rectangle):void;
        function get _Str_13711():int;
        function _Str_22175(_arg_1:IGraphicContext):IGraphicContext;
        function _Str_16175(_arg_1:IGraphicContext, _arg_2:int):IGraphicContext;
        function _Str_16021(_arg_1:int):IGraphicContext;
        function _Str_24886(_arg_1:IGraphicContext):int;
        function _Str_17938(_arg_1:IGraphicContext):IGraphicContext;
        function _Str_19139(_arg_1:int):IGraphicContext;
        function _Str_19243(_arg_1:IGraphicContext, _arg_2:int):void;
        function _Str_20742(_arg_1:IGraphicContext, _arg_2:IGraphicContext):void;
        function _Str_21032(_arg_1:int, _arg_2:int):void;
    }
}
