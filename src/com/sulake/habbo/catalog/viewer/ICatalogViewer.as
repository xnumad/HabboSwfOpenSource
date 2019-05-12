package com.sulake.habbo.catalog.viewer
{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import flash.events.Event;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;

    public interface ICatalogViewer 
    {
        function _Str_19388(_arg_1:int, _arg_2:String, _arg_3:IPageLocalization, _arg_4:Vector.<IPurchasableOffer>, _arg_5:int, _arg_6:Boolean):void;
        function dispatchWidgetEvent(_arg_1:Event):Boolean;
        function get catalog():IHabboCatalog;
        function get roomEngine():IRoomEngine;
        function dispose():void;
        function _Str_9089():String;
        function get _Str_20991():Array;
    }
}
