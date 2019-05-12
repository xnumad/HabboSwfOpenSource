package com.sulake.habbo.communication.messages.parser.poll
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SimplePollResultsMessageParser implements IMessageParser 
    {
        private var _pollId:int;
        private var _results:Map;


        public function get pollId():int
        {
            return this._pollId;
        }

        public function get results():Map
        {
            return this._results;
        }

        public function flush():Boolean
        {
            this._pollId = -1;
            this._results = null;
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var key:String;
            var value:int;
            this._pollId = k.readInteger();
            this._results = new Map();
            var count:int = k.readInteger();
            var index:int;
            while (index < count)
            {
                key = k.readString();
                value = k.readInteger();
                this._results.add(key, value);
                index++;
            }
            return true;
        }
    }
}
