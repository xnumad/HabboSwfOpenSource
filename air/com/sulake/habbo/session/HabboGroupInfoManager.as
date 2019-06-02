//com.sulake.habbo.session.HabboGroupInfoManager

package com.sulake.habbo.session{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.HabboGroupBadgesMessageEvent;

    public class HabboGroupInfoManager implements IDisposable {

        private var _sessionDataManager:SessionDataManager;
        private var _badges:Map;
        private var _roomReadyMessageEvent:IMessageEvent;
        private var _habboGroupBadgesMessageEvent:IMessageEvent;

        public function HabboGroupInfoManager(k:SessionDataManager);

        public function get disposed():Boolean;

        public function dispose():void;

        private function onRoomReady(k:IMessageEvent):void;

        private function onHabboGroupBadges(k:HabboGroupBadgesMessageEvent):void;

        public function getBadgeId(k:int):String;


    }
}//package com.sulake.habbo.session

