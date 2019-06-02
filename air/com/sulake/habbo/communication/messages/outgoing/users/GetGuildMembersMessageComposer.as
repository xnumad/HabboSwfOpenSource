//com.sulake.habbo.communication.messages.outgoing.users.GetGuildMembersMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetGuildMembersMessageComposer implements IMessageComposer {

        public static const SEARCH_TYPE_MEMBERS:int;
        public static const SEARCH_TYPE_ADMINS_ONLY:int;
        public static const SEARCH_TYPE_PENDING:int;

        private var _data:Array;

        public function GetGuildMembersMessageComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

