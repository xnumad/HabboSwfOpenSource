//com.sulake.habbo.communication.messages.parser.moderation.ModeratorInitData

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ModeratorInitData implements IDisposable {

        private var _messageTemplates:Array;
        private var _roomMessageTemplates:Array;
        private var _issues:Array;
        private var _offenceCategories:Array;
        private var _cfhPermission:Boolean;
        private var _chatlogsPermission:Boolean;
        private var _alertPermission:Boolean;
        private var _kickPermission:Boolean;
        private var _banPermission:Boolean;
        private var _roomAlertPermission:Boolean;
        private var _roomKickPermission:Boolean;
        private var _disposed:Boolean;

        public function ModeratorInitData(k:IMessageDataWrapper);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get messageTemplates():Array;

        public function get roomMessageTemplates():Array;

        public function get issues():Array;

        public function get offenceCategories():Array;

        public function get cfhPermission():Boolean;

        public function get chatlogsPermission():Boolean;

        public function get alertPermission():Boolean;

        public function get kickPermission():Boolean;

        public function get banPermission():Boolean;

        public function get roomAlertPermission():Boolean;

        public function get roomKickPermission():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

