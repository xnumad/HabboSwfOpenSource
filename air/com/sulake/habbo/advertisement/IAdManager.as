//com.sulake.habbo.advertisement.IAdManager

package com.sulake.habbo.advertisement{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface IAdManager extends IUnknown {

        function get events():IEventDispatcher;
        function showInterstitial():Boolean;
        function loadRoomAdImage(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String, _arg_6:int):void;

    }
}//package com.sulake.habbo.advertisement

