package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPollMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionPollEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPollUpdateEvent;
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

        public function getWidgetMessages():Array
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
                    this._container.roomSession.sendPollStartMessage(_local_2.id);
                    break;
                case RoomWidgetPollMessage.RWPM_REJECT:
                    this._container.roomSession.sendPollRejectMessage(_local_2.id);
                    break;
                case RoomWidgetPollMessage.RWPM_ANSWER:
                    this._container.roomSession.sendPollAnswerMessage(_local_2.id, _local_2.questionId, _local_2.answers);
                    break;
            }
            return null;
        }

        public function getProcessedEvents():Array
        {
            var k:Array = [];
            k.push(RoomSessionPollEvent.RSPE_POLL_OFFER);
            k.push(RoomSessionPollEvent.ERROR);
            k.push(RoomSessionPollEvent.RSPE_POLL_CONTENT);
            return k;
        }

        public function processEvent(k:Event):void
        {
            var _local_3:RoomWidgetPollUpdateEvent;
            if (((this._container == null) || (this._container.events == null)))
            {
                return;
            }
            var _local_2:RoomSessionPollEvent = (k as RoomSessionPollEvent);
            if (_local_2 == null)
            {
                return;
            }
            switch (k.type)
            {
                case RoomSessionPollEvent.RSPE_POLL_OFFER:
                    _local_3 = new RoomWidgetPollUpdateEvent(_local_2.id, RoomWidgetPollUpdateEvent.RWPUW_OFFER);
                    _local_3.summary = _local_2.summary;
                    _local_3.headline = _local_2.headline;
                    break;
                case RoomSessionPollEvent.ERROR:
                    _local_3 = new RoomWidgetPollUpdateEvent(_local_2.id, RoomWidgetPollUpdateEvent.ERROR);
                    _local_3.summary = _local_2.summary;
                    _local_3.headline = _local_2.headline;
                    break;
                case RoomSessionPollEvent.RSPE_POLL_CONTENT:
                    _local_3 = new RoomWidgetPollUpdateEvent(_local_2.id, RoomWidgetPollUpdateEvent.RWPUW_CONTENT);
                    _local_3._Str_6013 = _local_2._Str_6013;
                    _local_3._Str_5838 = _local_2._Str_5838;
                    _local_3.numQuestions = _local_2.numQuestions;
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
