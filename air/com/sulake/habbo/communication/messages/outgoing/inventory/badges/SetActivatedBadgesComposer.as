//com.sulake.habbo.communication.messages.outgoing.inventory.badges.SetActivatedBadgesComposer

package com.sulake.habbo.communication.messages.outgoing.inventory.badges{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SetActivatedBadgesComposer implements IMessageComposer {

        private var _badgeArr:Array;
        private const MAX_ITEM_COUNT:int;

        public function SetActivatedBadgesComposer();

        public function addActivatedBadge(k:String):void;

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.inventory.badges

