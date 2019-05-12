package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.catalog._Str_4615;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7779 implements IMessageParser 
    {
        private var _Str_9586:_Str_4615;


        public function get _Str_5195():_Str_4615
        {
            return this._Str_9586;
        }

        public function flush():Boolean
        {
            this._Str_9586 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_9586 = new _Str_4615(k);
            return true;
        }
    }
}
