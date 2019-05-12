package com.sulake.habbo.communication.messages.parser.groupforums
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9365 implements IMessageParser 
    {
        private var _Str_2381:_Str_3372;


        public function get _Str_22345():_Str_3372
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
            this._Str_2381 = _Str_3372._Str_4933(k);
            return true;
        }
    }
}
