//com.sulake.habbo.communication.messages.outgoing.room.furniture.OpenWelcomeGiftComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class OpenWelcomeGiftComposer implements IMessageComposer {

        private var _furniId:int;

        public function OpenWelcomeGiftComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

