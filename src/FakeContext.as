package 
{
    import com.sulake.core.runtime.IContext;
    import flash.events.IEventDispatcher;
    import com.sulake.core.assets.AssetLibraryCollection;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.display.DisplayObjectContainer;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import com.sulake.core.utils.LibraryLoader;
    import com.sulake.core.runtime.Component;
    import flash.system.ApplicationDomain;
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import __AS3__.vec.Vector;

    public class FakeContext implements IContext 
    {
        private var _eventDispatcher:IEventDispatcher;
        private var _assets:AssetLibraryCollection;
        private var _configurationManager:IHabboConfigurationManager;

        public function FakeContext()
        {
            this._eventDispatcher = new EventDispatcherWrapper();
            this._assets = new AssetLibraryCollection("fakeAssetCollection");
        }

        public function get assets():IAssetLibrary
        {
            return this._assets;
        }

        public function get events():IEventDispatcher
        {
            return this._eventDispatcher;
        }

        public function get root():IContext
        {
            return null;
        }

        public function error(k:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void
        {
        }

        public function getLastErrorMessage():String
        {
            return "";
        }

        public function debug(k:String):void
        {
        }

        public function getLastDebugMessage():String
        {
            return "";
        }

        public function warning(k:String):void
        {
        }

        public function getLastWarningMessage():String
        {
            return "";
        }

        public function get displayObjectContainer():DisplayObjectContainer
        {
            return null;
        }

        public function loadFromFile(k:URLRequest, _arg_2:LoaderContext):LibraryLoader
        {
            return null;
        }

        public function attachComponent(k:Component, _arg_2:Array):void
        {
        }

        public function detachComponent(k:Component):void
        {
        }

        public function prepareComponent(k:Class, _arg_2:uint=0, _arg_3:ApplicationDomain=null):IUnknown
        {
            return null;
        }

        public function prepareAssetLibrary(k:XML, _arg_2:Class):Boolean
        {
            return false;
        }

        public function registerUpdateReceiver(k:IUpdateReceiver, _arg_2:uint):void
        {
        }

        public function removeUpdateReceiver(k:IUpdateReceiver):void
        {
        }

        public function toXMLString(k:uint=0):String
        {
            return "";
        }

        public function queueInterface(k:IID, _arg_2:Function=null):IUnknown
        {
            return null;
        }

        public function release(k:IID):uint
        {
            return 0;
        }

        public function dispose():void
        {
            this._assets.dispose();
            this._eventDispatcher = null;
            this._assets = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }

        public function _Str_1230(k:Component):void
        {
        }

        public function get configuration():IHabboConfigurationManager
        {
            return this._configurationManager;
        }

        public function set configuration(k:IHabboConfigurationManager):void
        {
            this._configurationManager = k;
        }

        public function addLinkEventTracker(k:ILinkEventTracker):void
        {
        }

        public function removeLinkEventTracker(k:ILinkEventTracker):void
        {
        }

        public function createLinkEvent(k:String):void
        {
        }

        public function get linkEventTrackers():Vector.<ILinkEventTracker>
        {
            return null;
        }
    }
}
