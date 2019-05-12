package com.sulake.habbo.tracking
{
    import com.sulake.core.runtime.IUnknown;

    public interface IHabboTracking extends IUnknown 
    {
        function trackGoogle(_arg_1:String, _arg_2:String, _arg_3:int=-1):void;
        function _Str_3754(_arg_1:String, _arg_2:String, _arg_3:Array=null):void;
        function logError(_arg_1:String):void;
        function _Str_13181(_arg_1:int):void;
        function trackEventLog(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String="", _arg_5:int=0):void;
        function _Str_3990(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String="", _arg_5:int=0):void;
        function trackTalentTrackOpen(_arg_1:String, _arg_2:String):void;
    }
}
