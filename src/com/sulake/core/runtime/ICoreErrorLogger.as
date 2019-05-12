package com.sulake.core.runtime
{
    public interface ICoreErrorLogger 
    {
        function logError(_arg_1:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void;
    }
}
