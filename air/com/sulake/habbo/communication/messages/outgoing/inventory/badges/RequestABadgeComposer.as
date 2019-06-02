//com.sulake.habbo.communication.messages.outgoing.inventory.badges.RequestABadgeComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.badges{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RequestABadgeComposer implements IMessageComposer {

        private var _requestCode:String;

        public function RequestABadgeComposer(k:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.badges

