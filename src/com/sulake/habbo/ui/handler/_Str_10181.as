package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.habbo.ui.widget.events._Str_5117;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;

    public class _Str_10181 implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.FURNI_ACHIEVEMENT_RESOLUTION_ENGRAVING;
        }

        public function set container(k:IRoomWidgetHandlerContainer):void
        {
            this._container = k;
        }

        public function dispose():void
        {
            this._disposed = true;
            this._container = null;
        }

        public function _Str_2607():Array
        {
            return [RoomWidgetFurniToWidgetMessage.RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING, RoomWidgetFurniToWidgetMessage.RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED, RoomWidgetFurniToWidgetMessage.RWFWM_WIDGET_MESSAGE_REQUEST_BADGE_DISPLAY_ENGRAVING];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetFurniToWidgetMessage;
            var _local_3:IRoomObject;
            var _local_4:IRoomObjectModel;
            var _local_5:StringArrayStuffData;
            var _local_6:String;
            var _local_7:String;
            var _local_8:String;
            var _local_9:String;
            var _local_10:String;
            var _local_11:String;
            var _local_12:_Str_5117;
            if (((this.disposed) || (k == null)))
            {
                return null;
            }
            switch (k.type)
            {
                case RoomWidgetFurniToWidgetMessage.RWFWM_WIDGET_MESSAGE_REQUEST_BADGE_DISPLAY_ENGRAVING:
                case RoomWidgetFurniToWidgetMessage.RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING:
                    _local_2 = (k as RoomWidgetFurniToWidgetMessage);
                    _local_3 = this._container.roomEngine.getRoomObject(_local_2.roomId, _local_2.id, _local_2.category);
                    if (_local_3 != null)
                    {
                        _local_4 = _local_3.getModel();
                        if (_local_4 != null)
                        {
                            _local_5 = new StringArrayStuffData();
                            _local_5.initializeFromRoomObjectModel(_local_4);
                            _local_6 = this._container.localization.getBadgeName(_local_5.getValue(1));
                            _local_7 = ("\r\n" + this._container.localization.getBadgeDesc(_local_5.getValue(1)));
                            _local_8 = _local_5.getValue(2);
                            _local_9 = _local_5.getValue(3);
                            _local_10 = ((k.type == RoomWidgetFurniToWidgetMessage.RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING) ? "resolution.engraving.text" : "badge.display.engraving.text");
                            _local_11 = this._container.localization.getLocalizationWithParams(_local_10, "%badgename%", "badgename", _local_6, "badgedesc", _local_7);
                            if (_local_11 == null)
                            {
                                _local_11 = _local_6;
                            }
                            _local_12 = new _Str_5117(_Str_5117.RWARTDUE_TROPHY_DATA, 0, _local_8, _local_9, _local_11, 0);
                            this._container.events.dispatchEvent(_local_12);
                        }
                    }
                    break;
                case RoomWidgetFurniToWidgetMessage.RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED:
                    this._container.windowManager.simpleAlert("${resolution.failed.title}", "${resolution.failed.subtitle}", "${resolution.failed.text}", null, null, null, "help_error_state");
                    break;
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
