//com.sulake.habbo.communication.messages.incoming.users.GuildColorData

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildColorData {

        private var _id:int;
        private var _color:uint;

        public function GuildColorData(k:IMessageDataWrapper);

        public function get id():int;

        public function get color():uint;

        public function get red():int;

        public function get green():int;

        public function get blue():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

