package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.furniture.highscore.HighScoreDisplayWidget;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.data.HighScoreStuffData;
    import flash.events.Event;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.geom.Point;

    public class HighScoreFurniWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _widget:HighScoreDisplayWidget = null;
        private var _cachedRequest:RoomEngineObjectEvent = null;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.HIGH_SCORE_DISPLAY;
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return this._container;
        }

        public function set widget(k:HighScoreDisplayWidget):void
        {
            this._widget = k;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
            this._container._Str_19457(this);
        }

        public function dispose():void
        {
            if (this._container)
            {
                this._container._Str_20159(this);
            }
            this._isDisposed = true;
            this._container = null;
            this._widget = null;
        }

        public function _Str_2609():Array
        {
            return [RoomEngineTriggerWidgetEvent.RETWE_REQUEST_HIGH_SCORE_DISPLAY, RoomEngineTriggerWidgetEvent.RETWE_REQUEST_HIDE_HIGH_SCORE_DISPLAY];
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomEngineObjectEvent;
            var _local_3:IRoomObject;
            var _local_4:IRoomObjectModel;
            var _local_5:HighScoreStuffData;
            if (((this.disposed) || (k == null)))
            {
                return;
            }
            switch (k.type)
            {
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_HIGH_SCORE_DISPLAY:
                    _local_2 = RoomEngineObjectEvent(k);
                    _local_3 = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2._Str_1577, _local_2.category);
                    if (_local_3 != null)
                    {
                        _local_4 = _local_3.getModel();
                        if (_local_4 != null)
                        {
                            _local_5 = new HighScoreStuffData();
                            _local_5.initializeFromRoomObjectModel(_local_4);
                            this._widget.open(_local_2._Str_1577, _local_2.roomId, _local_5);
                        }
                        this._cachedRequest = _local_2;
                    }
                    return;
                case RoomEngineTriggerWidgetEvent.RETWE_REQUEST_HIDE_HIGH_SCORE_DISPLAY:
                    _local_2 = RoomEngineObjectEvent(k);
                    if (((_local_2.roomId == this._widget.roomId) && (_local_2._Str_1577 == this._widget._Str_21467)))
                    {
                        this._widget.close();
                    }
                    return;
            }
        }

        public function _Str_2607():Array
        {
            return null;
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            return null;
        }

        public function update():void
        {
            var k:IRoomObject;
            var _local_2:Point;
            if (((((this._cachedRequest) && (this._widget.isOpen)) && (this._widget.roomId == this._cachedRequest.roomId)) && (this._widget._Str_21467 == this._cachedRequest._Str_1577)))
            {
                k = this._container.roomEngine.getRoomObject(this._cachedRequest.roomId, this._cachedRequest._Str_1577, this._cachedRequest.category);
                if (k != null)
                {
                    _local_2 = this._container.roomEngine.getRoomObjectScreenLocation(this._cachedRequest.roomId, this._cachedRequest._Str_1577, this._cachedRequest.category);
                    if (_local_2 != null)
                    {
                        this._widget._Str_23957(_local_2.x, _local_2.y);
                    }
                }
            }
        }
    }
}
