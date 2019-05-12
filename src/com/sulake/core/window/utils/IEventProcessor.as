package com.sulake.core.window.utils
{
    public interface IEventProcessor 
    {
        function process(_arg_1:EventProcessorState, _arg_2:IEventQueue):void;
    }
}
