//com.sulake.habbo.profile.avatar.slot.ActionsSlot

package com.sulake.habbo.profile.avatar.slot{
    import com.sulake.habbo.profile.avatar.AvatarProfileCtrl;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import feathers.controls.LayoutGroup;
    import feathers.controls.Label;
    import feathers.controls.PickerList;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.communication.messages.incoming.users.ExtendedProfileData;
    import starling.events.Event;
    import feathers.data.ListCollection;

    public class ActionsSlot {

        private var _ctrl:AvatarProfileCtrl;
        private var _roomEngine:IRoomEngine;
        private var _localization:IHabboLocalizationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _roomSession:IRoomSession;
        private var _communication:IHabboCommunicationManager;
        private var _view:LayoutGroup;
        private var _title:Label;
        private var _actionsDrop:PickerList;
        private var _userId:int;
        private var _userName:String;

        public function ActionsSlot(k:AvatarProfileCtrl, _arg_2:IRoomEngine, _arg_3:IHabboLocalizationManager, _arg_4:ISessionDataManager, _arg_5:IHabboCommunicationManager);

        public function dispose():void;

        public function get view():LayoutGroup;

        private function createView():void;

        public function set roomSession(k:IRoomSession):void;

        private function send(k:IMessageComposer):void;

        public function setData(k:ExtendedProfileData):void;

        private function onActionSelected(k:Event):void;

        private function removeAction(k:Object):void;

        private function addOwnRoomActions(k:ListCollection):void;

        private function addChangeLookAction(k:ListCollection):void;

        private function addAFriendRequestAction(k:ListCollection):void;

        private function addFriendActions(k:ListCollection):void;

        private function addPeerActions(k:ListCollection):void;

        private function addModerationActions(k:ListCollection):void;

        private function onBan(k:Object):void;

        private function onMute(k:Object):void;

        private function onIgnore(k:Object):void;

        private function onUnignore(k:Object):void;

        private function onKick(k:Object):void;

        public function onPassHandItem(k:Object):void;

        public function onGiveRespect(k:Object):void;

        private function onWhisper(k:Object):void;

        private function onTrade(k:Object):void;

        private function onMessage(k:Object):void;

        private function onRequestFriend(k:Object):void;

        private function onChangeLooks(k:Object):void;

        private function onClone(k:Object):void;

        private function onSit(k:Object):void;

        private function onStand(k:Object):void;

        private function onWave(k:Object):void;

        private function onThumb(k:Object):void;

        private function onBlow(k:Object):void;

        private function onLaugh(k:Object):void;

        private function onStopDance(k:Object):void;

        private function onDance(k:Object):void;

        private function onSign(k:Object):void;

        private function expression(k:int):void;

        private function missingClub(k:Object):Boolean;


    }
}//package com.sulake.habbo.profile.avatar.slot

