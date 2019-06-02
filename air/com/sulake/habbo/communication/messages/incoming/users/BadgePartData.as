//com.sulake.habbo.communication.messages.incoming.users.BadgePartData

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BadgePartData {

        private var _id:int;
        private var _fileName:String;
        private var _maskFileName:String;

        public function BadgePartData(k:IMessageDataWrapper=null);

        public function get id():int;

        public function get fileName():String;

        public function get maskFileName():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

