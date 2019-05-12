package org.openvideoads.vast.server.response
{
    import org.openvideoads.vast.server.request.AdServerRequest;
    import flash.events.Event;
    import org.openvideoads.vast.analytics._Str_2408;

    public interface _Str_3802 
    {
        function onAdCallStarted(_arg_1:AdServerRequest):void;
        function onAdCallFailover(_arg_1:AdServerRequest, _arg_2:AdServerRequest):void;
        function onAdCallComplete(_arg_1:AdServerRequest, _arg_2:Boolean):void;
        function onTemplateLoaded(_arg_1:AdServerTemplate):void;
        function onTemplateLoadError(_arg_1:Event):void;
        function _Str_5807(_arg_1:Event):void;
        function _Str_5916(_arg_1:Event):void;
        function get analyticsProcessor():_Str_2408;
        function get uid():String;
    }
}
