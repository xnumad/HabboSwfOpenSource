package com.sulake.habbo.communication.messages.parser.groupforums
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildForumThreadsParser implements IMessageParser 
    {
        private var _groupId:int;
        private var _startIndex:int;
        private var _amount:int;
        private var _Str_7033:Array;


        public function get groupId():int
        {
            return this._groupId;
        }

        public function get startIndex():int
        {
            return this._startIndex;
        }

        public function get amount():int
        {
            return this._amount;
        }

        public function get _Str_8372():Array
        {
            return this._Str_7033;
        }

        public function flush():Boolean
        {
            this._groupId = -1;
            this._startIndex = -1;
            this._amount = -1;
            this._Str_7033 = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._groupId = k.readInteger();
            this._startIndex = k.readInteger();
            this._amount = k.readInteger();
            var _local_2:int;
            while (_local_2 < this.amount)
            {
                this._Str_7033.push(GuildForumThread.parse(k));
                _local_2++;
            }
            return true;
        }
    }
}
