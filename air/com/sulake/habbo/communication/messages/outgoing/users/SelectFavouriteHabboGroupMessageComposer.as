//com.sulake.habbo.communication.messages.outgoing.users.SelectFavouriteHabboGroupMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SelectFavouriteHabboGroupMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function SelectFavouriteHabboGroupMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

