//com.sulake.core.Core

package com.sulake.core{
    import com.sulake.core.runtime.ICore;
    import flash.display.DisplayObjectContainer;
    import com.sulake.core.runtime.ICoreErrorReporter;

    public final class Core {

        public static const CORE_SETUP_FRAME_UPDATE_SIMPLE:uint;
        public static const CORE_SETUP_FRAME_UPDATE_COMPLEX:uint;
        public static const CORE_SETUP_FRAME_UPDATE_PROFILER:uint;
        public static const CORE_SETUP_FRAME_UPDATE_EXPERIMENT:uint;
        public static const CORE_SETUP_FRAME_UPDATE_MASK:uint;
        public static const CORE_SETUP_DEBUG:uint;
        public static const ERROR_CATEGORY_DOWNLOAD_CONFIGURATION:int;
        public static const ERROR_CATEGORY_DOWNLOAD_LIBRARY:int;
        public static const ERROR_CATEGORY_DOWNLOAD_CRITICAL_ASSET:int;
        public static const ERROR_CATEGORY_PREPARE_COMPONENT:int;
        public static const ERROR_CATEGORY_COMPONENT_RESOURCE_LOAD_ERROR:int;
        public static const ERROR_CATEGORY_INTERFACE_AVAILABILITY:int;
        public static const ERROR_CATEGORY_PRODUCT_DATA:int;
        public static const ERROR_CATEGORY_DOWNLOAD_LOCALIZATION:int;
        public static const ERROR_CATEGORY_FINALIZE_PRELOADING:int;
        public static const ERROR_CATEGORY_INITIALIZE_CORE:int;
        public static const ERROR_CATEGORY_DOWNLOAD_FONT:int;
        public static const ERROR_CATEGORY_FURNIDATA_DOWNLOAD:int;
        public static const ERROR_CATEGORY_DOWNLOAD_EXTERNAL_VARIABLES:int;
        public static const ERROR_CATEGORY_DOWNLOAD_EXTERNAL_VARIABLES_OVERRIDE:int;
        public static const ERROR_CATEGORY_COMMMUNICATION_INIT:int;
        public static const ERROR_CATEGORY_CONNECT_TO_PROXY:int;
        public static const ERROR_UNCAUGHT_ERROR:int;
        public static const ERROR_CATEGORY_INTENTIONAL_DEBUG_CRASH:int;
        private static var _instance:ICore;

        public function Core();

        public static function get version():String;

        public static function get instance():ICore;

        public static function instantiate(k:DisplayObjectContainer, _arg_2:uint, _arg_3:ICoreErrorReporter=null):ICore;

        public static function error(k:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void;

        public static function warning(k:String):void;

        public static function debug(k:String):void;

        public static function crash(k:String, _arg_2:int, _arg_3:Error=null):void;

        public static function purge():void;

        public static function dispose():void;


    }
}//package com.sulake.core

