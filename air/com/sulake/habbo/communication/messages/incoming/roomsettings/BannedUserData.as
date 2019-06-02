//com.sulake.habbo.communication.messages.incoming.roomsettings.BannedUserData

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BannedUserData implements IFlatUser {

        private var _userId:int;
        private var _userName:String;
        private var _sortableName:String;

        public function BannedUserData(k:IMessageDataWrapper);

        public function get userId():int;

        public function get userName():String;

        public function get sortableName():String;

        public function set userId(k:int):void;

        public function set userName(k:String):void;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

