package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.catalog.IPurchasableOffer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.room.IStuffData;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindowContainer;

    public interface IProduct extends IGetImageListener, IDisposable 
    {
        function get _Str_2588():String;
        function get _Str_2941():int;
        function set _Str_2415(_arg_1:String):void;
        function get _Str_2415():String;
        function get productCount():int;
        function get _Str_8554():IProductData;
        function get _Str_2686():IFurnitureData;
        function get isUniqueLimitedItem():Boolean;
        function get isColorable():Boolean;
        function get uniqueLimitedItemSeriesSize():int;
        function get uniqueLimitedItemsLeft():int;
        function set uniqueLimitedItemsLeft(_arg_1:int):void;
        function _Str_13474(_arg_1:IProductContainer, _arg_2:IGetImageListener=null, _arg_3:IAvatarImageListener=null, _arg_4:IPurchasableOffer=null, _arg_5:IBitmapWrapperWindow=null, _arg_6:IStuffData=null, _arg_7:Function=null):BitmapData;
        function set view(_arg_1:IWindowContainer):void;
        function set grid(_arg_1:_Str_4311):void;
    }
}
