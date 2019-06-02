package com.sulake.room
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.utils.Map;
    import com.sulake.room.object.IRoomObjectVisualizationFactory;
    import com.sulake.room.events.RoomContentLoadedEvent;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDRoomObjectFactory;
    import com.sulake.iid.IIDRoomObjectVisualizationFactory;
    import __AS3__.vec.Vector;
    import com.sulake.room.exceptions.RoomManagerException;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.object.visualization.IRoomObjectGraphicVisualization;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import flash.utils.getTimer;
    import com.sulake.iid.*;

    public class RoomManager extends Component implements IRoomManager, IRoomInstanceContainer 
    {
        public static const ROOM_MANAGER_ERROR:int = -1;
        public static const ROOM_MANAGER_LOADING:int = 0;
        public static const ROOM_MANAGER_LOADED:int = 1;
        public static const ROOM_MANAGER_INITIALIZING:int = 2;
        public static const ROOM_MANAGER_INITIALIZED:int = 3;
        private static const CONTENT_PROCESSING_TIME_LIMIT_MILLISECONDS:int = 40;

        private var _rooms:Map;
        private var _contentLoader:IRoomContentLoader;
        private var _initialLoadList:Array;
        private var _updateCategories:Array;
        private var _updateInterval:int;
        private var _listener:IRoomManagerListener;
        private var _objectFactory:IRoomObjectFactory = null;
        private var _visualizationFactory:IRoomObjectVisualizationFactory = null;
        private var _state:int = 0;
        private var _initializationData:XML = null;
        private var _unprocessedLoadedContentTypes:Array;
        private var _skipContentProcessingForNextFrame:Boolean = false;
        private var _limitContentProcessing:Boolean = true;
        private var _disposed:Boolean = false;

        public function RoomManager(k:IContext, _arg_2:uint=0)
        {
            this._unprocessedLoadedContentTypes = [];
            super(k, _arg_2);
            this._rooms = new Map();
            this._initialLoadList = [];
            this._updateCategories = [];
            events.addEventListener(RoomContentLoadedEvent.RCLE_SUCCESS, this._Str_9536);
            events.addEventListener(RoomContentLoadedEvent.RCLE_FAILURE, this._Str_9536);
            events.addEventListener(RoomContentLoadedEvent.RCLE_CANCEL, this._Str_9536);
        }

        override public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set limitContentProcessing(k:Boolean):void
        {
            this._limitContentProcessing = k;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDRoomObjectFactory(), function (k:IRoomObjectFactory):void
            {
                _objectFactory = k;
            }), new ComponentDependency(new IIDRoomObjectVisualizationFactory(), function (k:IRoomObjectVisualizationFactory):void
            {
                _visualizationFactory = k;
            })]));
        }

        override protected function initComponent():void
        {
            var k:XML;
            this._state = ROOM_MANAGER_LOADED;
            if (this._initializationData != null)
            {
                k = this._initializationData;
                this._initializationData = null;
                this.initialize(k, this._listener);
            }
        }

        override public function dispose():void
        {
            var k:IRoomInstance;
            if (this.disposed)
            {
                return;
            }
            if (this._rooms != null)
            {
                for each (k in this._rooms)
                {
                    if (k != null)
                    {
                        k.dispose();
                    }
                }
                this._rooms.dispose();
                this._rooms = null;
            }
            this._listener = null;
            this._initialLoadList = null;
            this._updateCategories = null;
            this._contentLoader = null;
            super.dispose();
        }

        public function initialize(k:XML, _arg_2:IRoomManagerListener):Boolean
        {
            var _local_5:String;
            if (this._state == ROOM_MANAGER_LOADING)
            {
                if (this._initializationData != null)
                {
                    return false;
                }
                this._initializationData = k;
                this._listener = _arg_2;
                return true;
            }
            if (this._state >= ROOM_MANAGER_INITIALIZING)
            {
                return false;
            }
            if (k == null)
            {
                return false;
            }
            if (this._contentLoader == null)
            {
                return false;
            }
            this._updateInterval = 50;
            this._listener = _arg_2;
            var _local_3:Array = this._contentLoader.getPlaceHolderTypes();
            var _local_4:int;
            while (_local_4 < _local_3.length)
            {
                _local_5 = _local_3[_local_4];
                if (this._initialLoadList.indexOf(_local_5) < 0)
                {
                    this._contentLoader.loadObjectContent(_local_5, events);
                    this._initialLoadList.push(_local_5);
                }
                _local_4++;
            }
            this._state = ROOM_MANAGER_INITIALIZING;
            return true;
        }

        public function setContentLoader(k:IRoomContentLoader):void
        {
            if (this._contentLoader != null)
            {
                this._contentLoader.dispose();
            }
            this._contentLoader = k;
        }

        public function addObjectUpdateCategory(k:int):void
        {
            var _local_4:RoomInstance;
            var _local_2:int = this._updateCategories.indexOf(k);
            if (_local_2 >= 0)
            {
                return;
            }
            this._updateCategories.push(k);
            var _local_3:int = (this._rooms.length - 1);
            while (_local_3 >= 0)
            {
                _local_4 = (this._rooms.getWithIndex(_local_3) as RoomInstance);
                if (_local_4 != null)
                {
                    _local_4.addObjectUpdateCategory(k);
                }
                _local_3--;
            }
        }

        public function removeObjectUpdateCategory(k:int):void
        {
            var _local_4:RoomInstance;
            var _local_2:int = this._updateCategories.indexOf(k);
            if (_local_2 < 0)
            {
                return;
            }
            this._updateCategories.splice(_local_2, 1);
            var _local_3:int = (this._rooms.length - 1);
            while (_local_3 >= 0)
            {
                _local_4 = (this._rooms.getWithIndex(_local_3) as RoomInstance);
                if (_local_4 != null)
                {
                    _local_4.removeObjectUpdateCategory(k);
                }
                _local_3--;
            }
        }

        public function createRoom(k:String, _arg_2:XML):IRoomInstance
        {
            var _local_5:int;
            if (this._state < ROOM_MANAGER_INITIALIZED)
            {
                throw (new RoomManagerException());
            }
            if (this._rooms.getValue(k) != null)
            {
                return null;
            }
            var _local_3:RoomInstance = new RoomInstance(k, this);
            this._rooms.add(String(k), _local_3);
            var _local_4:int = (this._updateCategories.length - 1);
            while (_local_4 >= 0)
            {
                _local_5 = this._updateCategories[_local_4];
                _local_3.addObjectUpdateCategory(_local_5);
                _local_4--;
            }
            return _local_3;
        }

        public function getRoom(k:String):IRoomInstance
        {
            return this._rooms.getValue(k) as IRoomInstance;
        }

        public function getRoomWithIndex(k:int):IRoomInstance
        {
            return this._rooms.getWithIndex(k);
        }

        public function getRoomCount():int
        {
            return this._rooms.length;
        }

        public function disposeRoom(k:String):Boolean
        {
            var _local_2:IRoomInstance = (this._rooms.remove(k) as IRoomInstance);
            if (_local_2 != null)
            {
                _local_2.dispose();
                return true;
            }
            return false;
        }

        public function createRoomObject(k:String, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObject
        {
            if (this._state < ROOM_MANAGER_INITIALIZED)
            {
                throw (new RoomManagerException());
            }
            var _local_5:IRoomInstance = this.getRoom(k);
            if (_local_5 == null)
            {
                return null;
            }
            if (this._contentLoader == null)
            {
                return null;
            }
            var _local_6:RoomInstance = (_local_5 as RoomInstance);
            if (_local_6 == null)
            {
                return null;
            }
            var _local_7:IGraphicAssetCollection;
            var _local_8:XML;
            var _local_9:XML;
            var _local_10:String;
            var _local_11:String;
            var _local_12:String = _arg_3;
            var _local_13:Boolean;
            if (!this._contentLoader.hasInternalContent(_arg_3))
            {
                _local_7 = this._contentLoader.getGraphicAssetCollection(_arg_3);
                if (_local_7 == null)
                {
                    _local_13 = true;
                    this._contentLoader.loadObjectContent(_arg_3, events);
                    _local_12 = this._contentLoader.getPlaceHolderType(_arg_3);
                    _local_7 = this._contentLoader.getGraphicAssetCollection(_local_12);
                }
                _local_8 = this._contentLoader.getVisualizationXML(_local_12);
                _local_9 = this._contentLoader.getLogicXML(_local_12);
                if (((_local_8 == null) || (_local_7 == null)))
                {
                    return null;
                }
                _local_10 = this._contentLoader.getVisualizationType(_local_12);
                _local_11 = this._contentLoader.getLogicType(_local_12);
            }
            else
            {
                _local_10 = _arg_3;
                _local_11 = _arg_3;
            }
            var _local_14:int = 1;
            var _local_15:IRoomObject = _local_6.createObjectInternal(_arg_2, _local_14, _arg_3, _arg_4);
            var _local_16:IRoomObjectController = (_local_15 as IRoomObjectController);
            if (_local_16 == null)
            {
                return null;
            }
            var _local_17:IRoomObjectGraphicVisualization = this._visualizationFactory.createRoomObjectVisualization(_local_10);
            if (_local_17 == null)
            {
                _local_5.disposeObject(_arg_2, _arg_4);
                return null;
            }
            _local_17.assetCollection = _local_7;
            _local_17.setExternalBaseUrls(context.configuration.getProperty("stories.image_url_base"), context.configuration.getProperty("extra_data_service_url"), context.configuration.getBoolean("extra_data_batches_enabled"));
            var _local_18:IRoomObjectVisualizationData;
            _local_18 = this._visualizationFactory.getRoomObjectVisualizationData(_local_12, _local_10, _local_8);
            if (!_local_17.initialize(_local_18))
            {
                _local_5.disposeObject(_arg_2, _arg_4);
                return null;
            }
            _local_16.setVisualization(_local_17);
            var _local_19:IRoomObjectEventHandler = this._objectFactory.createRoomObjectLogic(_local_11);
            _local_16.setEventHandler(_local_19);
            if (((!(_local_19 == null)) && (!(_local_9 == null))))
            {
                _local_19.initialize(_local_9);
            }
            if (!_local_13)
            {
                _local_16.setInitialized(true);
            }
            this._contentLoader.roomObjectCreated(_local_16, k);
            return _local_16;
        }

        public function createRoomObjectManager():IRoomObjectManager
        {
            if (this._objectFactory != null)
            {
                return this._objectFactory.createRoomObjectManager();
            }
            return null;
        }

        public function isContentAvailable(k:String):Boolean
        {
            if (this._contentLoader != null)
            {
                if (this._contentLoader.getGraphicAssetCollection(k) != null)
                {
                    return true;
                }
            }
            return false;
        }

        private function processInitialContentLoad(k:String):void
        {
            var _local_2:int;
            if (k == null)
            {
                return;
            }
            if (this._state == ROOM_MANAGER_ERROR)
            {
                return;
            }
            if (this._contentLoader == null)
            {
                this._state = ROOM_MANAGER_ERROR;
                return;
            }
            if (this._contentLoader.getGraphicAssetCollection(k) != null)
            {
                _local_2 = this._initialLoadList.indexOf(k);
                if (_local_2 >= 0)
                {
                    this._initialLoadList.splice(_local_2, 1);
                }
                if (this._initialLoadList.length == 0)
                {
                    this._state = ROOM_MANAGER_INITIALIZED;
                    if (this._listener != null)
                    {
                        this._listener.roomManagerInitialized(true);
                    }
                }
            }
            else
            {
                this._state = ROOM_MANAGER_ERROR;
                this._listener.roomManagerInitialized(false);
            }
        }

        private function _Str_9536(k:RoomContentLoadedEvent):void
        {
            if (this._contentLoader == null)
            {
                return;
            }
            var _local_2:String = k.contentType;
            if (_local_2 == null)
            {
                if (this._listener != null)
                {
                    this._listener.contentLoaded(null, false);
                }
                return;
            }
            if (this._unprocessedLoadedContentTypes.indexOf(_local_2) < 0)
            {
                this._unprocessedLoadedContentTypes.push(_local_2);
            }
        }

        private function processLoadedContentTypes():void
        {
            var _local_2:String;
            var _local_3:IGraphicAssetCollection;
            var _local_4:int;
            if (this._skipContentProcessingForNextFrame)
            {
                this._skipContentProcessingForNextFrame = false;
                return;
            }
            var k:int = getTimer();
            while (this._unprocessedLoadedContentTypes.length > 0)
            {
                _local_2 = this._unprocessedLoadedContentTypes[0];
                this._unprocessedLoadedContentTypes.splice(0, 1);
                if (!this._contentLoader.hasVisualizationXML(_local_2))
                {
                    if (this._listener != null)
                    {
                        this._listener.contentLoaded(_local_2, false);
                    }
                    return;
                }
                _local_3 = this._contentLoader.getGraphicAssetCollection(_local_2);
                if (_local_3 == null)
                {
                    if (this._listener != null)
                    {
                        this._listener.contentLoaded(_local_2, false);
                    }
                    return;
                }
                this.updateObjectContents(_local_2);
                if (this._listener != null)
                {
                    this._listener.contentLoaded(_local_2, true);
                }
                if (this._initialLoadList.length > 0)
                {
                    this.processInitialContentLoad(_local_2);
                }
                _local_4 = getTimer();
                if ((((_local_4 - k) >= CONTENT_PROCESSING_TIME_LIMIT_MILLISECONDS) && (this._limitContentProcessing)))
                {
                    this._skipContentProcessingForNextFrame = true;
                    return;
                }
            }
        }

        private function updateObjectContents(k:String):void
        {
            var _local_2:XML;
            var _local_3:XML;
            var _local_4:IGraphicAssetCollection;
            var _local_7:IRoomObjectVisualizationData;
            var _local_9:RoomInstance;
            var _local_10:String;
            var _local_11:Array;
            var _local_12:Boolean;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:IRoomObjectController;
            var _local_17:IRoomObjectGraphicVisualization;
            var _local_18:IRoomObjectEventHandler;
            if (k == null)
            {
                return;
            }
            if (((this._contentLoader == null) || (this._visualizationFactory == null)))
            {
                return;
            }
            var _local_5:String = this._contentLoader.getVisualizationType(k);
            var _local_6:String = this._contentLoader.getLogicType(k);
            var _local_8:int = (this._rooms.length - 1);
            while (_local_8 >= 0)
            {
                _local_9 = (this._rooms.getWithIndex(_local_8) as RoomInstance);
                _local_10 = this._rooms.getKey(_local_8);
                if (_local_9 != null)
                {
                    _local_11 = _local_9.getObjectManagerIds();
                    _local_12 = false;
                    for each (_local_13 in _local_11)
                    {
                        _local_14 = _local_9.getObjectCountForType(k, _local_13);
                        _local_15 = (_local_14 - 1);
                        while (_local_15 >= 0)
                        {
                            _local_16 = (_local_9.getObjectWithIndexAndType(_local_15, k, _local_13) as IRoomObjectController);
                            if (_local_16 != null)
                            {
                                if (!_local_7)
                                {
                                    _local_2 = this._contentLoader.getVisualizationXML(k);
                                    if (_local_2 == null)
                                    {
                                        return;
                                    }
                                    _local_3 = this._contentLoader.getLogicXML(k);
                                    _local_4 = this._contentLoader.getGraphicAssetCollection(k);
                                    if (_local_4 == null)
                                    {
                                        return;
                                    }
                                    _local_7 = this._visualizationFactory.getRoomObjectVisualizationData(k, _local_5, _local_2);
                                }
                                _local_17 = this._visualizationFactory.createRoomObjectVisualization(_local_5);
                                if (_local_17 != null)
                                {
                                    _local_17.assetCollection = _local_4;
                                    _local_17.setExternalBaseUrls(context.configuration.getProperty("stories.image_url_base"), context.configuration.getProperty("extra_data_service_url"), context.configuration.getBoolean("extra_data_batches_enabled"));
                                    if (!_local_17.initialize(_local_7))
                                    {
                                        _local_9.disposeObject(_local_16.getId(), _local_13);
                                    }
                                    else
                                    {
                                        _local_16.setVisualization(_local_17);
                                        _local_18 = this._objectFactory.createRoomObjectLogic(_local_6);
                                        _local_16.setEventHandler(_local_18);
                                        if (_local_18 != null)
                                        {
                                            _local_18.initialize(_local_3);
                                        }
                                        _local_16.setInitialized(true);
                                        if (this._listener != null)
                                        {
                                            this._listener.objectInitialized(_local_10, _local_16.getId(), _local_13);
                                            _local_12 = true;
                                        }
                                    }
                                }
                                else
                                {
                                    _local_9.disposeObject(_local_16.getId(), _local_13);
                                }
                            }
                            _local_15--;
                        }
                    }
                    if (((!(_local_9.hasUninitializedObjects())) && (_local_12)))
                    {
                        this._listener.objectsInitialized(_local_10);
                    }
                }
                _local_8--;
            }
        }

        public function update(k:uint):void
        {
            var _local_3:RoomInstance;
            this.processLoadedContentTypes();
            var _local_2:int = (this._rooms.length - 1);
            while (_local_2 >= 0)
            {
                _local_3 = (this._rooms.getWithIndex(_local_2) as RoomInstance);
                if (_local_3 != null)
                {
                    _local_3.update();
                }
                _local_2--;
            }
        }
    }
}







