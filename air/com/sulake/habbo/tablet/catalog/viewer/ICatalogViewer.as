//com.sulake.habbo.tablet.catalog.viewer.ICatalogViewer

package com.sulake.habbo.tablet.catalog.viewer{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.tablet.catalog.IPurchasableOffer;
    import flash.events.Event;
    import com.sulake.habbo.tablet.catalog.IHabboTabletCatalog;
    import com.sulake.habbo.room.IRoomEngine;

    public /*dynamic*/ interface ICatalogViewer {

        function showCatalogPage(k:int, _arg_2:String, _arg_3:IPageLocalization, _arg_4:Vector.<IPurchasableOffer>, _arg_5:int, _arg_6:Boolean):void;
        function dispatchWidgetEvent(k:Event):Boolean;
        function get catalog():IHabboTabletCatalog;
        function get roomEngine():IRoomEngine;
        function dispose():void;
        function getCurrentLayoutCode():String;
        function get viewerTags():Array;

    }
}//package com.sulake.habbo.tablet.catalog.viewer

