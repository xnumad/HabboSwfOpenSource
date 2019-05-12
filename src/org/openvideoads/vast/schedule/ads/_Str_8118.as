package org.openvideoads.vast.schedule.ads
{
    import org.openvideoads.vast.events._Str_3250;
    import org.openvideoads.vast.server.request.AdServerRequest;

    public interface _Str_8118 
    {
        function _Str_22061(_arg_1:_Str_3250):void;
        function _Str_16628(_arg_1:_Str_3250):void;
        function _Str_24831(_arg_1:_Str_3250):void;
        function _Str_20322(_arg_1:_Str_3250):void;
        function onAdCallStarted(_arg_1:AdServerRequest):void;
        function onAdCallFailover(_arg_1:AdServerRequest, _arg_2:AdServerRequest):void;
        function onAdCallComplete(_arg_1:AdServerRequest, _arg_2:Boolean):void;
    }
}
