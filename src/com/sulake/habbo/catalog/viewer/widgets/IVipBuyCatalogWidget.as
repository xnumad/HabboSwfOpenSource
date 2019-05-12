package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.club.ClubBuyOfferData;

    public interface IVipBuyCatalogWidget 
    {
        function dispose():void;
        function init():Boolean;
        function reset():void;
        function _Str_15013(_arg_1:int):void;
        function _Str_6059(_arg_1:ClubBuyOfferData):void;
        function get isGift():Boolean;
    }
}
