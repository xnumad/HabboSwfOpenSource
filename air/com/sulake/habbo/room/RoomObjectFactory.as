//com.sulake.habbo.room.RoomObjectFactory

package com.sulake.habbo.room{
    import com.sulake.core.runtime.Component;
    import com.sulake.room.IRoomObjectFactory;
    import com.sulake.core.utils.Map;
    import com.sulake.core.runtime.IContext;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import com.sulake.room.IRoomObjectManager;

    public class RoomObjectFactory extends Component implements IRoomObjectFactory {

        private var _createdLogicTypes:Map;
        private var _trackedEventTypes:Map;
        private var _objectEventListeners:Array;

        public function RoomObjectFactory(k:IContext, _arg_2:uint=0);

        public function addObjectEventListener(k:Function):void;

        public function removeObjectEventListener(k:Function):void;

        private function addTrackedEventType(k:String):void;

        public function createRoomObjectLogic(k:String):IRoomObjectEventHandler;

        public function createRoomObjectManager():IRoomObjectManager;


    }
}//package com.sulake.habbo.room

