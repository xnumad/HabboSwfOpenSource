package com.sulake.core.runtime
{
    public interface IUnknown extends IDisposable 
    {
        function queueInterface(_arg_1:IID, _arg_2:Function=null):IUnknown;
        function release(_arg_1:IID):uint;
    }
}
