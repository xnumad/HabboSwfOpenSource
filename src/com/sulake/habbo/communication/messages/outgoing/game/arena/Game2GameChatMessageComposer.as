package com.sulake.habbo.communication.messages.outgoing.game.arena
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class Game2GameChatMessageComposer implements IMessageComposer
    {
        private var _chatLine:String;

        public function Game2GameChatMessageComposer(k:String)
        {
            this._chatLine = k;
        }

        public function getMessageArray():Array
        {
            return [this._chatLine];
        }

        public function dispose():void
        {
            this._chatLine = null;
        }
    }
}
