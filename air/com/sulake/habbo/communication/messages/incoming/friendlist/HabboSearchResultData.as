//com.sulake.habbo.communication.messages.incoming.friendlist.HabboSearchResultData

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HabboSearchResultData {

        private var _avatarId:int;
        private var _avatarName:String;
        private var _avatarMotto:String;
        private var _isAvatarOnline:Boolean;
        private var _canFollow:Boolean;
        private var _avatarGender:int;
        private var _avatarFigure:String;
        private var _lastOnlineDate:String;
        private var _realName:String;

        public function HabboSearchResultData(k:IMessageDataWrapper);

        public function get avatarId():int;

        public function get avatarName():String;

        public function get avatarMotto():String;

        public function get isAvatarOnline():Boolean;

        public function get canFollow():Boolean;

        public function get avatarGender():int;

        public function get avatarFigure():String;

        public function get lastOnlineDate():String;

        public function get realName():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

