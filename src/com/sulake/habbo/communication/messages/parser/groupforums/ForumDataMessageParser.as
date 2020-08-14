package com.sulake.habbo.communication.messages.parser.groupforums
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ForumDataMessageParser implements IMessageParser
    {
        private var _Str_2381:ExtendedForumData;


        public function get _Str_22345():ExtendedForumData
        {
            return this._Str_2381;
        }

        public function flush():Boolean
        {
            this._Str_2381 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_2381 = ExtendedForumData._Str_4933(k);
            return true;
        }
    }
}
