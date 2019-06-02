//com.sulake.habbo.communication.messages.outgoing.avatar.GetWardrobeMessageComposer

package com.sulake.habbo.communication.messages.outgoing.avatar{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetWardrobeMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetWardrobeMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.avatar

