//com.sulake.habbo.communication.messages.outgoing.users.GetHabboGroupBadgesMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class GetHabboGroupBadgesMessageComposer implements IMessageComposer, IDisposable {

        public function GetHabboGroupBadgesMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

