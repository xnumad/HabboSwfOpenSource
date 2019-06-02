//com.sulake.habbo.communication.messages.incoming.users.HabboGroupEntryData

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HabboGroupEntryData {

        private var _groupId:int;
        private var _groupName:String;
        private var _badgeCode:String;
        private var _primaryColor:String;
        private var _secondaryColor:String;
        private var _favourite:Boolean;
        private var _ownerId:int;
        private var _hasForum:Boolean;

        public function HabboGroupEntryData(k:IMessageDataWrapper);

        public function get groupId():int;

        public function get groupName():String;

        public function get badgeCode():String;

        public function get primaryColor():String;

        public function get secondaryColor():String;

        public function get favourite():Boolean;

        public function get ownerId():int;

        public function get hasForum():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

