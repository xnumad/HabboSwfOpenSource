package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming.poll.PollContentsEvent;
    import com.sulake.habbo.communication.messages.incoming.poll.PollOfferEvent;
    import com.sulake.habbo.communication.messages.incoming.poll.PollErrorEvent;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.session.events.RoomSessionPollEvent;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.communication.messages.parser.poll.PollOfferParser;
    import com.sulake.habbo.communication.messages.parser.poll.PollErrorParser;
    import com.sulake.habbo.communication.messages.parser.poll.PollContentsParser;

    public class PollHandler extends BaseHandler 
    {
        public function PollHandler(k:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(k, _arg_2);
            if (!k)
            {
                return;
            }
            k.addMessageEvent(new PollContentsEvent(this.parsePollContentsEvent));
            k.addMessageEvent(new PollOfferEvent(this.parsePollOfferEvent));
            k.addMessageEvent(new PollErrorEvent(this.parsePollErrorEvent));
        }

        private function parsePollOfferEvent(k:PollOfferEvent):void
        {
            var _local_4:RoomSessionPollEvent;
            if (!k)
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:PollOfferParser = k.getParser();
            _local_4 = new RoomSessionPollEvent(RoomSessionPollEvent.RSPE_POLL_OFFER, _local_2, _local_3.id);
            _local_4.summary = _local_3.headline;
            _local_4.summary = _local_3.summary;
            listener.events.dispatchEvent(_local_4);
        }

        private function parsePollErrorEvent(k:PollErrorEvent):void
        {
            var _local_4:RoomSessionPollEvent;
            if (!k)
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:PollErrorParser = k.getParser();
            _local_4 = new RoomSessionPollEvent(RoomSessionPollEvent.ERROR, _local_2, -1);
            _local_4.headline = "???";
            _local_4.summary = "???";
            listener.events.dispatchEvent(_local_4);
        }

        private function parsePollContentsEvent(k:PollContentsEvent):void
        {
            var _local_4:RoomSessionPollEvent;
            if (!k)
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:PollContentsParser = k.getParser();
            _local_4 = new RoomSessionPollEvent(RoomSessionPollEvent.RSPE_POLL_CONTENT, _local_2, _local_3.id);
            _local_4._Str_6013 = _local_3._Str_6013;
            _local_4._Str_5838 = _local_3._Str_5838;
            _local_4.numQuestions = _local_3.numQuestions;
            _local_4._Str_5643 = _local_3._Str_5643;
            _local_4._Str_6196 = _local_3._Str_6196;
            listener.events.dispatchEvent(_local_4);
        }
    }
}
