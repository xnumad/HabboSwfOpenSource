package com.sulake.habbo.catalog.offers
{
    import com.sulake.core.runtime.IDisposable;

    public interface IOfferProvider extends IDisposable 
    {
        function get enabled():Boolean;
        function load():void;
        function showVideo():void;
        function get _Str_15510():Boolean;
        function get _Str_16897():Boolean;
    }
}
