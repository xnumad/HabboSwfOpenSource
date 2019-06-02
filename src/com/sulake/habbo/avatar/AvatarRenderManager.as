package com.sulake.habbo.avatar
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.avatar.alias.AssetAliasCollection;
    import com.sulake.core.utils.Map;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import flash.events.Event;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.avatar.enum.RenderMode;
    import com.sulake.core.assets.AssetLibraryCollection;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.habbo.avatar.structure.AvatarStructureDownload;
    import com.sulake.habbo.avatar.structure.IFigureSetData;
    import com.sulake.core.assets.IAsset;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
    import com.sulake.habbo.avatar.structure.IStructureData;
    import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
    import com.sulake.habbo.utils.FigureDataContainer;
    import com.sulake.habbo.avatar.animation.IAnimationManager;
    import com.sulake.habbo.avatar.structure.figure.ISetType;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.avatar.structure.figure.IPalette;
    import com.sulake.habbo.avatar.structure.figure.IPartColor;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import __AS3__.vec.*;
    import com.sulake.iid.*;

    public class AvatarRenderManager extends Component implements IAvatarRenderManager 
    {
        private const _Str_1161:String = "hd-99999-99999";

        private var _aliasCollection:AssetAliasCollection;
        private var _structure:AvatarStructure;
        private var _mode:String;
        private var _petImageListeners:Map;
        private var _avatarAssetDownloadManager:AvatarAssetDownloadManager;
        private var _effectAssetDownloadManager:EffectAssetDownloadManager;
        private var _avatarPlaceholderFigure:AvatarFigureContainer;
        private var _figureMapReady:Boolean = false;
        private var _structureReady:Boolean = false;
        private var _isReady:Boolean = false;
        private var _inNuxFlow:Boolean;
        private var _actionsAreReady:Boolean;
        private var _effectMapReady:Boolean;

        public function AvatarRenderManager(k:IContext, _arg_2:uint, _arg_3:IAssetLibrary, _arg_4:Boolean=false)
        {
            this._inNuxFlow = _arg_4;
            _arg_2 = (_arg_2 | COMPONENT_FLAG_INTERFACE);
            super(k, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return ((this._inNuxFlow) ? super.dependencies : (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboConfigurationManager(), null, true, [{
"type":Event.COMPLETE,
"callback":this.onConfigurationComplete
}])])));
        }

        override protected function initComponent():void
        {
            this._mode = RenderMode.COMPONENT;
            this._petImageListeners = new Map();
            var k:XML = <actions><action id="Default" precedence="1000" state="std" main="1" isdefault="1" geometrytype="vertical" activepartset="figure" assetpartdefinition="std"/></actions>
            ;
            this._structure = new AvatarStructure(this);
            this._structure.initGeometry(((assets.hasAsset("HabboAvatarGeometry")) ? (assets.getAssetByName("HabboAvatarGeometry").content as XML) : null));
            this._structure.initPartSets(((assets.hasAsset("HabboAvatarPartSets")) ? (assets.getAssetByName("HabboAvatarPartSets").content as XML) : null));
            this._structure.initActions(assets, k);
            this._structure.initAnimation(((assets.hasAsset("HabboAvatarAnimation")) ? (assets.getAssetByName("HabboAvatarAnimation").content as XML) : null));
            this._structure.initFigureData(((assets.hasAsset("HabboAvatarFigure")) ? (assets.getAssetByName("HabboAvatarFigure").content as XML) : null));
            this._Str_1200();
            this._aliasCollection = new AssetAliasCollection(this, (context.assets as AssetLibraryCollection));
            this._aliasCollection.init();
            this.createStructure();
        }

        private function _Str_1200():void
        {
            var k:* = (getProperty("flash.dynamic.avatar.download.url") + "HabboAvatarActions.xml");
            var _local_2:URLRequest = new URLRequest(k);
            var _local_3:AssetLoaderStruct = assets.loadAssetFromFile("HabboAvatarActions", _local_2, "text/xml");
            _local_3.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this.onAvatarAssetsLibraryReady);
        }

        private function onAvatarAssetsLibraryReady(k:Event=null):void
        {
            if (this._structure == null)
            {
                return;
            }
            var _local_2:XML = <actions><action id="Default" precedence="1000" state="std" main="1" isdefault="1" geometrytype="vertical" activepartset="figure" assetpartdefinition="std"/></actions>
            ;
            this._structure._Str_1620(((assets.hasAsset("HabboAvatarActions")) ? (assets.getAssetByName("HabboAvatarActions").content as XML) : _local_2));
            this._actionsAreReady = true;
            this.createStructure();
        }

        override public function dispose():void
        {
            super.dispose();
            if (this._structure != null)
            {
                this._structure.dispose();
                this._structure = null;
            }
            if (this._aliasCollection != null)
            {
                this._aliasCollection.dispose();
                this._aliasCollection = null;
            }
            if (this._petImageListeners)
            {
                this._petImageListeners.dispose();
                this._petImageListeners = null;
            }
            if (this._avatarAssetDownloadManager)
            {
                this._avatarAssetDownloadManager.removeEventListener(Event.COMPLETE, this._Str_1656);
                this._avatarAssetDownloadManager.dispose();
                this._avatarAssetDownloadManager = null;
            }
            if (this._effectAssetDownloadManager)
            {
                this._effectAssetDownloadManager.removeEventListener(Event.COMPLETE, this._Str_1656);
                this._effectAssetDownloadManager.dispose();
                this._effectAssetDownloadManager = null;
            }
        }

        private function onConfigurationComplete(k:Event):void
        {
            var _local_2:String;
            var _local_3:AvatarStructureDownload;
            var _local_4:String;
            var _local_5:String;
            var _local_6:String;
            var _local_7:String;
            if (this._structure != null)
            {
                _local_2 = getProperty("external.figurepartlist.txt");
                if (assets.hasAsset(_local_2))
                {
                    assets.removeAsset(assets.getAssetByName(_local_2));
                }
                _local_3 = new AvatarStructureDownload(assets, _local_2, (this._structure.figureData as IFigureSetData));
                _local_3.addEventListener(AvatarStructureDownload.AVATAR_STRUCTURE_DONE, this._Str_1521);
                if (this._avatarAssetDownloadManager == null)
                {
                    _local_4 = getProperty("flash.dynamic.avatar.download.configuration");
                    _local_5 = getProperty("flash.dynamic.avatar.download.url");
                    _local_6 = getProperty("flash.dynamic.avatar.download.name.template");
                    this._avatarAssetDownloadManager = new AvatarAssetDownloadManager(context.assets, _local_4, _local_5, this._structure, _local_6);
                    this._avatarAssetDownloadManager.addEventListener(Event.COMPLETE, this._Str_1656);
                    this._avatarAssetDownloadManager.addEventListener(AvatarAssetDownloadManager.LIBRARY_LOADED, this._Str_1154);
                }
                if (this._effectAssetDownloadManager == null)
                {
                    _local_7 = (getProperty("flash.dynamic.avatar.download.url") + "effectmap.xml");
                    _local_5 = getProperty("flash.dynamic.avatar.download.url");
                    _local_6 = getProperty("flash.dynamic.avatar.download.name.template");
                    this._effectAssetDownloadManager = new EffectAssetDownloadManager(context.assets, _local_7, _local_5, this._structure, _local_6);
                    this._effectAssetDownloadManager.addEventListener(Event.COMPLETE, this._Str_1528);
                    this._effectAssetDownloadManager.addEventListener(AvatarAssetDownloadManager.LIBRARY_LOADED, this._Str_1613);
                }
            }
        }

        private function _Str_1154(k:Event=null):void
        {
            this._aliasCollection.reset();
        }

        private function _Str_1613(k:Event=null):void
        {
            this._aliasCollection.reset();
        }

        private function _Str_1521(k:Event=null):void
        {
            var _local_2:IAsset = assets.getAssetByName(getProperty("external.figurepartlist.txt"));
            if (_local_2)
            {
                assets.removeAsset(_local_2).dispose();
            }
            this._structureReady = true;
            this._structure.init();
            this.createStructure();
        }

        private function _Str_1656(k:Event=null):void
        {
            this._figureMapReady = true;
            this.createStructure();
        }

        private function _Str_1528(k:Event=null):void
        {
            this._effectMapReady = true;
            this.createStructure();
        }

        public function get _Str_906():Dictionary
        {
            if (this._effectMapReady)
            {
                return this._effectAssetDownloadManager._Str_1452;
            }
            return null;
        }

        private function createStructure():void
        {
            if (!this._isReady)
            {
                if (((((this._figureMapReady) && (this._structureReady)) && (this._actionsAreReady)) && (this._effectMapReady)))
                {
                    this._isReady = true;
                    this.events.dispatchEvent(new Event(AvatarRenderEvent.AVATAR_RENDER_READY));
                }
            }
        }

        public function _Str_718(k:String):IAvatarFigureContainer
        {
            return new AvatarFigureContainer(k);
        }

        public function _Str_961(k:IAvatarFigureContainer):Boolean
        {
            if (!this._avatarAssetDownloadManager)
            {
                return false;
            }
            return this._avatarAssetDownloadManager.isReady(k);
        }

        public function _Str_889(k:IAvatarFigureContainer, _arg_2:IAvatarImageListener):void
        {
            if (!this._avatarAssetDownloadManager)
            {
                return;
            }
            this._avatarAssetDownloadManager._Str_1320(k, _arg_2);
        }

        public function createAvatarImage(figure:String, _arg_2:String, gender:String=null, _arg_4:IAvatarImageListener=null, _arg_5:_Str_936=null):IAvatarImage
        {
            if (this._structure == null)
            {
                return null;
            }
            if (((!(this._avatarAssetDownloadManager)) && (!(this._mode == RenderMode.LOCAL_ONLY))))
            {
                return null;
            }
            var figureContainer:AvatarFigureContainer = new AvatarFigureContainer(figure);
            if (gender)
            {
                this.validateAvatarFigure(figureContainer, gender);
            }
            if (((this._mode == RenderMode.LOCAL_ONLY) || (this._avatarAssetDownloadManager.isReady(figureContainer))))
            {
                return new AvatarImage(this._structure, this._aliasCollection, figureContainer, _arg_2, this._effectAssetDownloadManager, _arg_5);
            }
            if (!this._avatarPlaceholderFigure)
            {
                this._avatarPlaceholderFigure = new AvatarFigureContainer(this._Str_1161);
            }
            this._avatarAssetDownloadManager._Str_1320(figureContainer, _arg_4);
            return new PlaceholderAvatarImage(this._structure, this._aliasCollection, this._avatarPlaceholderFigure, _arg_2, this._effectAssetDownloadManager);
        }

        public function _Str_813():IStructureData
        {
            if (this._structure)
            {
                return this._structure.figureData;
            }
            return null;
        }

        public function isValidFigureSetForGender(k:int, _arg_2:String):Boolean
        {
            var _local_3:IStructureData = this._Str_813();
            var _local_4:IFigurePartSet = _local_3._Str_938(k);
            if (_local_4 != null)
            {
                if (((_local_4.gender.toUpperCase() == "U") || (_local_4.gender.toUpperCase() == _arg_2.toUpperCase())))
                {
                    return true;
                }
            }
            return false;
        }

        public function getFigureStringWithFigureIds(k:String, _arg_2:String, _arg_3:Vector.<int>):String
        {
            var _local_6:IFigurePartSet;
            var _local_4:FigureDataContainer = new FigureDataContainer();
            _local_4._Str_2153(k, _arg_2);
            var _local_5:Vector.<IFigurePartSet> = this._Str_1667(_arg_3);
            for each (_local_6 in _local_5)
            {
                _local_4._Str_2088(_local_6.type, _local_6.id, _local_4.getColourIds(_local_6.type));
            }
            return _local_4.getFigureString();
        }

        private function _Str_1667(k:Vector.<int>):Vector.<IFigurePartSet>
        {
            var _local_4:int;
            var _local_5:IFigurePartSet;
            var _local_2:IStructureData = this._Str_813();
            var _local_3:Vector.<IFigurePartSet> = new Vector.<IFigurePartSet>(0);
            for each (_local_4 in k)
            {
                _local_5 = _local_2._Str_938(_local_4);
                if (_local_5 != null)
                {
                    _local_3.push(_local_5);
                }
            }
            return _local_3;
        }

        public function _Str_672():Array
        {
            return this._structure._Str_672();
        }

        public function _Str_723():IAnimationManager
        {
            if (this._structure)
            {
                return this._structure.animationManager;
            }
            return null;
        }

        public function _Str_838(k:String, _arg_2:int):Array
        {
            if (this._structure)
            {
                return this._structure.getMandatorySetTypeIds(k, _arg_2);
            }
            return null;
        }

        public function getAssetByName(k:String):IAsset
        {
            return this._aliasCollection.getAssetByName(k);
        }

        public function get mode():String
        {
            return this._mode;
        }

        public function set mode(k:String):void
        {
            this._mode = k;
        }

        public function _Str_882(k:XML):void
        {
            if (this._structure != null)
            {
                this._structure._Str_882(k);
            }
        }

        private function validateAvatarFigure(k:AvatarFigureContainer, _arg_2:String):Boolean
        {
            var _local_3:Boolean;
            var figureData:IStructureData;
            var _local_7:String;
            var _local_8:IFigurePartSet;
            var setType:ISetType;
            var _local_10:IFigurePartSet;
            var _local_11:IFigurePartSet;
            if (!this._structure)
            {
                ErrorReportStorage.addDebugData("AvatarRenderManager", "validateAvatarFigure: structure is null!");
            }
            var _local_4:int = 2;
            var _local_5:Array = this._structure.getMandatorySetTypeIds(_arg_2, _local_4);
            if (_local_5)
            {
                figureData = this._structure.figureData;
                if (!figureData)
                {
                    ErrorReportStorage.addDebugData("AvatarRenderManager", "validateAvatarFigure: figureData is null!");
                }
                for each (_local_7 in _local_5)
                {
                    if (!k._Str_744(_local_7))
                    {
                        _local_8 = this._structure._Str_2264(_local_7, _arg_2);
                        if (_local_8)
                        {
                            k._Str_830(_local_7, _local_8.id, [0]);
                            _local_3 = true;
                        }
                    }
                    else
                    {
                        setType = figureData._Str_740(_local_7);
                        if (!setType)
                        {
                            ErrorReportStorage.addDebugData("AvatarRenderManager", "validateAvatarFigure: setType is null!");
                        }
                        _local_10 = setType._Str_1020(k.getPartSetId(_local_7));
                        if (!_local_10)
                        {
                            _local_11 = this._structure._Str_2264(_local_7, _arg_2);
                            if (_local_11)
                            {
                                k._Str_830(_local_7, _local_11.id, [0]);
                                _local_3 = true;
                            }
                        }
                    }
                }
            }
            return !(_local_3);
        }

        public function _Str_932(k:IAvatarFigureContainer, _arg_2:String, _arg_3:Array=null):int
        {
            var _local_6:String;
            var _local_7:ISetType;
            var _local_9:String;
            var _local_10:int;
            var _local_11:IFigurePartSet;
            var _local_12:IPalette;
            var _local_13:Array;
            var _local_14:int;
            var _local_15:IPartColor;
            var _local_4:int;
            if (!this._structure)
            {
                return 0;
            }
            var _local_5:IStructureData = this._structure.figureData;
            var _local_8:Array = k._Str_1016();
            for each (_local_6 in _local_8)
            {
                _local_7 = _local_5._Str_740(_local_6);
                _local_10 = k.getPartSetId(_local_6);
                _local_11 = _local_7._Str_1020(_local_10);
                if (_local_11 == null)
                {
                }
                else
                {
                    _local_4 = Math.max(_local_11.clubLevel, _local_4);
                    _local_12 = _local_5.getPalette(_local_7._Str_734);
                    _local_13 = k._Str_815(_local_6);
                    for each (_local_14 in _local_13)
                    {
                        _local_15 = _local_12._Str_751(_local_14);
                        _local_4 = Math.max(_local_15.clubLevel, _local_4);
                    }
                }
            }
            if (_arg_3 == null)
            {
                _arg_3 = this._structure.getBodyPartsUnordered(AvatarSetType.FULL);
            }
            for each (_local_9 in _arg_3)
            {
                _local_7 = _local_5._Str_740(_local_9);
                if (_local_8.indexOf(_local_9) == -1)
                {
                    _local_4 = Math.max(_local_7._Str_1002(_arg_2), _local_4);
                }
            }
            return _local_4;
        }

        public function resetAssetManager():void
        {
            this._aliasCollection.reset();
        }

        public function get isReady():Boolean
        {
            return this._isReady;
        }
    }
}
