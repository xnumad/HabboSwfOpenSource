package com.sulake.habbo.communication.messages.outgoing.poll
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class PollAnswerComposer implements IMessageComposer 
    {
        private var _data:Array;

        public function PollAnswerComposer(pollId:int, questionId:int, answers:Array)
        {
            this._data = [pollId, questionId];
            this._data.push(answers.length);
            var _local_4:int;
            while (_local_4 < answers.length)
            {
                this._data.push(String(answers[_local_4]));
                _local_4++;
            }
        }

        public function getMessageArray():Array
        {
            return this._data;
        }

        public function dispose():void
        {
            this._data = null;
        }
    }
}
