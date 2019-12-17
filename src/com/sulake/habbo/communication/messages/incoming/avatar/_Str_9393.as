package com.sulake.habbo.communication.messages.incoming.avatar
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.avatar._Str_9423;

    public class _Str_9393 extends MessageEvent implements IMessageEvent 
    {
        public static const _Str_19210:int = 0;
        public static const _Str_19183:int = 1;

        public function _Str_9393(k:Function)
        {
            super(k, _Str_9423);
        }

        private function getParser():_Str_9423
        {
            return this._parser as _Str_9423;
        }

        public function get _Str_17746():Array
        {
            return this.getParser()._Str_17746;
        }

        public function get state():int
        {
            return this.getParser().state;
        }
    }
}
