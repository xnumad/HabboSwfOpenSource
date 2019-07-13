package com.sulake.habbo.room
{
    import com.sulake.room.IRoomContentLoader;
    import com.sulake.habbo.session.furniture.IFurniDataListener;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.Map;
    import com.sulake.room.object.IRoomObjectVisualizationFactory;
    import flash.events.IEventDispatcher;
    import flash.utils.Dictionary;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.core.assets.AssetLibrary;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.habbo.utils.StringUtil;
    import flash.events.Event;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.room.object.RoomObjectUserTypes;
    import com.sulake.habbo.room.object.RoomObjectVisualizationType;
    import com.sulake.core.assets.AssetLibraryCollection;
    import com.sulake.room.events.RoomContentLoadedEvent;
    import com.sulake.core.assets.AssetLoaderStruct;
    import flash.net.URLRequest;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.utils.LibraryLoader;
    import com.sulake.core.utils.LibraryLoaderEvent;
    import com.sulake.core.Core;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.utils.getTimer;

    public class RoomContentLoader implements IRoomContentLoader, IFurniDataListener, IDisposable 
    {
        public static const RCL_LOADER_READY:String = "RCL_LOADER_READY";
        private static const RCL_PREFIX:String = "RoomContentLoader ";
        private static const CONST_ZERO:int = 0;
        private static const CONST_ONE:int = 1;
        private static const CONST_TWO:int = 2;
        private static const PLACE_HOLDER:String = "place_holder";
        private static const WALL_PLACE_HOLDER:String = "wall_place_holder";
        private static const PET_PLACE_HOLDER:String = "pet_place_holder";
        private static const DEFAULT_PLACE_HOLDER:String = PLACE_HOLDER;//"place_holder"
        private static const ROOM:String = "room";
        private static const TILE_CURSOR:String = "tile_cursor";
        private static const SELECTION_ARROW:String = "selection_arrow";
        private static const PLACE_HOLDER_TYPES_GPU:Array = [PLACE_HOLDER, WALL_PLACE_HOLDER, PET_PLACE_HOLDER, ROOM, TILE_CURSOR, SELECTION_ARROW];
        private static const _Str_20672:Array = [PLACE_HOLDER, WALL_PLACE_HOLDER, PET_PLACE_HOLDER, ROOM, SELECTION_ARROW];
        private static const CONST_20000:int = 20000;
        private static const CONST_30000:int = 30000;

        private var _baseUrl:String;
        private var _libraries:Map = null;
        private var _events:Map = null;
        private var _additionalObjectTypeLibraries:Map = null;
        private var _assetCollections:Map = null;
        private var _visualizationFactory:IRoomObjectVisualizationFactory = null;
        private var _state:int = 0;
        private var _stateEvents:IEventDispatcher = null;
        private var _isDisposed:Boolean = false;
        private var _dataInitialized:Boolean = false;
        private var _activeObjectTypes:Map = null;
        private var _activeObjects:Dictionary;
        private var _activeObjectTypeIds:Map = null;
        private var _wallItemTypes:Map = null;
        private var _wallItems:Dictionary;
        private var _wallItemTypeIds:Map = null;
        private var _petTypes:Map = null;
        private var _pets:Dictionary;
        private var _petColors:Map = null;
        private var _petLayers:Map = null;
        private var _furniRevisions:Map = null;
        private var _objectAliases:Map = null;
        private var _objectOriginalNames:Map = null;
        private var _objectTypeAdURLs:Map = null;
        private var _furniLoadUrlBase:String;
        private var _furniLoadNameTemplate:String;
        private var _iconLoadNameTemplate:String;
        private var _assetUrlBase:String;
        private var _petLoadNameTemplate:String;
        private var _waitingForSessionDataManager:Boolean = false;
        private var _lastAssetCompressionTime:uint;
        private var _sessionDataManager:ISessionDataManager;
        private var _iconAssets:IAssetLibrary;
        private var _iconListener:IRoomContentListener;
        private var _configuration:IHabboConfigurationManager;
        private var _ignoredFurniTypes:Array;

        public function RoomContentLoader(k:String)
        {
            this._activeObjects = new Dictionary();
            this._wallItems = new Dictionary();
            this._pets = new Dictionary();
            super();
            this._baseUrl = k;
            this._libraries = new Map();
            this._events = new Map();
            this._activeObjectTypes = new Map();
            this._activeObjectTypeIds = new Map();
            this._wallItemTypes = new Map();
            this._wallItemTypeIds = new Map();
            this._petTypes = new Map();
            this._objectTypeAdURLs = new Map();
            this._furniRevisions = new Map();
            this._objectAliases = new Map();
            this._objectOriginalNames = new Map();
            this._assetCollections = new Map();
            this._additionalObjectTypeLibraries = new Map();
        }

        public function set sessionDataManager(k:ISessionDataManager):void
        {
            this._sessionDataManager = k;
            if (this._waitingForSessionDataManager)
            {
                this._waitingForSessionDataManager = false;
                this.initFurnitureData();
            }
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function set visualizationFactory(k:IRoomObjectVisualizationFactory):void
        {
            this._visualizationFactory = k;
        }

        public function initialize(k:IEventDispatcher, _arg_2:IHabboConfigurationManager):void
        {
            this._stateEvents = k;
            this._furniLoadUrlBase = _arg_2.getProperty("flash.dynamic.download.url");
            this._furniLoadNameTemplate = _arg_2.getProperty("flash.dynamic.download.name.template");
            this._iconLoadNameTemplate = _arg_2.getProperty("flash.dynamic.icon.download.name.template");
            this._assetUrlBase = _arg_2.getProperty("pet.dynamic.download.url");
            this._petLoadNameTemplate = _arg_2.getProperty("pet.dynamic.download.name.template");
            this._configuration = _arg_2;
            this._state = CONST_ONE;
            this.initFurnitureData();
            this._Str_24006(_arg_2);
        }

        private function _Str_24006(k:IHabboConfigurationManager):void
        {
            var _local_4:String;
            var _local_2:Array = k.getProperty("pet.configuration").split(",");
            var _local_3:int;
            for each (_local_4 in _local_2)
            {
                this._pets[_local_4] = _local_3;
                this._petTypes.add(_local_3, _local_4);
                _local_3++;
            }
            this._petColors = new Map();
            this._petLayers = new Map();
        }

        private function initFurnitureData():void
        {
            if (this._sessionDataManager == null)
            {
                this._waitingForSessionDataManager = true;
                return;
            }
            var k:Vector.<IFurnitureData> = this._sessionDataManager.getFurniData(this);
            if (k == null)
            {
                return;
            }
            this._sessionDataManager.removeFurniDataListener(this);
            this.populateFurniData(k);
            this._dataInitialized = true;
            this._Str_23030();
            this.continueInitilization();
        }

        public function dispose():void
        {
            var k:String;
            var _local_2:int;
            var _local_3:int;
            var _local_4:AssetLibrary;
            var _local_5:IGraphicAssetCollection;
            if (this._libraries != null)
            {
                _local_2 = this._libraries.length;
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _local_4 = (this._libraries.getWithIndex(_local_3) as AssetLibrary);
                    if (_local_4 != null)
                    {
                        _local_4.dispose();
                    }
                    _local_3++;
                }
                this._libraries.dispose();
                this._libraries = null;
            }
            if (this._events != null)
            {
                this._events.dispose();
                this._events = null;
            }
            if (this._activeObjectTypes != null)
            {
                this._activeObjectTypes.dispose();
                this._activeObjectTypes = null;
            }
            if (this._activeObjectTypeIds)
            {
                this._activeObjectTypeIds.dispose();
                this._activeObjectTypeIds = null;
            }
            if (this._wallItemTypes != null)
            {
                this._wallItemTypes.dispose();
                this._wallItemTypes = null;
            }
            if (this._wallItemTypeIds)
            {
                this._wallItemTypeIds.dispose();
                this._wallItemTypeIds = null;
            }
            if (this._petTypes != null)
            {
                this._petTypes.dispose();
                this._petTypes = null;
            }
            if (this._petColors != null)
            {
                this._petColors.dispose();
                this._petColors = null;
            }
            if (this._petLayers != null)
            {
                this._petLayers.dispose();
                this._petLayers = null;
            }
            if (this._furniRevisions != null)
            {
                this._furniRevisions.dispose();
                this._furniRevisions = null;
            }
            if (this._objectAliases != null)
            {
                this._objectAliases.dispose();
                this._objectAliases = null;
            }
            if (this._objectOriginalNames != null)
            {
                this._objectOriginalNames.dispose();
                this._objectOriginalNames = null;
            }
            if (this._objectTypeAdURLs != null)
            {
                this._objectTypeAdURLs.dispose();
                this._objectTypeAdURLs = null;
            }
            if (this._assetCollections != null)
            {
                _local_2 = this._assetCollections.length;
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _local_5 = (this._assetCollections.getWithIndex(_local_3) as IGraphicAssetCollection);
                    if (_local_5 != null)
                    {
                        _local_5.dispose();
                    }
                    _local_3++;
                }
                this._assetCollections.dispose();
                this._assetCollections = null;
            }
            if (this._additionalObjectTypeLibraries != null)
            {
                this._additionalObjectTypeLibraries.dispose();
                this._additionalObjectTypeLibraries = null;
            }
            if (this._activeObjects != null)
            {
                for (k in this._activeObjects)
                {
                    delete this._activeObjects[k];
                }
                this._activeObjects = null;
            }
            if (this._wallItems != null)
            {
                for (k in this._wallItems)
                {
                    delete this._wallItems[k];
                }
                this._wallItems = null;
            }
            if (this._pets != null)
            {
                for (k in this._pets)
                {
                    delete this._pets[k];
                }
                this._pets = null;
            }
            this._stateEvents = null;
            this._sessionDataManager = null;
            this._configuration = null;
            this._isDisposed = true;
        }

        private function _Str_23030():void
        {
            var k:String = this._configuration.getProperty("gpu.ignored_furni");
            if (!k)
            {
                return;
            }
            this._ignoredFurniTypes = k.split(",");
            var _local_2:int = this._ignoredFurniTypes.length;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._ignoredFurniTypes[_local_3] = StringUtil.trim(this._ignoredFurniTypes[_local_3]);
                _local_3++;
            }
        }

        private function _Str_23570(k:String):Boolean
        {
            return (this._ignoredFurniTypes) ? (!(this._ignoredFurniTypes.indexOf(k) == -1)) : false;
        }

        private function populateFurniData(k:Vector.<IFurnitureData>):void
        {
            var _local_2:IFurnitureData;
            var _local_3:int;
            var _local_4:String;
            var _local_5:int;
            var _local_6:String;
            var _local_7:String;
            var _local_8:int;
            for each (_local_2 in k)
            {
                _local_3 = _local_2.id;
                _local_4 = _local_2.className;
                if (_local_2.hasIndexedColor)
                {
                    _local_4 = ((_local_4 + "*") + _local_2.colourIndex);
                }
                _local_5 = _local_2.revision;
                _local_6 = _local_2.adUrl;
                if (((!(_local_6 == null)) && (_local_6.length > 0)))
                {
                    this._objectTypeAdURLs.add(_local_4, _local_6);
                }
                _local_7 = _local_2.className;
                if (_local_2.type == "s")
                {
                    this._activeObjectTypes.add(_local_3, _local_4);
                    this._activeObjectTypeIds.add(_local_4, _local_3);
                    if (this._activeObjects[_local_7] == null)
                    {
                        this._activeObjects[_local_7] = 1;
                    }
                }
                else
                {
                    if (_local_2.type == "i")
                    {
                        if (_local_4 == "post.it")
                        {
                            _local_4 = "post_it";
                            _local_7 = "post_it";
                        }
                        if (_local_4 == "post.it.vd")
                        {
                            _local_4 = "post_it_vd";
                            _local_7 = "post_it_vd";
                        }
                        this._wallItemTypes.add(_local_3, _local_4);
                        this._wallItemTypeIds.add(_local_4, _local_3);
                        if (this._wallItems[_local_7] == null)
                        {
                            this._wallItems[_local_7] = 1;
                        }
                    }
                }
                _local_8 = this._furniRevisions.getValue(_local_7);
                if (_local_5 > _local_8)
                {
                    this._furniRevisions.remove(_local_7);
                    this._furniRevisions.add(_local_7, _local_5);
                }
            }
        }

        private function continueInitilization():void
        {
            if (this._dataInitialized)
            {
                this._state = CONST_TWO;
                if (this._stateEvents != null)
                {
                    this._stateEvents.dispatchEvent(new Event(RCL_LOADER_READY));
                }
            }
        }

        public function setRoomObjectAlias(k:String, _arg_2:String):void
        {
            if (this._objectAliases != null)
            {
                this._objectAliases.remove(k);
                this._objectAliases.add(k, _arg_2);
            }
            if (this._objectOriginalNames != null)
            {
                this._objectOriginalNames.remove(_arg_2);
                this._objectOriginalNames.add(_arg_2, k);
            }
        }

        private function getRoomObjectAlias(k:String):String
        {
            var _local_2:String;
            if (this._objectAliases != null)
            {
                _local_2 = (this._objectAliases.getValue(k) as String);
            }
            if (_local_2 == null)
            {
                _local_2 = k;
            }
            return _local_2;
        }

        private function getRoomObjectOriginalName(k:String):String
        {
            var _local_2:String;
            if (this._objectOriginalNames != null)
            {
                _local_2 = (this._objectOriginalNames.getValue(k) as String);
            }
            if (_local_2 == null)
            {
                _local_2 = k;
            }
            return _local_2;
        }

        public function getObjectCategory(k:String):int
        {
            if (k == null)
            {
                return RoomObjectCategoryEnum.CONST_MIN2;
            }
            if (this._activeObjects[k] != null)
            {
                return RoomObjectCategoryEnum.CONST_10;
            }
            if (this._wallItems[k] != null)
            {
                return RoomObjectCategoryEnum.CONST_20;
            }
            if (this._pets[k] != null)
            {
                return RoomObjectCategoryEnum.CONST_100;
            }
            if (k.indexOf("poster") == 0)
            {
                return RoomObjectCategoryEnum.CONST_20;
            }
            if (k == "room")
            {
                return RoomObjectCategoryEnum.CONST_0;
            }
            if (k == RoomObjectUserTypes.USER)
            {
                return RoomObjectCategoryEnum.CONST_100;
            }
            if (k == RoomObjectUserTypes.PET)
            {
                return RoomObjectCategoryEnum.CONST_100;
            }
            if (k == RoomObjectUserTypes.BOT)
            {
                return RoomObjectCategoryEnum.CONST_100;
            }
            if (k == RoomObjectUserTypes.RENTABLE_BOT)
            {
                return RoomObjectCategoryEnum.CONST_100;
            }
            if (((k == "tile_cursor") || (k == "selection_arrow")))
            {
                return RoomObjectCategoryEnum.CONST_200;
            }
            return RoomObjectCategoryEnum.CONST_MIN2;
        }

        public function getPlaceHolderType(k:String):String
        {
            if (this._activeObjects[k] != null)
            {
                return PLACE_HOLDER;
            }
            if (this._wallItems[k] != null)
            {
                return WALL_PLACE_HOLDER;
            }
            if (this._pets[k] != null)
            {
                return PET_PLACE_HOLDER;
            }
            return DEFAULT_PLACE_HOLDER;
        }

        public function getPlaceHolderTypes():Array
        {
            return PLACE_HOLDER_TYPES_GPU;
        }

        public function getActiveObjectType(k:int):String
        {
            var _local_2:String = (this._activeObjectTypes.getValue(k) as String);
            return this.getObjectType(_local_2);
        }

        public function getActiveObjectTypeId(k:String):int
        {
            return this._activeObjectTypeIds.getValue(k);
        }

        public function getWallItemType(k:int, _arg_2:String=null):String
        {
            var _local_3:String = (this._wallItemTypes.getValue(k) as String);
            if (((_local_3 == "poster") && (!(_arg_2 == null))))
            {
                _local_3 = (_local_3 + _arg_2);
            }
            return this.getObjectType(_local_3);
        }

        public function _Str_26208(k:String):int
        {
            return this._wallItemTypeIds.getValue(k);
        }

        public function getPetType(k:int):String
        {
            var _local_2:String = (this._petTypes.getValue(k) as String);
            return _local_2;
        }

        public function getWallItemTypeId(k:String):int
        {
            return this._pets[k];
        }

        public function getPetColor(k:int, _arg_2:int):PetColorResult
        {
            var _local_3:Map = this._petColors[k];
            if (_local_3 != null)
            {
                return _local_3[_arg_2] as PetColorResult;
            }
            return null;
        }

        public function getPetColorsByTag(k:int, _arg_2:String):Array
        {
            var _local_5:PetColorResult;
            var _local_3:Map = this._petColors[k];
            var _local_4:Array = [];
            if (_local_3 != null)
            {
                for each (_local_5 in _local_3.getValues())
                {
                    if (_local_5.tag == _arg_2)
                    {
                        _local_4.push(_local_5);
                    }
                }
            }
            return _local_4;
        }

        public function getPetLayerIdForTag(k:int, _arg_2:String, _arg_3:int=64):int
        {
            var _local_5:Dictionary;
            var _local_4:Map = this._petLayers[k];
            if (_local_4)
            {
                _local_5 = _local_4[_arg_3.toString()];
                if (_local_5)
                {
                    return (_local_5[_arg_2] != null) ? _local_5[_arg_2] : -1;
                }
            }
            return -1;
        }

        public function getPetDefaultPalette(k:int, _arg_2:String):PetColorResult
        {
            var _local_4:PetColorResult;
            var _local_3:Map = this._petColors[k];
            if (_local_3 != null)
            {
                for each (_local_4 in _local_3.getValues())
                {
                    if (((_local_4.layerTags.indexOf(_arg_2) > -1) && (_local_4.isMaster)))
                    {
                        return _local_4;
                    }
                }
            }
            return null;
        }

        public function getActiveObjectColorIndex(k:int):int
        {
            var _local_2:String = (this._activeObjectTypes.getValue(k) as String);
            return this.getObjectColorIndex(_local_2);
        }

        public function getWallItemColorIndex(k:int):int
        {
            var _local_2:String = (this._wallItemTypes.getValue(k) as String);
            return this.getObjectColorIndex(_local_2);
        }

        public function getRoomObjectAdURL(k:String):String
        {
            if (this._objectTypeAdURLs.getValue(k) != null)
            {
                return this._objectTypeAdURLs.getValue(k);
            }
            return "";
        }

        private function getObjectType(k:String):String
        {
            if (k == null)
            {
                return null;
            }
            var _local_2:int = k.indexOf("*");
            if (_local_2 >= 0)
            {
                k = k.substr(0, _local_2);
            }
            return k;
        }

        private function getObjectColorIndex(k:String):int
        {
            if (k == null)
            {
                return -1;
            }
            var _local_2:int;
            var _local_3:int = k.indexOf("*");
            if (_local_3 >= 0)
            {
                _local_2 = int(k.substr((_local_3 + 1)));
            }
            return _local_2;
        }

        public function getContentType(k:String):String
        {
            return k;
        }

        public function hasInternalContent(k:String):Boolean
        {
            k = RoomObjectUserTypes.getVisualizationType(k);
            if ((((k == RoomObjectVisualizationType.USER) || (k == RoomObjectVisualizationType.GAME_SNOWBALL)) || (k == RoomObjectVisualizationType.GAME_SNOWSPLASH)))
            {
                return true;
            }
            return false;
        }

        private function getObjectRevision(k:String):int
        {
            var _local_3:int;
            var _local_2:int = this.getObjectCategory(k);
            if (((_local_2 == RoomObjectCategoryEnum.CONST_10) || (_local_2 == RoomObjectCategoryEnum.CONST_20)))
            {
                if (k.indexOf("poster") == 0)
                {
                    k = "poster";
                }
                _local_3 = this._furniRevisions.getValue(k);
                return _local_3;
            }
            return 0;
        }

        private function getObjectContentURLs(k:String, _arg_2:String=null, _arg_3:Boolean=false):Array
        {
            var _local_4:String;
            var _local_5:int;
            var _local_6:String;
            var _local_7:String;
            var _local_8:int;
            var _local_9:Boolean;
            var _local_10:String;
            _local_4 = this.getContentType(k);
            switch (_local_4)
            {
                case PLACE_HOLDER:
                    return [this.getAssetLibraryName("PlaceHolderFurniture.swf")];
                case WALL_PLACE_HOLDER:
                    return [this.getAssetLibraryName("PlaceHolderWallItem.swf")];
                case PET_PLACE_HOLDER:
                    return [this.getAssetLibraryName("PlaceHolderPet.swf")];
                case ROOM:
                    return [this.getAssetLibraryName("HabboRoomContent.swf")];
                case TILE_CURSOR:
                    return [this.getAssetLibraryName("TileCursor.swf")];
                case SELECTION_ARROW:
                    return [this.getAssetLibraryName("SelectionArrow.swf")];
                default:
                    _local_5 = this.getObjectCategory(_local_4);
                    if (((_local_5 == RoomObjectCategoryEnum.CONST_10) || (_local_5 == RoomObjectCategoryEnum.CONST_20)))
                    {
                        _local_6 = this.getRoomObjectAlias(_local_4);
                        _local_7 = ((_arg_3) ? this._iconLoadNameTemplate : this._furniLoadNameTemplate);
                        _local_7 = _local_7.replace(/%typeid%/, _local_6);
                        _local_8 = this.getObjectRevision(_local_4);
                        _local_7 = _local_7.replace(/%revision%/, _local_8);
                        if (_arg_3)
                        {
                            _local_9 = (((!(_arg_2 == null)) && (!(_arg_2 == ""))) && (this._activeObjectTypeIds.hasKey(((k + "*") + _arg_2))));
                            _local_7 = _local_7.replace(/%param%/, ((_local_9) ? ("_" + _arg_2) : ""));
                        }
                        return [(this._furniLoadUrlBase + _local_7)];
                    }
                    if (_local_5 == RoomObjectCategoryEnum.CONST_100)
                    {
                        _local_10 = (this._assetUrlBase + this._petLoadNameTemplate);
                        _local_10 = _local_10.replace(/%type%/, _local_4);
                        return [_local_10];
                    }
            }
            return [];
        }

        private function getAssetLibraryName(k:String):String
        {
            return this._assetUrlBase + k;
        }

        public function insertObjectContent(k:int, _arg_2:int, _arg_3:IAssetLibrary):Boolean
        {
            var _local_6:Event;
            var _local_7:IEventDispatcher;
            var _local_4:String = this.getAssetLibraryType(_arg_3);
            switch (_arg_2)
            {
                case RoomObjectCategoryEnum.CONST_10:
                    this._activeObjectTypes[k] = _local_4;
                    this._activeObjectTypeIds.add(_local_4, k);
                    break;
                case RoomObjectCategoryEnum.CONST_20:
                    this._wallItemTypes[k] = _local_4;
                    break;
                default:
                    throw (new Error((("Registering content library for unsupported category " + _arg_2) + "!")));
            }
            var _local_5:AssetLibraryCollection = (this.addAssetLibraryCollection(_local_4, null) as AssetLibraryCollection);
            if (_local_5)
            {
                _local_5.addAssetLibrary(_arg_3);
                if (this.initializeGraphicAssetCollection(_local_4, _arg_3))
                {
                    switch (_arg_2)
                    {
                        case RoomObjectCategoryEnum.CONST_10:
                            if (this._activeObjects[_local_4] == null)
                            {
                                this._activeObjects[_local_4] = 1;
                            }
                            break;
                        case RoomObjectCategoryEnum.CONST_20:
                            if (this._wallItems[_local_4] == null)
                            {
                                this._wallItems[_local_4] = 1;
                            }
                            break;
                        default:
                            throw (new Error((("Registering content library for unsupported category " + _arg_2) + "!")));
                    }
                    _local_6 = new RoomContentLoadedEvent(RoomContentLoadedEvent.RCLE_SUCCESS, _local_4);
                    _local_7 = this.getAssetLibraryEventDispatcher(_local_4, true);
                    if (_local_7)
                    {
                        _local_7.dispatchEvent(_local_6);
                    }
                    return true;
                }
            }
            return false;
        }

        public function _Str_21771(k:String, _arg_2:String):String
        {
            var _local_4:Array;
            var _local_3:String;
            if (((k) && (k.indexOf(",") >= 0)))
            {
                _local_3 = k;
                k = _local_3.split(",")[0];
            }
            if (_local_3 != null)
            {
                _local_4 = this.getObjectContentURLs(_local_3, _arg_2, true);
            }
            else
            {
                _local_4 = this.getObjectContentURLs(k, _arg_2, true);
            }
            if (_local_4.length > 0)
            {
                return _local_4[0] as String;
            }
            return null;
        }

        public function loadThumbnailContent(k:int, _arg_2:String, _arg_3:String, _arg_4:IEventDispatcher):Boolean
        {
            var _local_6:Array;
            var _local_7:int;
            var _local_8:String;
            var _local_9:String;
            var _local_10:AssetLoaderStruct;
            var _local_5:String;
            if (((_arg_2) && (_arg_2.indexOf(",") >= 0)))
            {
                _local_5 = _arg_2;
                _arg_2 = _local_5.split(",")[0];
            }
            if (_local_5 != null)
            {
                _local_6 = this.getObjectContentURLs(_local_5, _arg_3, true);
            }
            else
            {
                _local_6 = this.getObjectContentURLs(_arg_2, _arg_3, true);
            }
            if (((!(_local_6 == null)) && (_local_6.length > 0)))
            {
                _local_7 = 0;
                while (_local_7 < _local_6.length)
                {
                    _local_8 = _local_6[_local_7];
                    _local_9 = _local_8;
                    _local_10 = this._iconAssets.loadAssetFromFile([_arg_2, _arg_3].join("_"), new URLRequest(_local_9), "image/png", null, -1, k);
                    _local_10.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_9536);
                    _local_7++;
                }
                return true;
            }
            return false;
        }

        public function loadObjectContent(k:String, _arg_2:IEventDispatcher):Boolean
        {
            var _local_5:Array;
            var _local_6:int;
            var _local_7:LibraryLoader;
            var _local_8:String;
            var _local_9:String;
            var _local_3:String;
            if (((k) && (k.indexOf(",") >= 0)))
            {
                _local_3 = k;
                k = _local_3.split(",")[0];
            }
            if (((!(this.getAssetLibrary(k) == null)) || (!(this.getAssetLibraryEventDispatcher(k) == null))))
            {
                return false;
            }
            var _local_4:AssetLibraryCollection = (this.addAssetLibraryCollection(k, _arg_2) as AssetLibraryCollection);
            if (_local_4 == null)
            {
                return false;
            }
            if (this._Str_23570(k))
            {
                Logger.log(("Ignored object type found from configuration. Not downloading assets for: " + k));
                return false;
            }
            if (_local_3 != null)
            {
                _local_5 = this.getObjectContentURLs(_local_3);
            }
            else
            {
                _local_5 = this.getObjectContentURLs(k);
            }
            if (((!(_local_5 == null)) && (_local_5.length > 0)))
            {
                _local_4.addEventListener(AssetLibrary.ASSET_LIBRARY_LOADED, this._Str_9536);
                _local_6 = 0;
                while (_local_6 < _local_5.length)
                {
                    _local_7 = new LibraryLoader();
                    _local_8 = _local_5[_local_6];
                    _local_9 = _local_8;
                    _local_4.loadFromFile(_local_7, true);
                    _local_7.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.onContentLoadError);
                    _local_7.load(new URLRequest(_local_9));
                    _local_6++;
                }
                return true;
            }
            return false;
        }

        private function onContentLoadError(k:Event):void
        {
            var _local_4:String;
            var _local_5:Array;
            var _local_2:LibraryLoader = LibraryLoader(k.target);
            var _local_3:Array = this.getPlaceHolderTypes();
            for each (_local_4 in _local_3)
            {
                _local_5 = this.getObjectContentURLs(_local_4);
                if ((((_local_5.length > 0) && (!(_local_2.url == null))) && (_local_2.url.indexOf(_local_5[0]) == 0)))
                {
                    Core.crash(("Failed to load asset: " + _local_2.url), Core.ERROR_CATEGORY_DOWNLOAD_CRITICAL_ASSET);
                    return;
                }
            }
        }

        private function _Str_9536(k:Event):void
        {
            var _local_2:AssetLoaderStruct;
            var _local_3:IAssetLibrary;
            if (this.disposed)
            {
                return;
            }
            if ((k.target is AssetLoaderStruct))
            {
                _local_2 = (k.target as AssetLoaderStruct);
                this._iconListener.iconLoaded(_local_2.assetLoader.id, _local_2.assetName, true);
            }
            else
            {
                _local_3 = (k.target as IAssetLibrary);
                if (_local_3 == null)
                {
                    return;
                }
                this.processLoadedLibrary(_local_3);
            }
        }

        private function processLoadedLibrary(k:IAssetLibrary):void
        {
            var _local_2:RoomContentLoadedEvent;
            var _local_3:Boolean;
            var _local_4:String = this.getAssetLibraryType(k);
            _local_4 = this.getRoomObjectOriginalName(_local_4);
            if (_local_4 != null)
            {
                _local_3 = this.initializeGraphicAssetCollection(_local_4, k);
            }
            if (_local_3)
            {
                if (this._pets[_local_4] != null)
                {
                    this.extractPetDataFromLoadedContent(_local_4);
                }
                _local_2 = new RoomContentLoadedEvent(RoomContentLoadedEvent.RCLE_SUCCESS, _local_4);
            }
            else
            {
                _local_2 = new RoomContentLoadedEvent(RoomContentLoadedEvent.RCLE_FAILURE, _local_4);
            }
            var _local_5:IEventDispatcher = this.getAssetLibraryEventDispatcher(_local_4, true);
            if (((!(_local_5 == null)) && (!(_local_2 == null))))
            {
                _local_5.dispatchEvent(_local_2);
            }
        }

        private function extractPetDataFromLoadedContent(k:String):void
        {
            var _local_5:Map;
            var _local_6:Array;
            var _local_7:String;
            var _local_8:Array;
            var _local_9:XML;
            var _local_10:int;
            var _local_11:int;
            var _local_12:Array;
            var _local_13:Boolean;
            var _local_14:Map;
            var _local_15:XML;
            var _local_16:Dictionary;
            var _local_17:XML;
            var _local_18:String;
            var _local_19:String;
            var _local_2:int = this._pets[k];
            var _local_3:IGraphicAssetCollection = this.getGraphicAssetCollection(k);
            if (_local_3 != null)
            {
                _local_5 = new Map();
                _local_6 = _local_3._Str_21825();
                for each (_local_7 in _local_6)
                {
                    _local_8 = _local_3._Str_20963(_local_7);
                    if (((!(_local_8 == null)) && (_local_8.length >= 2)))
                    {
                        _local_9 = _local_3._Str_17888(_local_7);
                        _local_10 = int(_local_9.@breed);
                        _local_11 = ((_local_9.hasOwnProperty("@colortag")) ? int(_local_9.@colortag) : -1);
                        _local_12 = ((_local_9.hasOwnProperty("@tags")) ? String(_local_9.@tags).split(",") : []);
                        _local_13 = ((_local_9.hasOwnProperty("@master")) ? (String(_local_9.@master) == "true") : false);
                        _local_5.add(_local_7, new PetColorResult(_local_8[0], _local_8[1], _local_10, _local_11, _local_7, _local_13, _local_12));
                    }
                }
                this._petColors.add(_local_2, _local_5);
            }
            var _local_4:XML = this.getVisualizationXML(k);
            if (_local_4 != null)
            {
                _local_14 = new Map();
                for each (_local_15 in _local_4.visualization)
                {
                    _local_16 = new Dictionary();
                    for each (_local_17 in _local_15.layers.layer)
                    {
                        if (_local_17.hasOwnProperty("@tag"))
                        {
                            _local_19 = _local_17.@tag;
                            _local_16[_local_19] = parseInt(String(_local_17.@id));
                        }
                    }
                    _local_18 = _local_15.@size;
                    _local_14.add(_local_18, _local_16);
                }
                this._petLayers.add(_local_2, _local_14);
            }
        }

        private function initializeGraphicAssetCollection(k:String, _arg_2:IAssetLibrary):Boolean
        {
            var _local_5:XML;
            if (((k == null) || (_arg_2 == null)))
            {
                return false;
            }
            var _local_3:Boolean;
            var _local_4:IGraphicAssetCollection = this.createGraphicAssetCollection(k, _arg_2);
            if (_local_4 != null)
            {
                _local_5 = this.getAssetXML(k);
                if (_local_4._Str_13182(_local_5))
                {
                    _local_3 = true;
                }
                else
                {
                    this.disposeGraphicAssetCollection(k);
                }
            }
            return _local_3;
        }

        public function extractObjectContent(k:String, _arg_2:String):Boolean
        {
            var _local_3:IAssetLibrary = this.getAssetLibrary(k);
            this._additionalObjectTypeLibraries.add(_arg_2, k);
            if (this.initializeGraphicAssetCollection(_arg_2, _local_3))
            {
                return true;
            }
            this._additionalObjectTypeLibraries.remove(_arg_2);
            return false;
        }

        private function _Str_10970(k:String):String
        {
            return RCL_PREFIX + k;
        }

        private function getAssetLibrary(k:String):IAssetLibrary
        {
            var _local_4:String;
            var _local_2:String = this.getContentType(k);
            _local_2 = this.getRoomObjectOriginalName(_local_2);
            var _local_3:IAssetLibrary = (this._libraries.getValue(this._Str_10970(_local_2)) as IAssetLibrary);
            if (_local_3 == null)
            {
                _local_4 = this._additionalObjectTypeLibraries.getValue(_local_2);
                if (_local_4 != null)
                {
                    _local_2 = this.getContentType(_local_4);
                    _local_3 = (this._libraries.getValue(this._Str_10970(_local_2)) as IAssetLibrary);
                }
            }
            return _local_3;
        }

        private function addAssetLibraryCollection(k:String, _arg_2:IEventDispatcher):IAssetLibrary
        {
            var _local_3:String = this.getContentType(k);
            var _local_4:IAssetLibrary = this.getAssetLibrary(k);
            if (_local_4 != null)
            {
                return _local_4;
            }
            var _local_5:String = this._Str_10970(_local_3);
            _local_4 = new AssetLibraryCollection(_local_5);
            this._libraries.add(_local_5, _local_4);
            if (((!(_arg_2 == null)) && (this.getAssetLibraryEventDispatcher(k) == null)))
            {
                this._events.add(_local_3, _arg_2);
            }
            return _local_4;
        }

        private function getAssetLibraryEventDispatcher(k:String, _arg_2:Boolean=false):IEventDispatcher
        {
            var _local_3:String = this.getContentType(k);
            if (!_arg_2)
            {
                return this._events.getValue(_local_3);
            }
            return this._events.remove(_local_3);
        }

        private function getIconAssetType(k:AssetLoaderStruct):String
        {
            if (k == null)
            {
                return null;
            }
            var _local_2:String = k.assetName;
            var _local_3:Array = _local_2.split("_");
            var _local_4:int = parseInt(_local_3.pop());
            var _local_5:String = _local_3.join("_");
            return (_local_4 > 0) ? ((_local_5 + "*") + _local_4) : _local_5;
        }

        private function getAssetLibraryType(k:IAssetLibrary):String
        {
            if (k == null)
            {
                return null;
            }
            var _local_2:IAsset = k.getAssetByName("index");
            if (_local_2 == null)
            {
                return null;
            }
            var _local_3:XML = (_local_2.content as XML);
            if (_local_3 == null)
            {
                return null;
            }
            var _local_4:String = _local_3.@type;
            return _local_4;
        }

        public function getVisualizationType(k:String):String
        {
            if (k == null)
            {
                return null;
            }
            var _local_2:IAssetLibrary = this.getAssetLibrary(k);
            if (_local_2 == null)
            {
                return null;
            }
            var _local_3:IAsset = _local_2.getAssetByName((k + "_index"));
            if (_local_3 == null)
            {
                _local_3 = _local_2.getAssetByName("index");
            }
            if (_local_3 == null)
            {
                return null;
            }
            var _local_4:XML = (_local_3.content as XML);
            if (_local_4 == null)
            {
                return null;
            }
            var _local_5:String = _local_4.@visualization;
            return _local_5;
        }

        public function getLogicType(k:String):String
        {
            if (k == null)
            {
                return null;
            }
            var _local_2:IAssetLibrary = this.getAssetLibrary(k);
            if (_local_2 == null)
            {
                return null;
            }
            var _local_3:IAsset = _local_2.getAssetByName((k + "_index"));
            if (_local_3 == null)
            {
                _local_3 = _local_2.getAssetByName("index");
            }
            if (_local_3 == null)
            {
                return null;
            }
            var _local_4:XML = (_local_3.content as XML);
            if (_local_4 == null)
            {
                return null;
            }
            var _local_5:String = _local_4.@logic;
            return _local_5;
        }

        public function hasVisualizationXML(k:String):Boolean
        {
            return this.hasXML(k, "_visualization");
        }

        public function getVisualizationXML(k:String):XML
        {
            return this._Str_5598(k, "_visualization");
        }

        public function hasAssetXML(k:String):Boolean
        {
            return this.hasXML(k, "_assets");
        }

        public function getAssetXML(k:String):XML
        {
            return this._Str_5598(k, "_assets");
        }

        public function hasLogicXML(k:String):Boolean
        {
            return this.hasXML(k, "_logic");
        }

        public function getLogicXML(k:String):XML
        {
            return this._Str_5598(k, "_logic");
        }

        private function _Str_5598(k:String, _arg_2:String):XML
        {
            var _local_3:IAssetLibrary = this.getAssetLibrary(k);
            if (_local_3 == null)
            {
                return null;
            }
            var _local_4:String = this.getContentType(k);
            var _local_5:String = this.getRoomObjectAlias(_local_4);
            var _local_6:IAsset = _local_3.getAssetByName((_local_5 + _arg_2));
            if (_local_6 == null)
            {
                return null;
            }
            var _local_7:XML = (_local_6.content as XML);
            if (_local_7 == null)
            {
                return null;
            }
            return _local_7;
        }

        private function hasXML(k:String, _arg_2:String):Boolean
        {
            var _local_3:IAssetLibrary = this.getAssetLibrary(k);
            if (_local_3 == null)
            {
                return false;
            }
            var _local_4:String = this.getContentType(k);
            var _local_5:String = this.getRoomObjectAlias(_local_4);
            return _local_3.hasAsset((_local_5 + _arg_2));
        }

        public function _Str_16696(k:String, _arg_2:String, _arg_3:BitmapData, _arg_4:Boolean, _arg_5:Boolean=true):Boolean
        {
            var _local_6:IGraphicAssetCollection = this.getGraphicAssetCollection(k);
            if (_local_6 != null)
            {
                return _local_6.addAsset(_arg_2, _arg_3, _arg_4, 0, 0, false, false);
            }
            return false;
        }

        private function createGraphicAssetCollection(k:String, _arg_2:IAssetLibrary):IGraphicAssetCollection
        {
            var _local_3:IGraphicAssetCollection = this.getGraphicAssetCollection(k);
            if (_local_3 != null)
            {
                return _local_3;
            }
            if (_arg_2 == null)
            {
                return null;
            }
            _local_3 = this._visualizationFactory.createGraphicAssetCollection();
            if (_local_3 != null)
            {
                _local_3.assetLibrary = _arg_2;
                this._assetCollections.add(k, _local_3);
            }
            return _local_3;
        }

        public function getGraphicAssetCollection(k:String):IGraphicAssetCollection
        {
            var _local_2:String = this.getContentType(k);
            return this._assetCollections.getValue(_local_2) as IGraphicAssetCollection;
        }

        public function roomObjectCreated(k:IRoomObject, _arg_2:String):void
        {
            var _local_3:IRoomObjectController = (k as IRoomObjectController);
            if (((_local_3) && (_local_3.getModelController())))
            {
                _local_3.getModelController().setString(RoomObjectVariableEnum.OBJECT_ROOM_ID, _arg_2, true);
            }
        }

        private function disposeGraphicAssetCollection(k:String):Boolean
        {
            var _local_3:IGraphicAssetCollection;
            var _local_2:String = this.getContentType(k);
            if (this._assetCollections[_local_2] != null)
            {
                _local_3 = this._assetCollections.remove(_local_2);
                if (_local_3 != null)
                {
                    _local_3.dispose();
                }
                return true;
            }
            return false;
        }

        public function furniDataReady():void
        {
            this.initFurnitureData();
        }

        public function setActiveObjectType(k:int, _arg_2:String):void
        {
            this._activeObjectTypes.remove(k);
            this._activeObjectTypes.add(k, _arg_2);
        }

        public function compressAssets():void
        {
            var _local_2:IGraphicAssetCollection;
            var _local_3:String;
            var _local_6:String;
            var _local_7:IAssetLibrary;
            var _local_8:int;
            var _local_9:int;
            var _local_10:BitmapDataAsset;
            var k:int = this._assetCollections.length;
            var _local_4:Array = this.getPlaceHolderTypes();
            var _local_5:int = (k - 1);
            while (_local_5 > -1)
            {
                _local_3 = this._assetCollections.getKey(_local_5);
                if (_local_4.indexOf(_local_3) != -1)
                {
                }
                else
                {
                    _local_2 = this._assetCollections.getValue(_local_3);
                    _local_6 = this._Str_10970(_local_3);
                    _local_7 = (this._libraries.getValue(_local_6) as IAssetLibrary);
                    if (!_local_7)
                    {
                    }
                    else
                    {
                        _local_8 = _local_7.numAssets;
                        _local_9 = 0;
                        while (_local_9 < _local_8)
                        {
                            _local_10 = (_local_7.getAssetByIndex(_local_9) as BitmapDataAsset);
                            if (_local_10)
                            {
                            }
                            _local_9++;
                        }
                    }
                }
                _local_5--;
            }
            this._lastAssetCompressionTime = getTimer();
        }

        public function purge():void
        {
            var _local_2:IGraphicAssetCollection;
            var _local_3:String;
            var _local_6:String;
            var _local_7:IAssetLibrary;
            var k:int = this._assetCollections.length;
            var _local_4:int = getTimer();
            var _local_5:int = (k - 1);
            while (_local_5 > -1)
            {
                _local_3 = this._assetCollections.getKey(_local_5);
                if (PLACE_HOLDER_TYPES_GPU.indexOf(_local_3) < 0)
                {
                    _local_2 = this._assetCollections.getValue(_local_3);
                    if (((_local_2._Str_20679() < 1) && ((_local_4 - _local_2._Str_21431()) >= CONST_20000)))
                    {
                        this._assetCollections.remove(_local_3);
                        _local_2.dispose();
                        _local_6 = this._Str_10970(_local_3);
                        _local_7 = (this._libraries.getValue(_local_6) as IAssetLibrary);
                        if (_local_7)
                        {
                            this._libraries.remove(_local_6);
                            _local_7.dispose();
                        }
                    }
                }
                _local_5--;
            }
        }

        public function _Str_26341(k:String):String
        {
            var _local_2:String = this.getContentType(k);
            if (((((((_local_2 == PLACE_HOLDER) || (_local_2 == WALL_PLACE_HOLDER)) || (_local_2 == PET_PLACE_HOLDER)) || (_local_2 == ROOM)) || (_local_2 == TILE_CURSOR)) || (_local_2 == SELECTION_ARROW)))
            {
                return null;
            }
            var _local_3:int = this.getObjectCategory(_local_2);
            if (((!(_local_3 == RoomObjectCategoryEnum.CONST_10)) && (!(_local_3 == RoomObjectCategoryEnum.CONST_20))))
            {
                return null;
            }
            var _local_4:int = this.getObjectRevision(_local_2);
            return ((((("room_content/" + k) + "/") + _local_4) + "/") + k) + ".swf";
        }

        public function set iconAssets(k:IAssetLibrary):void
        {
            this._iconAssets = k;
        }

        public function set iconListener(k:IRoomContentListener):void
        {
            this._iconListener = k;
        }
    }
}
