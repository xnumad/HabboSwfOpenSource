package com.sulake.habbo.communication.messages.outgoing.game.arena
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2ExitGameMessageComposer implements IMessageComposer
    {
        private var _Str_21430:Boolean;

        public function Game2ExitGameMessageComposer(k:Boolean=true)
        {
            this._Str_21430 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_21430];
        }

        public function dispose():void
        {
        }
    }
}
