//com.sulake.habbo.communication.messages.outgoing.users.GetGuildEditorDataMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetGuildEditorDataMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetGuildEditorDataMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

