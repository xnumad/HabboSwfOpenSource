//com.sulake.habbo.tracking.IHabboTracking

package com.sulake.habbo.tracking{
    import com.sulake.core.runtime.IUnknown;

    public /*dynamic*/ interface IHabboTracking extends IUnknown {

        function trackComufyScalar(k:String, _arg_2:String):void;
        function trackComufyMultiVal(k:String, _arg_2:Array, _arg_3:String):void;
        function trackGoogle(k:String, _arg_2:String, _arg_3:int=-1):void;
        function legacyTrackGoogle(k:String, _arg_2:String, _arg_3:Array=null):void;
        function logError(k:String):void;
        function chatLagDetected(k:int):void;
        function trackEventLog(k:String, _arg_2:String, _arg_3:String, _arg_4:String="", _arg_5:int=0):void;
        function trackTalentTrackOpen(k:String, _arg_2:String):void;

    }
}//package com.sulake.habbo.tracking

