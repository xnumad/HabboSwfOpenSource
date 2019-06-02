//com.sulake.core.runtime.ICore

package com.sulake.core.runtime{
    import flash.events.IEventDispatcher;
    import com.sulake.core.utils.IFileProxy;

    public /*dynamic*/ interface ICore extends IContext, ICoreConfiguration {

        function initialize():void;
        function purge():void;
        function hibernate(k:int, _arg_2:int=1):void;
        function resume():void;
        function readConfigDocument(k:XML, _arg_2:IEventDispatcher=null):void;
        function getNumberOfFilesPending():uint;
        function getNumberOfFilesLoaded():uint;
        function setProfilerMode(k:Boolean):void;
        function get fileProxy():IFileProxy;
        function skipContext3DPresent():void;

    }
}//package com.sulake.core.runtime

