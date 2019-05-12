package com.sulake.habbo.catalog.marketplace
{
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.utils.Map;

    public interface IMarketPlace 
    {
        function get windowManager():IHabboWindowManager;
        function get localization():IHabboLocalizationManager;
        function _Str_7410(_arg_1:IMarketPlaceVisualization=null):void;
        function _Str_14328(_arg_1:IMessageEvent):void;
        function _Str_20942(_arg_1:IMessageEvent):void;
        function _Str_20544(_arg_1:IMessageEvent):void;
        function _Str_21141(_arg_1:IMessageEvent):void;
        function _Str_24036(_arg_1:String):void;
        function _Str_23282(_arg_1:int):void;
        function _Str_8093(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int):void;
        function _Str_18887():void;
        function _Str_21939():void;
        function _Str_20810(_arg_1:int, _arg_2:int):void;
        function _Str_18095(_arg_1:int):void;
        function _Str_19634(_arg_1:int):void;
        function _Str_21640():void;
        function _Str_15909():Map;
        function _Str_18294():Map;
        function _Str_13564():int;
        function set _Str_10038(_arg_1:MarketplaceItemStats):void;
        function get _Str_10038():MarketplaceItemStats;
        function get _Str_15236():int;
        function get _Str_5014():int;
        function set _Str_5014(_arg_1:int):void;
        function _Str_10102(_arg_1:IMarketPlaceOfferData):String;
        function _Str_12650(_arg_1:IMarketPlaceOfferData):String;
        function _Str_4701():Boolean;
    }
}
