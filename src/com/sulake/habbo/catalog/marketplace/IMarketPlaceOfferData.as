package com.sulake.habbo.catalog.marketplace
{
    import com.sulake.habbo.room.IStuffData;
    import flash.display.BitmapData;

    public interface IMarketPlaceOfferData 
    {
        function get offerId():int;
        function get furniId():int;
        function get furniType():int;
        function get extraData():String;
        function get stuffData():IStuffData;
        function get price():int;
        function get _Str_3925():int;
        function get image():BitmapData;
        function set image(_arg_1:BitmapData):void;
        function set _Str_4774(_arg_1:int):void;
        function get _Str_4774():int;
        function get status():int;
        function get _Str_5853():int;
        function set _Str_5853(_arg_1:int):void;
        function set price(_arg_1:int):void;
        function set offerId(_arg_1:int):void;
        function get _Str_4121():int;
        function set _Str_4121(_arg_1:int):void;
    }
}
