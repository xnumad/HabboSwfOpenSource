package com.sulake.habbo.communication.messages.parser.competition
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.communication.enum._Str_10666;

    public class _Str_8358 implements IMessageParser 
    {
        private var _Str_5696:int;
        private var _Str_3087:String;
        private var _Str_3145:int;
        private var _Str_19041:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_5696 = k.readInteger();
            this._Str_3087 = k.readString();
            this._Str_3145 = k.readInteger();
            this._Str_19041 = k.readInteger();
            return true;
        }

        public function get goalId():int
        {
            return this._Str_5696;
        }

        public function get goalCode():String
        {
            return this._Str_3087;
        }

        public function get _Str_24414():Boolean
        {
            return this._Str_3145 == _Str_10666._Str_17462;
        }

        public function get _Str_24679():int
        {
            return this._Str_19041;
        }

        public function get _Str_3278():int
        {
            return this._Str_3145;
        }
    }
}
