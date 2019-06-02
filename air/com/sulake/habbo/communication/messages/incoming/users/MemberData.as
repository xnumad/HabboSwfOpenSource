//com.sulake.habbo.communication.messages.incoming.users.MemberData

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class MemberData {

        private static const TYPE_OWNER:int;
        private static const TYPE_ADMIN:int;
        private static const TYPE_MEMBER:int;
        private static const TYPE_PENDING:int;

        private var _type:int;
        private var _userId:int;
        private var _userName:String;
        private var _figure:String;
        private var _memberSince:String;

        public function MemberData(k:IMessageDataWrapper);

        public function get userId():int;

        public function get userName():String;

        public function get admin():Boolean;

        public function get owner():Boolean;

        public function get member():Boolean;

        public function get figure():String;

        public function get memberSince():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

