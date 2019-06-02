//com.sulake.habbo.catalog.marketplace.IMarketPlaceOfferData

package com.sulake.habbo.catalog.marketplace{
    import com.sulake.habbo.room.IStuffData;
    import flash.display.BitmapData;

    public /*dynamic*/ interface IMarketPlaceOfferData {

        function get offerId():int;
        function get furniId():int;
        function get furniType():int;
        function get extraData():String;
        function get stuffData():IStuffData;
        function get price():int;
        function get averagePrice():int;
        function get image():BitmapData;
        function set image(k:BitmapData):void;
        function set imageCallback(k:int):void;
        function get imageCallback():int;
        function get status():int;
        function get timeLeftMinutes():int;
        function set timeLeftMinutes(k:int):void;
        function set price(k:int):void;
        function set offerId(k:int):void;
        function get offerCount():int;
        function set offerCount(k:int):void;

    }
}//package com.sulake.habbo.catalog.marketplace

