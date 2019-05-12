package org.openvideoads.vast.playlist
{
    import org.openvideoads.vast.schedule.Stream;
    import org.openvideoads.vast.config.groupings.ProvidersConfigGroup;

    public interface _Str_3480 
    {
        function set stream(_arg_1:Stream):void;
        function get stream():Stream;
        function set index(_arg_1:int):void;
        function get index():int;
        function set provider(_arg_1:String):void;
        function get provider():String;
        function set providers(_arg_1:ProvidersConfigGroup):void;
        function get providers():ProvidersConfigGroup;
        function set streamer(_arg_1:String):void;
        function get streamer():String;
        function get title():String;
        function get link():String;
        function get description():String;
        function set filename(_arg_1:String):void;
        function get filename():String;
        function set url(_arg_1:String):void;
        function get url():String;
        function set mimeType(_arg_1:String):void;
        function get mimeType():String;
        function get loadOnDemand():Boolean;
        function _Str_16634():Boolean;
        function isInteractive():Boolean;
        function _Str_5059(_arg_1:Boolean=true):String;
        function getQualifiedStreamAddress():String;
        function get duration():String;
        function _Str_17310():int;
        function _Str_24674():String;
        function getStartTimeAsSeconds():int;
        function _Str_17397():String;
        function getType():String;
        function _Str_21970():String;
        function toString(_arg_1:Boolean=false):String;
        function toShowStreamConfigObject():Object;
        function isRTMP():Boolean;
        function _Str_25252():Boolean;
        function reset():void;
        function rewind():void;
        function _Str_10174():Boolean;
        function _Str_22734():Boolean;
    }
}
