//com.sulake.habbo.communication.messages.outgoing.users.DeselectFavouriteHabboGroupMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class DeselectFavouriteHabboGroupMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function DeselectFavouriteHabboGroupMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

