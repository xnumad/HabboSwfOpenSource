//com.sulake.habbo.communication.messages.incoming.users.GuildBadgeSettings

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildBadgeSettings {

        private var _partId:int;
        private var _colorId:int;
        private var _position:int;

        public function GuildBadgeSettings(k:IMessageDataWrapper);

        public function get partId():int;

        public function get colorId():int;

        public function get position():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

