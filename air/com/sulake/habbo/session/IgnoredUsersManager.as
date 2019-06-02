//com.sulake.habbo.session.IgnoredUsersManager

package com.sulake.habbo.session{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.IgnoredUsersMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.IgnoreResultMessageEvent;

    public class IgnoredUsersManager implements IDisposable {

        private var _sessionDataManager:SessionDataManager;
        private var _ignoreResultMessageEvent:IMessageEvent;
        private var _ignoredUsersMessageEvent:IMessageEvent;
        private var _ignoredUsers:Array;

        public function IgnoredUsersManager(k:SessionDataManager);

        public function dispose():void;

        public function initIgnoreList():void;

        private function onIgnoreList(k:IgnoredUsersMessageEvent):void;

        private function onIgnoreResult(k:IgnoreResultMessageEvent):void;

        private function addUserToIgnoreList(k:String):void;

        private function removeUserFromIgnoreList(k:String):void;

        public function ignoreUserId(k:int):void;

        public function ignoreUser(k:String):void;

        public function unignoreUser(k:String):void;

        public function isIgnored(k:String):Boolean;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.session

