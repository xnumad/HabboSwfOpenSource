//com.sulake.habbo.communication.messages.outgoing.users.UpdateGuildSettingsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class UpdateGuildSettingsMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function UpdateGuildSettingsMessageComposer(k:int, _arg_2:int, _arg_3:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

