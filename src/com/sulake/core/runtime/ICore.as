package com.sulake.core.runtime
{
    import flash.events.IEventDispatcher;

    public interface ICore extends IContext, IHabboConfigurationManager 
    {
        function initialize():void;
        function purge():void;
        function hibernate(_arg_1:int, _arg_2:int=1):void;
        function resume():void;
        function readConfigDocument(_arg_1:XML, _arg_2:IEventDispatcher=null):void;
        function getNumberOfFilesPending():uint;
        function getNumberOfFilesLoaded():uint;
        function setProfilerMode(_arg_1:Boolean):void;
    }
}
