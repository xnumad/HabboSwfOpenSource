package com.sulake.habbo.advertisement
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IAdManager extends IUnknown 
    {
        function get events():IEventDispatcher;
        function showInterstitial():void;
        function loadRoomAdImage(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String):void;
    }
}
