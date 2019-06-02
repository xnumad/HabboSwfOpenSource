//com.sulake.habbo.communication.messages.outgoing.inventory.badges.GetIsBadgeRequestFulfilledComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.badges{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetIsBadgeRequestFulfilledComposer implements IMessageComposer {

        private var _array:Array;

        public function GetIsBadgeRequestFulfilledComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.badges

