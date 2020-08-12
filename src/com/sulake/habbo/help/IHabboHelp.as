package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IHabboHelp extends IUnknown 
    {
        function requestGuide():void;
        function get events():IEventDispatcher;
        function reportBully(_arg_1:int):void;
        function startPhotoReportingInNewCfhFlow(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:int):void;
        function reportUser(_arg_1:int, _arg_2:int, _arg_3:String):void;
        function reportUserName(_arg_1:int, _arg_2:String):void;
        function reportUserFromIM(_arg_1:int):void;
        function reportRoom(_arg_1:int, _arg_2:String, _arg_3:String):void;
        function reportThread(_arg_1:int, _arg_2:int):void;
        function reportMessage(_arg_1:int, _arg_2:int, _arg_3:int):void;
        function reportSelfie(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int):Boolean;
        function reportPhoto(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):Boolean;
        function startNameChange():void;
        function showWelcomeScreen(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:String=null):void;
        function set outsideRoom(_arg_1:Boolean):void;
        function showHabboWay():void;
        function showSafetyBooklet():void;
        function showTourPopup():void;
    }
}
