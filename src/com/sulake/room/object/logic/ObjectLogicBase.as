package com.sulake.room.object.logic
{
    import flash.events.IEventDispatcher;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.events.RoomSpriteMouseEvent;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class ObjectLogicBase implements IRoomObjectEventHandler 
    {
        private var _events:IEventDispatcher;
        private var _object:IRoomObjectController;

        public function get eventDispatcher():IEventDispatcher
        {
            return this._events;
        }

        public function set eventDispatcher(k:IEventDispatcher):void
        {
            this._events = k;
        }

        public function getEventTypes():Array
        {
            return [];
        }

        protected function getAllEventTypes(k:Array, _arg_2:Array):Array
        {
            var _local_4:String;
            var _local_3:Array = k.concat();
            for each (_local_4 in _arg_2)
            {
                if (_local_3.indexOf(_local_4) < 0)
                {
                    _local_3.push(_local_4);
                }
            }
            return _local_3;
        }

        public function dispose():void
        {
            this._object = null;
        }

        public function set object(k:IRoomObjectController):void
        {
            if (this._object == k)
            {
                return;
            }
            if (this._object != null)
            {
                this._object.setEventHandler(null);
            }
            if (k == null)
            {
                this.dispose();
                this._object = null;
            }
            else
            {
                this._object = k;
                this._object.setEventHandler(this);
            }
        }

        public function get object():IRoomObjectController
        {
            return this._object;
        }

        public function mouseEvent(k:RoomSpriteMouseEvent, _arg_2:IRoomGeometry):void
        {
        }

        public function initialize(k:XML):void
        {
        }

        public function update(k:int):void
        {
        }

        public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            if (k != null)
            {
                if (this._object != null)
                {
                    this._object.setLocation(k.loc);
                    this._object.setDirection(k.dir);
                }
            }
        }

        public function useObject():void
        {
        }

        public function tearDown():void
        {
        }

        public function get widget():String
        {
            return null;
        }

        public function get contextMenu():String
        {
            return null;
        }
    }
}
