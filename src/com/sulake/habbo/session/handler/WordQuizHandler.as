package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming.poll.QuestionEvent;
    import com.sulake.habbo.communication.messages.incoming.poll._Str_8879;
    import com.sulake.habbo.communication.messages.incoming.poll.SimplePollResultsEvent;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.session.events.RoomSessionWordQuizEvent;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.communication.messages.parser.poll.QuestionParser;
    import com.sulake.habbo.communication.messages.parser.poll._Str_7466;
    import com.sulake.habbo.communication.messages.parser.poll.SimplePollResultsMessageParser;

    public class WordQuizHandler extends BaseHandler 
    {
        public function WordQuizHandler(k:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(k, _arg_2);
            if (!k)
            {
                return;
            }
            k.addMessageEvent(new QuestionEvent(this._Str_23470));
            k.addMessageEvent(new _Str_8879(this._Str_23131));
            k.addMessageEvent(new SimplePollResultsEvent(this._Str_24658));
        }

        private function _Str_23470(k:QuestionEvent):void
        {
            var _local_4:RoomSessionWordQuizEvent;
            if (!k)
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:QuestionParser = k.getParser();
            _local_4 = new RoomSessionWordQuizEvent(RoomSessionWordQuizEvent.RWPUW_NEW_QUESTION, _local_2, _local_3._Str_5213);
            _local_4.question = _local_3.question;
            _local_4.duration = _local_3.duration;
            _local_4._Str_5302 = _local_3._Str_5302;
            _local_4._Str_3218 = _local_3._Str_3218;
            _local_4._Str_5213 = _local_3._Str_5213;
            listener.events.dispatchEvent(_local_4);
        }

        private function _Str_23131(k:_Str_8879):void
        {
            var _local_4:RoomSessionWordQuizEvent;
            if (!k)
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:_Str_7466 = k.getParser();
            _local_4 = new RoomSessionWordQuizEvent(RoomSessionWordQuizEvent.RWPUW_QUESTION_ANSWERED, _local_2, _local_3.userId);
            _local_4.value = _local_3.value;
            _local_4.userId = _local_3.userId;
            _local_4._Str_4036 = _local_3._Str_4036;
            listener.events.dispatchEvent(_local_4);
        }

        private function _Str_24658(k:SimplePollResultsEvent):void
        {
            var _local_4:RoomSessionWordQuizEvent;
            if (!k)
            {
                return;
            }
            var _local_2:IRoomSession = listener.getSession(_xxxRoomId);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:SimplePollResultsMessageParser = k.getParser();
            _local_4 = new RoomSessionWordQuizEvent(RoomSessionWordQuizEvent.RWPUW_QUESION_FINSIHED, _local_2);
            _local_4._Str_3218 = _local_3.pollId;
            _local_4._Str_4036 = _local_3.results;
            listener.events.dispatchEvent(_local_4);
        }
    }
}
