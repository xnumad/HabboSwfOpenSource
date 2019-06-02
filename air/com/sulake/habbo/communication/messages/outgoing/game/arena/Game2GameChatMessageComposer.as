//com.sulake.habbo.communication.messages.outgoing.game.arena.Game2GameChatMessageComposer

package com.sulake.habbo.communication.messages.outgoing.game.arena{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class Game2GameChatMessageComposer implements IMessageComposer {

        private var _chatLine:String;

        public function Game2GameChatMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.game.arena

