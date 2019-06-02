//com.sulake.habbo.communication.messages.parser.inventory.badges.BadgeAndPointLimit

package com.sulake.habbo.communication.messages.parser.inventory.badges{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BadgeAndPointLimit {

        private var _badgeId:String;
        private var _limit:int;

        public function BadgeAndPointLimit(k:String, _arg_2:IMessageDataWrapper);

        public function get badgeId():String;

        public function get limit():int;


    }
}//package com.sulake.habbo.communication.messages.parser.inventory.badges

