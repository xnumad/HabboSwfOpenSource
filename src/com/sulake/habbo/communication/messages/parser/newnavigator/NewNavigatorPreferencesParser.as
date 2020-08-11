package com.sulake.habbo.communication.messages.parser.newnavigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class NewNavigatorPreferencesParser implements IMessageParser
    {
        private var _windowX:int;
        private var _windowY:int;
        private var _windowWidth:int;
        private var _windowHeight:int;
        private var _leftPaneHidden:Boolean;
        private var _resultsMode:int;


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

        public function get _Str_25666():Boolean
        {
            return this._leftPaneHidden;
        }

        public function get _Str_23289():int
        {
            return this._resultsMode;
        }

        public function flush():Boolean
        {
            this._windowX = 0;
            this._windowY = 0;
            this._windowWidth = 0;
            this._windowHeight = 0;
            this._leftPaneHidden = false;
            this._resultsMode = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._windowX = k.readInteger();
            this._windowY = k.readInteger();
            this._windowWidth = k.readInteger();
            this._windowHeight = k.readInteger();
            this._leftPaneHidden = k.readBoolean();
            this._resultsMode = k.readInteger();
            return true;
        }
    }
}
