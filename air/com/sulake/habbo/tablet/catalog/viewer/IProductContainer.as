//com.sulake.habbo.tablet.catalog.viewer.IProductContainer

package com.sulake.habbo.tablet.catalog.viewer{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;
    import __AS3__.vec.Vector;

    public /*dynamic*/ interface IProductContainer extends IDisposable {

        function initProductIcon(k:IRoomEngine, _arg_2:IStuffData=null):void;
        function activate():void;
        function get products():Vector.<IProduct>;
        function get firstProduct():IProduct;
        function set grid(k:IItemGrid):void;
        function setClubIconLevel(k:int):void;

    }
}//package com.sulake.habbo.tablet.catalog.viewer

