package com.sulake.core.runtime
{
    public class ConsoleCoreErrorReporter implements ICoreErrorLogger 
    {
        public function logError(k:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void
        {
            Logger.log(k, ((_arg_4 != null) ? _arg_4.getStackTrace() : ""));
        }
    }
}
