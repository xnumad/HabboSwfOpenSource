//com.sulake.habbo.communication.messages.outgoing.users.UpdateGuildColorsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class UpdateGuildColorsMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function UpdateGuildColorsMessageComposer(k:int, _arg_2:int, _arg_3:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

