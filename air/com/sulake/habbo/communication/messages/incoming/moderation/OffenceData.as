//com.sulake.habbo.communication.messages.incoming.moderation.OffenceData

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class OffenceData implements INamed {

        private var _name:String;
        private var _msg:String;
        private var _banLength:int;
        private var _avatarBanLength:int;
        private var _muteLength:int;
        private var _tradingLockLength:int;
        private var _modReminder:String;

        public function OffenceData(k:IMessageDataWrapper);

        public function get name():String;

        public function get msg():String;

        public function get banLength():int;

        public function get muteLength():int;

        public function get tradingLockLength():int;

        public function set tradingLockLength(k:int):void;

        public function get modReminder():String;

        public function get avatarBanLength():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

