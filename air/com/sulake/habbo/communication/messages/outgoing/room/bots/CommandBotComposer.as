//com.sulake.habbo.communication.messages.outgoing.room.bots.CommandBotComposer

package com.sulake.habbo.communication.messages.outgoing.room.bots{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class CommandBotComposer implements IMessageComposer {

        private var _botId:int;
        private var _skillId:int;
        private var _command:String;

        public function CommandBotComposer(k:int, _arg_2:int, _arg_3:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.bots

