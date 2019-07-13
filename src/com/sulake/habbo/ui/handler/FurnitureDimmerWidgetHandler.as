package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDimmerSavePresetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDimmerChangeStateMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDimmerPreviewMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent;
    import com.sulake.habbo.room.events.RoomEngineDimmerStateEvent;
    import com.sulake.habbo.room.events.RoomEngineTriggerWidgetEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetDimmerUpdateEvent;
    import com.sulake.habbo.ui.widget.events._Str_5572;
    import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEventPresetItem;
    import flash.events.Event;

    public class FurnitureDimmerWidgetHandler implements IRoomWidgetHandler 
    {
        private var _isDisposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.ROOM_DIMMER;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function dispose():void
        {
            this._isDisposed = true;
            this._container = null;
        }

        public function _Str_2607():Array
        {
            return [RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_DIMMER, RoomWidgetDimmerSavePresetMessage.RWSDPM_SAVE_PRESET, RoomWidgetDimmerChangeStateMessage.RWCDSM_CHANGE_STATE, RoomWidgetDimmerPreviewMessage.RWDPM_PREVIEW_DIMMER_PRESET];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:int;
            var _local_3:RoomWidgetDimmerPreviewMessage;
            var _local_4:RoomWidgetDimmerSavePresetMessage;
            switch (k.type)
            {
                case RoomWidgetFurniToWidgetMessage.RWFWM_MESSAGE_REQUEST_DIMMER:
                    if (this._Str_6826())
                    {
                        this._container.roomSession._Str_21175();
                    }
                    break;
                case RoomWidgetDimmerSavePresetMessage.RWSDPM_SAVE_PRESET:
                    if (this._Str_6826())
                    {
                        _local_4 = (k as RoomWidgetDimmerSavePresetMessage);
                        this._container.roomSession._Str_21317(_local_4._Str_25037, _local_4._Str_24446, _local_4.color, _local_4._Str_5123, _local_4.apply);
                    }
                    break;
                case RoomWidgetDimmerChangeStateMessage.RWCDSM_CHANGE_STATE:
                    if (this._Str_6826())
                    {
                        this._container.roomSession._Str_20755();
                    }
                    break;
                case RoomWidgetDimmerPreviewMessage.RWDPM_PREVIEW_DIMMER_PRESET:
                    _local_2 = this._container.roomSession.roomId;
                    _local_3 = (k as RoomWidgetDimmerPreviewMessage);
                    if (((_local_3 == null) || (this._container.roomEngine == null)))
                    {
                        return null;
                    }
                    this._container.roomEngine.updateObjectRoomColor(_local_2, _local_3.color, _local_3._Str_5123, _local_3.bgOnly);
                    break;
            }
            return null;
        }

        private function _Str_6826():Boolean
        {
            var k:Boolean = this._container.roomSession.isRoomController;
            var _local_2:* = (this._container.roomSession.roomControllerLevel >= RoomControllerLevel.GUEST);
            var _local_3:Boolean = this._container.sessionDataManager.isGodMode;
            return ((k) || (_local_3)) || (_local_2);
        }

        public function _Str_2609():Array
        {
            var k:Array = [];
            k.push(RoomSessionDimmerPresetsEvent.RSDPE_PRESETS);
            k.push(RoomEngineDimmerStateEvent.REDSE_ROOM_COLOR);
            k.push(RoomEngineTriggerWidgetEvent.RETWE_REMOVE_DIMMER);
            return k;
        }

        public function _Str_2485(k:Event):void
        {
            var _local_2:RoomSessionDimmerPresetsEvent;
            var _local_3:RoomWidgetDimmerUpdateEvent;
            var _local_4:RoomEngineDimmerStateEvent;
            var _local_5:_Str_5572;
            var _local_6:int;
            var _local_7:RoomSessionDimmerPresetsEventPresetItem;
            if (((this._container == null) || (this._container.events == null)))
            {
                return;
            }
            switch (k.type)
            {
                case RoomSessionDimmerPresetsEvent.RSDPE_PRESETS:
                    _local_2 = (k as RoomSessionDimmerPresetsEvent);
                    _local_3 = new RoomWidgetDimmerUpdateEvent(RoomWidgetDimmerUpdateEvent.RWDUE_PRESETS);
                    _local_3._Str_6226 = _local_2._Str_6226;
                    _local_6 = 0;
                    while (_local_6 < _local_2._Str_10888)
                    {
                        _local_7 = _local_2.getPreset(_local_6);
                        if (_local_7 != null)
                        {
                            _local_3.storePreset(_local_7.id, _local_7.type, _local_7.color, _local_7._Str_4272);
                        }
                        _local_6++;
                    }
                    this._container.events.dispatchEvent(_local_3);
                    return;
                case RoomEngineDimmerStateEvent.REDSE_ROOM_COLOR:
                    _local_4 = (k as RoomEngineDimmerStateEvent);
                    _local_5 = new _Str_5572(_local_4.state, _local_4._Str_14686, _local_4._Str_6815, _local_4.color, _local_4._Str_5123);
                    this._container.events.dispatchEvent(_local_5);
                    return;
                case RoomEngineTriggerWidgetEvent.RETWE_REMOVE_DIMMER:
                    this._container.events.dispatchEvent(new RoomWidgetDimmerUpdateEvent(RoomWidgetDimmerUpdateEvent.RWDUE_HIDE));
                    return;
            }
        }

        public function update():void
        {
        }
    }
}
