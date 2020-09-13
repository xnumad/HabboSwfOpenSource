package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming.poll.QuestionEvent;
    import com.sulake.habbo.communication.messages.incoming.poll.QuestionAnsweredEvent;
    import com.sulake.habbo.communication.messages.incoming.poll.QuestionFinishedEvent;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.session.events.RoomSessionWordQuizEvent;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.communication.messages.parser.poll.QuestionParser;
    import com.sulake.habbo.communication.messages.parser.poll.QuestionAnsweredParser;
    import com.sulake.habbo.communication.messages.parser.poll.QuestionFinishedParser;

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
            k.addMessageEvent(new QuestionAnsweredEvent(this._Str_23131));
            k.addMessageEvent(new QuestionFinishedEvent(this._Str_24658));
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
            _local_4 = new RoomSessionWordQuizEvent(RoomSessionWordQuizEvent.RWPUW_NEW_QUESTION, _local_2, _local_3.pollId);
            _local_4.question = _local_3.question;
            _local_4.duration = _local_3.duration;
            _local_4.pollType = _local_3.pollType;
            _local_4.questionId = _local_3.questionId;
            _local_4.pollId = _local_3.pollId;
            listener.events.dispatchEvent(_local_4);
        }

        private function _Str_23131(k:QuestionAnsweredEvent):void
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
            var _local_3:QuestionAnsweredParser = k.getParser();
            _local_4 = new RoomSessionWordQuizEvent(RoomSessionWordQuizEvent.RWPUW_QUESTION_ANSWERED, _local_2, _local_3.userId);
            _local_4.value = _local_3.value;
            _local_4.userId = _local_3.userId;
            _local_4.answerCounts = _local_3.answerCounts;
            listener.events.dispatchEvent(_local_4);
        }

        private function _Str_24658(k:QuestionFinishedEvent):void
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
            var _local_3:QuestionFinishedParser = k.getParser();
            _local_4 = new RoomSessionWordQuizEvent(RoomSessionWordQuizEvent.RWPUW_QUESION_FINSIHED, _local_2);
            _local_4.questionId = _local_3.questionId;
            _local_4.answerCounts = _local_3.answerCounts;
            listener.events.dispatchEvent(_local_4);
        }
    }
}
