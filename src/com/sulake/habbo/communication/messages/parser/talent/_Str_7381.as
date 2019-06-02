package com.sulake.habbo.communication.messages.parser.talent
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7381 implements IMessageParser 
    {
        private var _Str_8140:String;
        private var _level:int;
        private var _Str_6392:int;


        public function flush():Boolean
        {
            this._Str_8140 = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_8140 = k.readString();
            this._level = k.readInteger();
            this._Str_6392 = k.readInteger();
            return true;
        }

        public function get talentTrackName():String
        {
            return this._Str_8140;
        }

        public function get level():int
        {
            return this._level;
        }

        public function get _Str_16859():int
        {
            return this._Str_6392;
        }
    }
}
