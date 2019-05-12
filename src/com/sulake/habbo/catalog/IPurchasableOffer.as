package com.sulake.habbo.catalog
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.catalog.viewer.ICatalogPage;
    import com.sulake.habbo.catalog.viewer.IProduct;
    import com.sulake.habbo.catalog.viewer.IProductContainer;
    import com.sulake.habbo.catalog.viewer.IGridItem;

    public interface IPurchasableOffer extends IDisposable 
    {
        function get _Str_2451():int;
        function get priceInActivityPoints():int;
        function get activityPointType():int;
        function get priceInCredits():int;
        function get page():ICatalogPage;
        function get _Str_13933():String;
        function get product():IProduct;
        function get productContainer():IProductContainer;
        function get gridItem():IGridItem;
        function get _Str_2696():String;
        function get _Str_3809():Boolean;
        function get _Str_6539():Boolean;
        function get _Str_4236():Boolean;
        function get _Str_3837():String;
        function set _Str_3413(_arg_1:int):void;
        function get _Str_3413():int;
        function get clubLevel():int;
        function get _Str_2494():String;
        function set page(_arg_1:ICatalogPage):void;
        function get _Str_8112():String;
        function get _Str_7274():String;
    }
}
