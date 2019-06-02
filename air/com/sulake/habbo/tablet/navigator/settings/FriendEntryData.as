//com.sulake.habbo.tablet.navigator.settings.FriendEntryData

package com.sulake.habbo.tablet.navigator.settings{
    import com.sulake.habbo.communication.messages.incoming.roomsettings.IFlatUser;

    public class FriendEntryData implements IFlatUser {

        private var _userId:int;
        private var _userName:String;
        private var _sortableName:String;

        public function FriendEntryData(k:int, _arg_2:String);

        public function get userId():int;

        public function get userName():String;

        public function get sortableName():String;


    }
}//package com.sulake.habbo.tablet.navigator.settings

