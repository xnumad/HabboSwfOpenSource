package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import flash.utils.Dictionary;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.assets.AssetLoaderStruct;
    import flash.utils.Timer;
    import com.sulake.core.assets.XmlAsset;
    import flash.net.URLRequest;
    import com.sulake.core.assets.IAsset;
    import flash.events.TimerEvent;
    import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import flash.events.Event;
    import com.sulake.habbo.avatar.structure.figure.ISetType;
    import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
    import com.sulake.habbo.avatar.structure.figure.FigurePart;
    import com.sulake.habbo.avatar.structure.IStructureData;

    public class AvatarAssetDownloadManager extends EventDispatcherWrapper 
    {
        public static const LIBRARY_LOADED:String = "LIBRARY_LOADED";

        private const _Str_704:int = 100;
        private const _Str_589:int = 2;

        private var _figureMap:Dictionary;
        private var _assets:IAssetLibrary;
        private var _incompleteFigures:Dictionary;
        private var _listeners:Dictionary;
        private var _structure:AvatarStructure;
        private var _assetDownloadUrl:String;
        private var _configurationURL:String;
        private var _isInitReady:Boolean;
        private var _mapDownloadTriesLeft:int = 3;
        private var _mapLoader:AssetLoaderStruct;
        private var _downloadShiftTimer:Timer;
        private var _initDownloadBuffer:Array;
        private var _pendingDownloadQueue:Array;
        private var _currentDownloads:Array;
        private var _assetLibraryNameTemplate:String;

        public function AvatarAssetDownloadManager(k:IAssetLibrary, _arg_2:String, _arg_3:String, _arg_4:AvatarStructure, _arg_5:String)
        {
            var _local_8:XmlAsset;
            var _local_9:XML;
            super();
            this._figureMap = new Dictionary();
            this._assets = k;
            this._structure = _arg_4;
            this._incompleteFigures = new Dictionary();
            this._assetDownloadUrl = _arg_3;
            this._configurationURL = _arg_2;
            this._assetLibraryNameTemplate = _arg_5;
            this._listeners = new Dictionary();
            this._initDownloadBuffer = [];
            this._pendingDownloadQueue = [];
            this._currentDownloads = [];
            var _local_6:URLRequest = new URLRequest(_arg_2);
            var _local_7:IAsset = this._assets.getAssetByName("figuremap");
            if (_local_7 == null)
            {
                this._mapLoader = this._assets.loadAssetFromFile("figuremap", _local_6, "text/xml");
                this._Str_725();
            }
            else
            {
                _local_8 = (this._assets.getAssetByName("figuremap") as XmlAsset);
                _local_9 = (_local_8.content as XML).copy();
                this._Str_1556(_local_9);
            }
            this._downloadShiftTimer = new Timer(this._Str_704, 1);
            this._downloadShiftTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
            this._structure.avatarRenderManager.events.addEventListener(AvatarRenderEvent.AVATAR_RENDER_READY, this._Str_794);
        }

        override public function dispose():void
        {
            super.dispose();
            this._figureMap = null;
            this._assets = null;
            this._incompleteFigures = null;
            this._listeners = null;
            if (this._structure.avatarRenderManager)
            {
                this._structure.avatarRenderManager.events.addEventListener(AvatarRenderEvent.AVATAR_RENDER_READY, this._Str_794);
            }
            this._structure = null;
            this._pendingDownloadQueue = null;
            this._initDownloadBuffer = null;
            if (this._downloadShiftTimer)
            {
                this._downloadShiftTimer.stop();
                this._downloadShiftTimer = null;
            }
            if (this._mapLoader)
            {
                this._Str_835();
                this._mapLoader = null;
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
                HabboWebTools.logEventLog(("Figuremap download error " + this._configurationURL));
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
                this._mapLoader = this._assets.loadAssetFromFile("figuremap", _local_3, "text/xml");
                this._Str_725();
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
            this._Str_1556(data);
        }

        private function _Str_1556(k:XML):void
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
            this._isInitReady = true;
            dispatchEvent(new Event(Event.COMPLETE));
        }

        private function _Str_794(k:Event):void
        {
            var _local_2:Array;
            for each (_local_2 in this._initDownloadBuffer)
            {
                this._Str_1320(_local_2[0], _local_2[1]);
            }
            this._initDownloadBuffer = [];
        }

        private function _Str_709(k:XML):void
        {
            var _local_2:XML;
            var _local_3:AvatarAssetDownloadLibrary;
            var _local_4:XML;
            var _local_5:String;
            var _local_6:Array;
            for each (_local_2 in k.lib)
            {
                _local_3 = new AvatarAssetDownloadLibrary(_local_2.@id, _local_2.@revision, this._assetDownloadUrl, this._assets, this._assetLibraryNameTemplate);
                _local_3.addEventListener(Event.COMPLETE, this._Str_807);
                for each (_local_4 in _local_2.part)
                {
                    _local_5 = ((_local_4.@type + ":") + _local_4.@id);
                    _local_6 = this._figureMap[_local_5];
                    if (_local_6 == null)
                    {
                        _local_6 = [];
                    }
                    _local_6.push(_local_3);
                    this._figureMap[_local_5] = _local_6;
                }
            }
        }

        public function isReady(k:IAvatarFigureContainer):Boolean
        {
            if (((!(this._isInitReady)) || (!(this._structure.avatarRenderManager.isReady))))
            {
                return false;
            }
            var _local_2:Array = this._Str_708(k);
            return _local_2.length == 0;
        }

        public function _Str_1320(k:IAvatarFigureContainer, _arg_2:IAvatarImageListener):void
        {
            var _local_5:AvatarAssetDownloadLibrary;
            var _local_6:Array;
            if (((!(this._isInitReady)) || (!(this._structure.avatarRenderManager.isReady))))
            {
                this._initDownloadBuffer.push([k, _arg_2]);
                return;
            }
            var _local_3:String = k.getFigureString();
            var _local_4:Array = this._Str_708(k);
            if (_local_4.length > 0)
            {
                if (((_arg_2) && (!(_arg_2.disposed))))
                {
                    _local_6 = this._listeners[_local_3];
                    if (_local_6 == null)
                    {
                        _local_6 = [];
                    }
                    _local_6.push(_arg_2);
                    this._listeners[_local_3] = _local_6;
                }
                this._incompleteFigures[_local_3] = _local_4;
                for each (_local_5 in _local_4)
                {
                    this._Str_682(_local_5);
                }
            }
            else
            {
                if (((!(_arg_2 == null)) && (!(_arg_2.disposed))))
                {
                    _arg_2._Str_840(_local_3);
                }
            }
        }

        private function _Str_807(k:Event):void
        {
            var _local_3:String;
            var _local_4:Array;
            var _local_5:AvatarAssetDownloadLibrary;
            var _local_6:int;
            var _local_7:Boolean;
            var _local_8:AvatarAssetDownloadLibrary;
            var _local_9:Array;
            var _local_10:IAvatarImageListener;
            if (disposed)
            {
                return;
            }
            var _local_2:Array = [];
            for (_local_3 in this._incompleteFigures)
            {
                _local_7 = true;
                _local_4 = this._incompleteFigures[_local_3];
                for each (_local_8 in _local_4)
                {
                    if (!_local_8.isReady)
                    {
                        _local_7 = false;
                        break;
                    }
                }
                if (_local_7)
                {
                    _local_2.push(_local_3);
                    _local_9 = this._listeners[_local_3];
                    for each (_local_10 in _local_9)
                    {
                        if (((!(_local_10 == null)) && (!(_local_10.disposed))))
                        {
                            _local_10._Str_840(_local_3);
                        }
                    }
                    delete this._listeners[_local_3];
                    dispatchEvent(new Event(LIBRARY_LOADED));
                }
            }
            for each (_local_3 in _local_2)
            {
                delete this._incompleteFigures[_local_3];
            }
            while (_local_6 < this._currentDownloads.length)
            {
                _local_5 = this._currentDownloads[_local_6];
                if (_local_5.libraryName == (k.target as AvatarAssetDownloadLibrary).libraryName)
                {
                    this._currentDownloads.splice(_local_6, 1);
                }
                _local_6++;
            }
            this._downloadShiftTimer.start();
        }

        private function _Str_708(k:IAvatarFigureContainer):Array
        {
            var _local_5:String;
            var _local_6:ISetType;
            var _local_7:int;
            var _local_8:IFigurePartSet;
            var _local_9:FigurePart;
            var _local_10:String;
            var _local_11:Array;
            var _local_12:AvatarAssetDownloadLibrary;
            var _local_2:Array = [];
            if (!this._structure)
            {
                return _local_2;
            }
            if (!k)
            {
                return _local_2;
            }
            var _local_3:IStructureData = this._structure.figureData;
            if (!_local_3)
            {
                return _local_2;
            }
            var _local_4:Array = k._Str_1016();
            for each (_local_5 in _local_4)
            {
                _local_6 = _local_3._Str_740(_local_5);
                if (_local_6)
                {
                    _local_7 = k.getPartSetId(_local_5);
                    _local_8 = _local_6._Str_1020(_local_7);
                    if (_local_8)
                    {
                        for each (_local_9 in _local_8.parts)
                        {
                            _local_10 = ((_local_9.type + ":") + _local_9.id);
                            _local_11 = this._figureMap[_local_10];
                            if (_local_11 != null)
                            {
                                for each (_local_12 in _local_11)
                                {
                                    if (_local_12 != null)
                                    {
                                        if (!_local_12.isReady)
                                        {
                                            if (_local_2.indexOf(_local_12) == -1)
                                            {
                                                _local_2.push(_local_12);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return _local_2;
        }

        private function _Str_866():void
        {
            var k:AvatarAssetDownloadLibrary;
            while (((this._pendingDownloadQueue.length > 0) && (this._currentDownloads.length < this._Str_589)))
            {
                k = this._pendingDownloadQueue[0];
                k.startDownloading();
                this._currentDownloads.push(this._pendingDownloadQueue.shift());
            }
        }

        private function _Str_682(k:AvatarAssetDownloadLibrary):void
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
    }
}



