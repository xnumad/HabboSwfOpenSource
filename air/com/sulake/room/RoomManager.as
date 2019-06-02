//com.sulake.room.RoomManager

package com.sulake.room{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.utils.Map;
    import com.sulake.room.object.IRoomObjectVisualizationFactory;
    import com.sulake.core.runtime.IContext;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.events.RoomContentLoadedEvent;

    public class RoomManager extends Component implements IRoomManager, IRoomInstanceContainer {

        public static const ROOM_MANAGER_ERROR:int;
        public static const ROOM_MANAGER_LOADING:int;
        public static const ROOM_MANAGER_LOADED:int;
        public static const ROOM_MANAGER_INITIALIZING:int;
        public static const ROOM_MANAGER_INITIALIZED:int;
        private static const CONTENT_PROCESSING_TIME_LIMIT_MILLISECONDS:int;

        private var _rooms:Map;
        private var _contentLoader:IRoomContentLoader;
        private var _initialLoadList:Array;
        private var _updateCategories:Array;
        private var _updateInterval:int;
        private var _listener:IRoomManagerListener;
        private var _objectFactory:IRoomObjectFactory;
        private var _visualizationFactory:IRoomObjectVisualizationFactory;
        private var _state:int;
        private var _initializationData:XML;
        private var _unprocessedLoadedContentTypes:Array;
        private var _skipContentProcessingForNextFrame:Boolean;
        private var _limitContentProcessing:Boolean;
        private var _disposed:Boolean;

        public function RoomManager(k:IContext, _arg_2:uint=0);

        override public function get disposed():Boolean;

        public function set limitContentProcessing(k:Boolean):void;

        override protected function get dependencies():Vector.<ComponentDependency>{
        }
        override protected function initComponent():void;

        override public function dispose():void;

        public function initialize(k:XML, _arg_2:IRoomManagerListener):Boolean;

        public function setContentLoader(k:IRoomContentLoader):void;

        public function addObjectUpdateCategory(k:int):void;

        public function removeObjectUpdateCategory(k:int):void;

        public function createRoom(k:String, _arg_2:XML):IRoomInstance;

        public function getRoom(k:String):IRoomInstance;

        public function getRoomWithIndex(k:int):IRoomInstance;

        public function getRoomCount():int;

        public function disposeRoom(k:String):Boolean;

        public function createRoomObject(k:String, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObject;

        public function createRoomObjectManager():IRoomObjectManager;

        public function isContentAvailable(k:String):Boolean;

        private function processInitialContentLoad(k:String):void;

        private function onContentLoaded(k:RoomContentLoadedEvent):void;

        private function processLoadedContentTypes():void;

        private function updateObjectContents(k:String):void;

        public function update(k:uint):void;


    }
}//package com.sulake.room

