package com.sulake.habbo.communication.messages.parser.poll
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PollContentsParser implements IMessageParser 
    {
        private var _id:int = -1;
        private var _Str_5879:String = "";
        private var _Str_4781:String = "";
        private var _Str_5366:int = 0;
        private var _Str_5432:Array = null;
        private var _Str_4353:Boolean = false;


        public function get id():int
        {
            return this._id;
        }

        public function get _Str_6013():String
        {
            return this._Str_5879;
        }

        public function get _Str_5838():String
        {
            return this._Str_4781;
        }

        public function get _Str_6760():int
        {
            return this._Str_5366;
        }

        public function get _Str_5643():Array
        {
            return this._Str_5432;
        }

        public function get _Str_6196():Boolean
        {
            return this._Str_4353;
        }

        public function flush():Boolean
        {
            this._id = -1;
            this._Str_5879 = "";
            this._Str_4781 = "";
            this._Str_5366 = 0;
            this._Str_5432 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_3:PollQuestion;
            var _local_4:int;
            var _local_5:int;
            this._id = k.readInteger();
            this._Str_5879 = k.readString();
            this._Str_4781 = k.readString();
            this._Str_5366 = k.readInteger();
            this._Str_5432 = new Array();
            var _local_2:int;
            while (_local_2 < this._Str_5366)
            {
                _local_3 = this.parsePollQuestion(k);
                _local_4 = k.readInteger();
                _local_5 = 0;
                while (_local_5 < _local_4)
                {
                    _local_3.children.push(this.parsePollQuestion(k));
                    _local_5++;
                }
                this._Str_5432.push(_local_3);
                _local_2++;
            }
            this._Str_4353 = k.readBoolean();
            return true;
        }

        private function parsePollQuestion(k:IMessageDataWrapper):PollQuestion
        {
            var _local_3:int;
            var pollQuestion:PollQuestion = new PollQuestion();
            pollQuestion.questionId = k.readInteger();
            pollQuestion.sortOrder = k.readInteger();
            pollQuestion.questionType = k.readInteger();
            pollQuestion.questionText = k.readString();
            pollQuestion.questionCategory = k.readInteger();
            pollQuestion.questionAnswerType = k.readInteger();
            pollQuestion.questionAnswerCount = k.readInteger();
            if (((pollQuestion.questionType == 1) || (pollQuestion.questionType == 2)))
            {
                _local_3 = 0;
                while (_local_3 < pollQuestion.questionAnswerCount)
                {
                    pollQuestion.questionChoices.push(new QuestionChoice(k.readString(), k.readString(), k.readInteger()));
                    _local_3++;
                }
            }
            return pollQuestion;
        }
    }
}
