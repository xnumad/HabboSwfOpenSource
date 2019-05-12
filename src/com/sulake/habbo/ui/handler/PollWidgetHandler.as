package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPollMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.session.events._Str_3051;
    import com.sulake.habbo.ui.widget.events._Str_2888;
    import flash.events.Event;

    public class PollWidgetHandler implements IRoomWidgetHandler 
    {
        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer = null;


        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get type():String
        {
            return RoomWidgetEnum.ROOM_POLL;
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
            return [RoomWidgetPollMessage.RWPM_ANSWER, RoomWidgetPollMessage.RWPM_REJECT, RoomWidgetPollMessage.RWPM_START];
        }

        public function processWidgetMessage(k:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_2:RoomWidgetPollMessage = (k as RoomWidgetPollMessage);
            if (_local_2 == null)
            {
                return null;
            }
            switch (k.type)
            {
                case RoomWidgetPollMessage.RWPM_START:
                    this._container.roomSession._Str_21176(_local_2.id);
                    break;
                case RoomWidgetPollMessage.RWPM_REJECT:
                    this._container.roomSession._Str_20499(_local_2.id);
                    break;
                case RoomWidgetPollMessage.RWPM_ANSWER:
                    this._container.roomSession._Str_19069(_local_2.id, _local_2._Str_3218, _local_2.answers);
                    break;
            }
            return null;
        }

        public function _Str_2609():Array
        {
            var k:Array = [];
            k.push(_Str_3051.RSPE_POLL_OFFER);
            k.push(_Str_3051.ERROR);
            k.push(_Str_3051.RSPE_POLL_CONTENT);
            return k;
        }

        public function _Str_2485(k:Event):void
        {
            var _local_3:_Str_2888;
            if (((this._container == null) || (this._container.events == null)))
            {
                return;
            }
            var _local_2:_Str_3051 = (k as _Str_3051);
            if (_local_2 == null)
            {
                return;
            }
            switch (k.type)
            {
                case _Str_3051.RSPE_POLL_OFFER:
                    _local_3 = new _Str_2888(_local_2.id, _Str_2888.RWPUW_OFFER);
                    _local_3.summary = _local_2.summary;
                    _local_3.headline = _local_2.headline;
                    break;
                case _Str_3051.ERROR:
                    _local_3 = new _Str_2888(_local_2.id, _Str_2888.ERROR);
                    _local_3.summary = _local_2.summary;
                    _local_3.headline = _local_2.headline;
                    break;
                case _Str_3051.RSPE_POLL_CONTENT:
                    _local_3 = new _Str_2888(_local_2.id, _Str_2888.RWPUW_CONTENT);
                    _local_3._Str_6013 = _local_2._Str_6013;
                    _local_3._Str_5838 = _local_2._Str_5838;
                    _local_3._Str_6760 = _local_2._Str_6760;
                    _local_3._Str_5643 = _local_2._Str_5643;
                    _local_3._Str_6196 = _local_2._Str_6196;
                    break;
            }
            if (_local_3 == null)
            {
                return;
            }
            this._container.events.dispatchEvent(_local_3);
        }

        public function update():void
        {
        }
    }
}
