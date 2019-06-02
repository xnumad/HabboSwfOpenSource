package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.utils.Timer;
    import com.sulake.core.assets.XmlAsset;
    import flash.net.URLRequest;
    import com.sulake.core.assets.IAsset;
    import flash.events.TimerEvent;
    import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.events.Event;
    import com.sulake.habbo.utils.HabboWebTools;

    public class EffectAssetDownloadManager extends EventDispatcherWrapper 
    {
        public static const LIBRARY_LOADED:String = "LIBRARY_LOADED";

        private const _Str_704:int = 100;
        private const _Str_589:int = 2;

        private var _missingMandatoryLibs:Array;
        private var _map:Dictionary;
        private var _mapDownloadTriesLeft:int = 3;
        private var _mapLoader:AssetLoaderStruct;
        private var _assets:IAssetLibrary;
        private var _isInitReady:Boolean;
        private var _configurationURL:String;
        private var _assetDownloadUrl:String;
        private var _assetLibraryNameTemplate:String;
        private var _structure:AvatarStructure;
        private var _listeners:Dictionary;
        private var _incompleteEffects:Dictionary;
        private var _downloadShiftTimer:Timer;
        private var _initDownloadBuffer:Array;
        private var _pendingDownloadQueue:Array;
        private var _currentDownloads:Array;

        public function EffectAssetDownloadManager(k:IAssetLibrary, _arg_2:String, _arg_3:String, _arg_4:AvatarStructure, _arg_5:String)
        {
            var _local_8:XmlAsset;
            var _local_9:XML;
            this._missingMandatoryLibs = ["dance.1", "dance.2", "dance.3", "dance.4"];
            super();
            this._map = new Dictionary();
            this._assets = k;
            this._structure = _arg_4;
            this._configurationURL = _arg_2;
            this._assetDownloadUrl = _arg_3;
            this._assetLibraryNameTemplate = _arg_5;
            this._listeners = new Dictionary();
            this._incompleteEffects = new Dictionary();
            this._initDownloadBuffer = [];
            this._pendingDownloadQueue = [];
            this._currentDownloads = [];
            var _local_6:URLRequest = new URLRequest(this._configurationURL);
            var _local_7:IAsset = this._assets.getAssetByName("effectmap");
            if (_local_7 == null)
            {
                this._mapLoader = this._assets.loadAssetFromFile("effectmap", _local_6, "text/xml");
                this._Str_725();
            }
            else
            {
                _local_8 = (this._assets.getAssetByName("effectmap") as XmlAsset);
                _local_9 = (_local_8.content as XML).copy();
                this._Str_2252(_local_9);
            }
            this._downloadShiftTimer = new Timer(this._Str_704, 1);
            this._downloadShiftTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
            this._structure.avatarRenderManager.events.addEventListener(AvatarRenderEvent.AVATAR_RENDER_READY, this._Str_794);
        }

        public function _Str_1651():void
        {
            var _local_2:String;
            var _local_3:Array;
            var _local_4:EffectAssetDownloadLibrary;
            var k:Array = this._missingMandatoryLibs.slice();
            for each (_local_2 in k)
            {
                _local_3 = this._map[_local_2];
                if (_local_3 != null)
                {
                    for each (_local_4 in _local_3)
                    {
                        this._Str_682(_local_4);
                    }
                }
            }
        }

        private function _Str_725():void
        {
            if (this._mapLoader)
            {
                this._mapLoader.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this.onConfigurationComplete);
                this._mapLoader.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, this.onConfigurationError);
            }
        }

        private function _Str_835():void
        {
            if (this._mapLoader)
            {
                this._mapLoader.removeEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this.onConfigurationComplete);
                this._mapLoader.removeEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, this.onConfigurationError);
            }
        }

        private function onConfigurationComplete(event:Event):void
        {
            var data:XML;
            if (disposed)
            {
                return;
            }
            var loaderStruct:AssetLoaderStruct = (event.target as AssetLoaderStruct);
            if (loaderStruct == null)
            {
                return;
            }
            try
            {
                data = new XML((loaderStruct.assetLoader.content as String));
            }
            catch(e:Error)
            {
                return;
            }
            this._Str_2252(data);
        }

        private function onConfigurationError(k:Event):void
        {
            var _local_2:String;
            var _local_3:URLRequest;
            if (disposed)
            {
                return;
            }
            this._mapDownloadTriesLeft--;
            if (this._mapDownloadTriesLeft <= 0)
            {
                HabboWebTools.logEventLog(("Effect download error " + this._configurationURL));
            }
            else
            {
                if (this._configurationURL.indexOf("?") > 0)
                {
                    _local_2 = ((this._configurationURL + "&retry=") + this._mapDownloadTriesLeft);
                }
                else
                {
                    _local_2 = ((this._configurationURL + "?retry=") + this._mapDownloadTriesLeft);
                }
                this._Str_835();
                _local_3 = new URLRequest(_local_2);
                this._mapLoader = this._assets.loadAssetFromFile("effectmap", _local_3, "text/xml");
                this._Str_725();
            }
        }

        private function _Str_2252(k:XML):void
        {
            if (k == null)
            {
                return;
            }
            if (k.toString() == "")
            {
                return;
            }
            this._Str_709(k);
            this._Str_1651();
            this._isInitReady = true;
            dispatchEvent(new Event(Event.COMPLETE));
        }

        private function _Str_709(k:XML):void
        {
            var _local_2:XML;
            var _local_3:EffectAssetDownloadLibrary;
            var _local_4:String;
            var _local_5:Array;
            for each (_local_2 in k.effect)
            {
                _local_3 = new EffectAssetDownloadLibrary(_local_2.@lib, "0", this._assetDownloadUrl, this._assets, this._assetLibraryNameTemplate);
                _local_3.addEventListener(Event.COMPLETE, this._Str_807);
                _local_4 = _local_2.@id;
                _local_5 = this._map[_local_4];
                if (_local_5 == null)
                {
                    _local_5 = [];
                }
                _local_5.push(_local_3);
                this._map[_local_4] = _local_5;
            }
        }

        private function _Str_807(k:Event):void
        {
            var _local_3:String;
            var _local_4:Array;
            var _local_6:EffectAssetDownloadLibrary;
            var _local_7:int;
            var _local_8:Boolean;
            var _local_9:EffectAssetDownloadLibrary;
            var _local_10:Array;
            var _local_11:_Str_936;
            if (disposed)
            {
                return;
            }
            Logger.log("Effect download complete...");
            var _local_2:Array = [];
            var _local_5:EffectAssetDownloadLibrary = (k.target as EffectAssetDownloadLibrary);
            this._structure.registerAnimation(_local_5.animation);
            for (_local_3 in this._incompleteEffects)
            {
                _local_8 = true;
                _local_4 = this._incompleteEffects[_local_3];
                for each (_local_9 in _local_4)
                {
                    if (!_local_9.isReady)
                    {
                        _local_8 = false;
                        break;
                    }
                }
                if (_local_8)
                {
                    _local_2.push(_local_3);
                    _local_10 = this._listeners[_local_3];
                    for each (_local_11 in _local_10)
                    {
                        if (((!(_local_11 == null)) && (!(_local_11.disposed))))
                        {
                            _local_11.updateAnimationByFrames(parseInt(_local_3));
                        }
                    }
                    delete this._listeners[_local_3];
                    dispatchEvent(new Event(LIBRARY_LOADED));
                }
            }
            for each (_local_3 in _local_2)
            {
                delete this._incompleteEffects[_local_3];
            }
            while (_local_7 < this._currentDownloads.length)
            {
                _local_6 = this._currentDownloads[_local_7];
                if (_local_6.name == _local_5.name)
                {
                    this._currentDownloads.splice(_local_7, 1);
                }
                _local_7++;
            }
            this._downloadShiftTimer.start();
        }

        public function isReady(k:int):Boolean
        {
            if (((!(this._isInitReady)) || (!(this._structure.avatarRenderManager.isReady))))
            {
                return false;
            }
            var _local_2:Array = this._Str_708(k);
            return _local_2.length == 0;
        }

        public function _Str_1914(k:int, _arg_2:_Str_936):void
        {
            var _local_4:EffectAssetDownloadLibrary;
            var _local_5:Array;
            if (((!(this._isInitReady)) || (!(this._structure.avatarRenderManager.isReady))))
            {
                this._initDownloadBuffer.push([k, _arg_2]);
                return;
            }
            var _local_3:Array = this._Str_708(k);
            if (_local_3.length > 0)
            {
                if (((_arg_2) && (!(_arg_2.disposed))))
                {
                    _local_5 = this._listeners[String(k)];
                    if (_local_5 == null)
                    {
                        _local_5 = [];
                    }
                    _local_5.push(_arg_2);
                    this._listeners[String(k)] = _local_5;
                }
                this._incompleteEffects[String(k)] = _local_3;
                for each (_local_4 in _local_3)
                {
                    this._Str_682(_local_4);
                }
            }
            else
            {
                if (((!(_arg_2 == null)) && (!(_arg_2.disposed))))
                {
                    _arg_2.updateAnimationByFrames(k);
                    Logger.log(("Effect ready to use: " + k));
                }
            }
        }

        private function _Str_708(k:int):Array
        {
            var _local_4:EffectAssetDownloadLibrary;
            var _local_2:Array = [];
            if (!this._structure)
            {
                return _local_2;
            }
            var _local_3:Array = this._map[String(k)];
            if (_local_3 != null)
            {
                for each (_local_4 in _local_3)
                {
                    if (_local_4 != null)
                    {
                        if (!_local_4.isReady)
                        {
                            if (_local_2.indexOf(_local_4) == -1)
                            {
                                _local_2.push(_local_4);
                            }
                        }
                    }
                }
            }
            return _local_2;
        }

        private function _Str_866():void
        {
            var k:EffectAssetDownloadLibrary;
            while (((this._pendingDownloadQueue.length > 0) && (this._currentDownloads.length < this._Str_589)))
            {
                k = this._pendingDownloadQueue[0];
                k.startDownloading();
                this._currentDownloads.push(this._pendingDownloadQueue.shift());
            }
        }

        private function _Str_682(k:EffectAssetDownloadLibrary):void
        {
            if ((((!(k.isReady)) && (this._pendingDownloadQueue.indexOf(k) == -1)) && (this._currentDownloads.indexOf(k) == -1)))
            {
                this._pendingDownloadQueue.push(k);
                this._Str_866();
            }
        }

        private function onTimerComplete(k:Event=null):void
        {
            this._Str_866();
        }

        private function _Str_794(k:Event):void
        {
            var _local_2:Array;
            for each (_local_2 in this._initDownloadBuffer)
            {
                this._Str_1914(_local_2[0], _local_2[1]);
            }
            this._initDownloadBuffer = [];
        }

        public function get _Str_1452():Dictionary
        {
            return this._map;
        }
    }
}

