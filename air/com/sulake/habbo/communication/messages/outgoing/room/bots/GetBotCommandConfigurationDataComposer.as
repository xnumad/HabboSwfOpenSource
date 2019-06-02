//com.sulake.habbo.communication.messages.outgoing.room.bots.GetBotCommandConfigurationDataComposer

package com.sulake.habbo.communication.messages.outgoing.room.bots{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetBotCommandConfigurationDataComposer implements IMessageComposer {

        private var _botId:int;
        private var _skillId:int;

        public function GetBotCommandConfigurationDataComposer(k:int, _arg_2:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.bots

