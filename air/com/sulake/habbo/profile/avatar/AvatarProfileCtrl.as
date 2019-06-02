//com.sulake.habbo.profile.avatar.AvatarProfileCtrl

package com.sulake.habbo.profile.avatar{
    import com.sulake.habbo.ui.HabboUI;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.profile.avatar.slot.AvatarImageSlot;
    import com.sulake.habbo.profile.avatar.slot.AvatarDetailsSlot;
    import com.sulake.habbo.profile.avatar.slot.ActionsSlot;
    import com.sulake.habbo.profile.avatar.slot.BadgesSlot;
    import com.sulake.habbo.profile.avatar.slot.UserLoopSlot;
    import feathers.controls.LayoutGroup;
    import starling.display.Image;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.session.IRoomSession;
    import org.gestouch.events.GestureEvent;
    import starling.display.DisplayObject;
    import starling.events.TouchEvent;
    import com.sulake.habbo.communication.messages.incoming.users.HabboUserBadgesMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users.ExtendedProfileMessageEvent;

    public class AvatarProfileCtrl {

        private var _habboUI:HabboUI;
        private var _roomEngine:IRoomEngine;
        private var _communication:IHabboCommunicationManager;
        private var _avatarRenderManager:IAvatarRenderManager;
        private var _localization:IHabboLocalizationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _avatarSlot:AvatarImageSlot;
        private var _detailsSlot:AvatarDetailsSlot;
        private var _actionsSlot:ActionsSlot;
        private var _badgesSlot:BadgesSlot;
        private var _loopSlot:UserLoopSlot;
        private var _mainContainer:LayoutGroup;
        private var _modalOverlay:Image;
        private var _currentUserId:int;
        private var _currentMode:String;
        private var _disposed:Boolean;
        private var _msgEvents:Vector.<IMessageEvent>;

        public function AvatarProfileCtrl(k:HabboUI, _arg_2:IRoomEngine, _arg_3:IHabboCommunicationManager, _arg_4:IAvatarRenderManager, _arg_5:IHabboLocalizationManager, _arg_6:ISessionDataManager);

        public function dispose():void;

        public function setup():void;

        public function updateOwnBadges(k:Map, _arg_2:Array, _arg_3:Array):void;

        public function get view():LayoutGroup;

        public function set roomSession(k:IRoomSession):void;

        public function get habboUI():HabboUI;

        public function setUserId(k:int):void;

        public function setUser(k:int, _arg_2:String):Boolean;

        public function get userId():int;

        public function get mode():String;

        private function get badgesSlot():BadgesSlot;

        public function hide():void;

        public function fadeOut():void;

        private function createView():void;

        private function onSwipe(k:GestureEvent):void;

        public function modalOverlay():DisplayObject;

        private function onModalOverlayTouch(k:TouchEvent):void;

        private function addMessages():void;

        private function removeMessages():void;

        private function onBadges(k:HabboUserBadgesMessageEvent):void;

        private function onProfile(k:ExtendedProfileMessageEvent):void;


    }
}//package com.sulake.habbo.profile.avatar

