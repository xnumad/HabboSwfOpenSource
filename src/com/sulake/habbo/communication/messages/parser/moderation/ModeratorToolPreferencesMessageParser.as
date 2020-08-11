package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ModeratorToolPreferencesMessageParser implements IMessageParser
    {
        private var _windowX:int;
        private var _windowY:int;
        private var _windowWidth:int;
        private var _windowHeight:int;


        public function get _Str_17736():int
        {
            return this._windowX;
        }

        public function get _Str_18137():int
        {
            return this._windowY;
        }

        public function get _Str_4971():int
        {
            return this._windowWidth;
        }

        public function get _Str_17903():int
        {
            return this._windowHeight;
        }

        public function flush():Boolean
        {
            this._windowX = 0;
            this._windowY = 0;
            this._windowWidth = 0;
            this._windowHeight = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._windowX = k.readInteger();
            this._windowY = k.readInteger();
            this._windowWidth = k.readInteger();
            this._windowHeight = k.readInteger();
            return true;
        }
    }
}
