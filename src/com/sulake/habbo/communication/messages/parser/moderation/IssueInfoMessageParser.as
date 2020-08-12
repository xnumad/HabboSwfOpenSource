package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class IssueInfoMessageParser implements IMessageParser
    {
        private var _issueData:IssueMessageData;


        public function get _Str_22192():IssueMessageData
        {
            return this._issueData;
        }

        public function flush():Boolean
        {
            if (this._issueData)
            {
            }
            this._issueData = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int = k.readInteger();
            var _local_4:int = k.readInteger();
            var _local_5:int = k.readInteger();
            var _local_6:Number = k.readInteger();
            var _local_7:int = k.readInteger();
            var _local_8:int = k.readInteger();
            var _local_9:int = k.readInteger();
            var _local_10:String = k.readString();
            var _local_11:int = k.readInteger();
            var _local_12:String = k.readString();
            var _local_13:int = k.readInteger();
            var _local_14:String = k.readString();
            var _local_15:String = k.readString();
            var _local_16:int = k.readInteger();
            var _local_17:int = k.readInteger();
            var _local_18:Array = [];
            var _local_19:int;
            while (_local_19 < _local_17)
            {
                _local_18.push(new PatternMatchData(k));
                _local_19++;
            }
            this._issueData = new IssueMessageData(_local_2, _local_3, _local_4, _local_5, _local_6, _local_7, _local_8, _local_9, _local_10, _local_11, _local_12, _local_13, _local_14, _local_15, _local_16, _local_18);
            return true;
        }
    }
}
