package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetObjectLocationMessage;
    import com.sulake.habbo.session.IRoomSession;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import com.sulake.habbo.session.RoomUserData;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.habbo.ui.widget.events._Str_3174;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class ObjectLocationRequestHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function dispose():void
        {
            this._disposed = true;
            this._container = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get type():String
        {
            return null;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function _Str_2607():Array
        {
            var k:Array = [];
            k.push(RoomWidgetGetObjectLocationMessage.RWGOI_MESSAGE_GET_OBJECT_LOCATION);
            k.push(RoomWidgetGetObjectLocationMessage.RWGOI_MESSAGE_GET_GAME_OBJECT_LOCATION);
            return k;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetGetObjectLocationMessage;
            var _local_3:IRoomSession;
            var _local_4:Rectangle;
            var _local_5:Point;
            var _local_6:Rectangle;
            var _local_7:RoomUserData;
            if (((!(k)) || (!(this._container))))
            {
                return null;
            }
            _local_2 = (k as RoomWidgetGetObjectLocationMessage);
            if (!_local_2)
            {
                return null;
            }
            _local_3 = this._container.roomSession;
            switch (k.type)
            {
                case RoomWidgetGetObjectLocationMessage.RWGOI_MESSAGE_GET_OBJECT_LOCATION:
                    if (((!(_local_3)) || (!(_local_3.userDataManager))))
                    {
                        return null;
                    }
                    _local_7 = _local_3.userDataManager._Str_6958(_local_2._Str_1577, _local_2.objectType);
                    if (_local_7)
                    {
                        _local_4 = this._container.roomEngine.getRoomObjectBoundingRectangle(_local_3.roomId, _local_7._Str_2713, RoomObjectCategoryEnum.CONST_100, this._container.getFirstCanvasId());
                        _local_5 = this._container.roomEngine.getRoomObjectScreenLocation(_local_3.roomId, _local_7._Str_2713, RoomObjectCategoryEnum.CONST_100, this._container.getFirstCanvasId());
                        _local_6 = this._container._Str_18304();
                        if ((((_local_4) && (_local_6)) && (_local_5)))
                        {
                            _local_4.offset(_local_6.x, _local_6.y);
                            _local_5.offset(_local_6.x, _local_6.y);
                        }
                    }
                    return new _Str_3174(_local_2._Str_1577, _local_4, _local_5);
                case RoomWidgetGetObjectLocationMessage.RWGOI_MESSAGE_GET_GAME_OBJECT_LOCATION:
                    _local_4 = this._container.roomEngine.getRoomObjectBoundingRectangle(_local_3.roomId, _local_2._Str_1577, RoomObjectCategoryEnum.CONST_100, this._container.getFirstCanvasId());
                    _local_5 = this._container.roomEngine.getRoomObjectScreenLocation(_local_3.roomId, _local_2._Str_1577, RoomObjectCategoryEnum.CONST_100, this._container.getFirstCanvasId());
                    _local_6 = this._container._Str_18304();
                    if ((((_local_4) && (_local_6)) && (_local_5)))
                    {
                        _local_4.offset(_local_6.x, _local_6.y);
                        _local_5.offset(_local_6.x, _local_6.y);
                    }
                    return new _Str_3174(_local_2._Str_1577, _local_4, _local_5);
            }
            return null;
        }

        public function _Str_2609():Array
        {
            return [];
        }

        public function _Str_2485(k:Event):void
        {
        }

        public function update():void
        {
        }
    }
}
