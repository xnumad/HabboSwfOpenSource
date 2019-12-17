package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_8365;

    public class _Str_5264 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5264(k:Function)
        {
            super(k, _Str_8365);
        }

        public function getParser():_Str_8365
        {
            return this._parser as _Str_8365;
        }

        public function get _Str_17070():Boolean
        {
            return this.getParser()._Str_17070;
        }

        public function get _Str_12669():String
        {
            return this.getParser()._Str_12669;
        }
    }
}
