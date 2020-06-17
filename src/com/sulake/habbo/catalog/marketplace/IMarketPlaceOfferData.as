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
        function get averagePrice():int;
        function get image():BitmapData;
        function set image(_arg_1:BitmapData):void;
        function set imageCallback(_arg_1:int):void;
        function get imageCallback():int;
        function get status():int;
        function get timeLeftMinutes():int;
        function set timeLeftMinutes(_arg_1:int):void;
        function set price(_arg_1:int):void;
        function set offerId(_arg_1:int):void;
        function get offerCount():int;
        function set offerCount(_arg_1:int):void;
    }
}
