package com.sulake.habbo.configuration
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import flash.utils.Dictionary;
    import com.sulake.habbo.configuration.enum.HabboConfigurationFlags;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import flash.events.Event;
    import __AS3__.vec.Vector;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.Core;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.utils.ErrorReportStorage;
    import flash.system.Security;
    import com.sulake.core.assets.TextAsset;
    import flash.display.Stage;

    public class HabboConfigurationManager extends Component implements IHabboConfigurationManager 
    {
        private static const INTERPOLATION_DEPTH_LIMIT:int = 3;
        private static const _environmentId:String = "%";
        private static const FUSELOGIN:String = "fuselogin";

        private var _skipExternalConfigurations:Boolean = false;
        private var _skipLocalizations:Boolean = false;
        private var _configurations:Dictionary;
        private var _initialized:Boolean = false;
        private var _readOnlyProperties:Array;
        private var _useHttps:Boolean = false;

        public function HabboConfigurationManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            this._readOnlyProperties = [];
            super(k, _arg_2, _arg_3);
            k.configuration = this;
            this._skipExternalConfigurations = ((_arg_2 & HabboConfigurationFlags._Str_18739) > 0);
            this._skipLocalizations = ((_arg_2 & HabboConfigurationFlags._Str_18181) > 0);
            this._configurations = new Dictionary();
            this.parseCommonVariables();
            this.parseLocalizationVariables();
            this.setDefaults();
            this.setupDefaultDevelopmentEnvironment();
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboLocalizationManager(), null, false, [{
                "type":Event.COMPLETE,
                "callback":this.onLocalizationComplete
            }])]));
        }

        override protected function initComponent():void
        {
        }

        private function setupDefaultDevelopmentEnvironment():void
        {
            if (this._skipExternalConfigurations)
            {
                this._initialized = true;
                events.dispatchEvent(new Event(Event.COMPLETE));
            }
            else
            {
                lock();
                if (this._skipLocalizations)
                {
                    this.initConfigurationDownload();
                }
            }
        }

        override public function dispose():void
        {
            super.dispose();
        }

        override public function propertyExists(k:String):Boolean
        {
            var _local_2:String = (this._configurations[k] as String);
            return !(_local_2 == null);
        }

        override public function getProperty(k:String, _arg_2:Dictionary=null):String
        {
            var _local_3:String = (this._configurations[k] as String);
            _local_3 = this.interpolate(_local_3);
            if (_local_3 == null)
            {
                return "";
            }
            if (_local_3.substr(0, 2) == "//")
            {
                _local_3 = (((this._useHttps) ? "https:" : "http:") + _local_3);
            }
            _local_3 = this.updateUrlProtocol(_local_3);
            if (_arg_2 != null)
            {
                _local_3 = this.fillParams(_local_3, _arg_2);
            }
            return _local_3;
        }

        override public function setProperty(k:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false):void
        {
            if (_arg_4)
            {
                if (this._configurations[k] == null)
                {
                    Logger.log(((k + "=") + _arg_2));
                }
            }
            if (((this._readOnlyProperties.indexOf(k) < 0) || (_arg_3)))
            {
                this._configurations[k] = _arg_2;
            }
            if (_arg_3)
            {
                this._readOnlyProperties.push(k);
            }
        }

        override public function getBoolean(k:String):Boolean
        {
            var _local_2:String = (this._configurations[k] as String);
            if (_local_2 == null)
            {
                return false;
            }
            return (_local_2 == "1") || (_local_2.toLowerCase() == "true");
        }

        override public function getInteger(k:String, _arg_2:int):int
        {
            var _local_3:String = (this._configurations[k] as String);
            if (_local_3 == null)
            {
                return _arg_2;
            }
            return int(_local_3);
        }

        override public function updateUrlProtocol(k:String):String
        {
            var _local_2:String = k;
            if (this._useHttps)
            {
                _local_2 = k.replace("http://", "https://");
                _local_2 = _local_2.replace(":8080/", ":8443/");
            }
            return _local_2;
        }

        override public function interpolate(k:String):String
        {
            var _local_5:Object;
            var _local_6:int;
            var _local_7:String;
            if (k == null)
            {
                return null;
            }
            var _local_2:String = k;
            var _local_3:RegExp = /\${([^}]*)}/g;
            var _local_4:int;
            while (_local_4 < INTERPOLATION_DEPTH_LIMIT)
            {
                _local_6 = 0;
                _local_7 = "";
                do 
                {
                    _local_5 = _local_3.exec(_local_2);
                    if (_local_5 == null)
                    {
                        break;
                    }
                    if (!this.propertyExists(_local_5[1]))
                    {
                        return null;
                    }
                    _local_7 = (_local_7 + _local_2.substring(_local_6, _local_5.index));
                    _local_7 = (_local_7 + this.getProperty(_local_5[1]));
                    _local_6 = (_local_5.index + _local_5[0].length);
                } while (true);
                _local_7 = (_local_7 + _local_2.substring(_local_6));
                if (_local_7 == _local_2)
                {
                    break;
                }
                _local_2 = _local_7;
                _local_4++;
            }
            return _local_7;
        }

        private function onLocalizationComplete(k:Event):void
        {
            this.initConfigurationDownload();
        }

        private function initConfigurationDownload():void
        {
            if (this._initialized)
            {
                return;
            }
            var k:String = this.getProperty("external.variables.txt");
            if (assets.hasAsset(k))
            {
            }
            var _local_2:URLRequest = new URLRequest(k);
            var _local_3:AssetLoaderStruct = assets.loadAssetFromFile(k, _local_2, "text/plain");
            _local_3.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this.onInitConfiguration);
            _local_3.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, this.onConfigurationError);
        }

        private function parseConfiguration(k:String):void
        {
            var _local_6:String;
            var _local_7:Array;
            var _local_8:String;
            var _local_9:String;
            var _local_2:RegExp = /\n\r{1,}|\n{1,}|\r{1,}/mg;
            var _local_3:RegExp = /^\s+|\s+$/g;
            var _local_4:Array = k.split(_local_2);
            var _local_5:Boolean;
            for each (_local_6 in _local_4)
            {
                if (((_local_6.substr(0, 1) == "#") || (_local_6 == "")))
                {
                }
                else
                {
                    _local_7 = _local_6.split("=");
                    if ((((_local_7.length >= 2) && (_local_7[0].length > 0)) && (_local_7[1].length > 0)))
                    {
                        _local_8 = _local_7.shift();
                        _local_9 = _local_7.join("=");
                        _local_8 = _local_8.replace(_local_3, "");
                        _local_9 = _local_9.replace(_local_3, "");
                        if (((_local_8 == "configuration.readonly") && (_local_9 == "true")))
                        {
                            _local_5 = true;
                        }
                        this.setProperty(_local_8, _local_9, _local_5);
                    }
                }
            }
        }

        private function fillParams(k:String, _arg_2:Dictionary):String
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:String;
            var _local_7:String;
            var _local_3:int;
            while (_local_3 < 10)
            {
                _local_4 = k.indexOf(_environmentId);
                if (_local_4 < 0)
                {
                    break;
                }
                _local_5 = k.indexOf(_environmentId, (_local_4 + 1));
                if (_local_5 < 0)
                {
                    break;
                }
                _local_6 = k.substring((_local_4 + 1), _local_5);
                _local_7 = _arg_2[_local_6];
                k = k.replace((("%" + _local_6) + "%"), _local_7);
                _local_3++;
            }
            return k;
        }

        private function onConfigurationError(k:Event=null):void
        {
            var _local_2:AssetLoaderEvent = (k as AssetLoaderEvent);
            var _local_3:int;
            if (_local_2 != null)
            {
                _local_3 = _local_2.status;
            }
            Logger.log(_local_2.toString());
            HabboWebTools.logEventLog(("external_variables download error " + _local_3));
            Core.error((((("Could not load external variables. Failed to load URL " + this.getProperty("external.variables.txt")) + "HTTP status ") + _local_3) + ". Client startup failed!"), true, Core.ERROR_CATEGORY_DOWNLOAD_EXTERNAL_VARIABLES);
        }

        private function onInitConfiguration(k:Event=null):void
        {
            var _local_6:int;
            var _local_7:URLRequest;
            var _local_8:AssetLoaderStruct;
            if (disposed)
            {
                return;
            }
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:String = (_local_2.assetLoader.content as String);
            if (_local_3 != null)
            {
                this.parseConfiguration(_local_3);
            }
            var _local_4:IAsset = assets.getAssetByName(_local_2.assetName);
            if (_local_4)
            {
                assets.removeAsset(_local_4).dispose();
            }
            if (((_local_3 == null) || (_local_3.length == 0)))
            {
                _local_6 = ((_local_3 != null) ? _local_3.length : -1);
                Core.error((((("Could not load external variables, got empty data from URL " + this.getProperty("external.variables.txt")) + " data length = ") + _local_6) + ". Client startup failed!"), false, Core.ERROR_CATEGORY_DOWNLOAD_EXTERNAL_VARIABLES);
            }
            var _local_5:String = this.getProperty("external.override.variables.txt");
            if (((_local_5) && (!(_local_5 == ""))))
            {
                Logger.log(("Override External Variables: " + _local_5));
                if (assets.hasAsset(_local_5))
                {
                }
                _local_7 = new URLRequest(_local_5);
                _local_8 = assets.loadAssetFromFile(_local_5, _local_7, "text/plain");
                _local_8.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_23646);
                _local_8.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, this.onInitConfigurationOverride);
            }
            else
            {
                if (!this._initialized)
                {
                    this.configurationsLoaded();
                }
            }
        }

        private function configurationsLoaded():void
        {
            if (disposed)
            {
                return;
            }
            if (this._initialized)
            {
                return;
            }
            this._initialized = true;
            if (locked)
            {
                unlock();
            }
            events.dispatchEvent(new Event(Event.COMPLETE));
        }

        private function onInitConfigurationOverride(k:Event):void
        {
            if (disposed)
            {
                return;
            }
            var _local_2:AssetLoaderEvent = (k as AssetLoaderEvent);
            var _local_3:int;
            if (_local_2 != null)
            {
                _local_3 = _local_2.status;
            }
            this.configurationsLoaded();
        }

        private function _Str_23646(k:Event):void
        {
            if (disposed)
            {
                return;
            }
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:String = (_local_2.assetLoader.content as String);
            if (_local_3 != null)
            {
                this.parseConfiguration(_local_3);
            }
            var _local_4:IAsset = assets.getAssetByName(_local_2.assetName);
            if (_local_4)
            {
                assets.removeAsset(_local_4).dispose();
            }
            this.configurationsLoaded();
        }

        private function setDefaults():void
        {
            var _local_2:Array;
            var _local_3:String;
            ErrorReportStorage.addDebugData("Flashvars/host", ("Host: " + this.getProperty("connection.info.host")));
            ErrorReportStorage.addDebugData("Flashvars/port", ("Port: " + this.getProperty("connection.info.port")));
            this.setProperty("client.fatal.error.url", "${url.prefix}/flash_client_error");
            this.setProperty("game.center.error.url", "${url.prefix}/log/gameerror");
            var k:String = this.getProperty("flashclient.crossdomain.policy.files");
            if (((k) && (!(k == ""))))
            {
                _local_2 = k.split(",");
                for each (_local_3 in _local_2)
                {
                    _local_3 = _local_3.replace(" ", "");
                    Security.loadPolicyFile(_local_3);
                }
            }
        }

        private function parseDevelopmentVariables():void
        {
        }

        private function parseCommonVariables():void
        {
            var k:TextAsset = (assets.getAssetByName("localization_configuration") as TextAsset);
            this.parseConfiguration(k.content.toString());
            k.dispose();
            assets.removeAsset(k);
        }

        private function parseLocalizationVariables():void
        {
            var _local_4:String;
            var _local_5:String;
            var k:Stage = context.displayObjectContainer.stage;
            var _local_2:String = k.loaderInfo.url;
            var _local_3:int = _local_2.lastIndexOf("/");
            _local_2 = _local_2.substring(0, (_local_3 + 1));
            this.setProperty("flash.client.url", _local_2);
            this._useHttps = (_local_2.substr(0, 8) == "https://");
            ErrorReportStorage.addDebugData("Parsing flashvars", "Parsing flasvars");
            for (_local_4 in k.loaderInfo.parameters)
            {
                _local_5 = k.loaderInfo.parameters[_local_4];
                _local_4 = _local_4.replace(/[_]/g, ".");
                this.setProperty(_local_4, _local_5, true);
            }
        }
    }
}
