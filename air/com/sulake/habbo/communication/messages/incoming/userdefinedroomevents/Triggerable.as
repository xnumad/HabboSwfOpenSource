//com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable

package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Triggerable {

        private var _stuffTypeSelectionEnabled:Boolean;
        private var _furniLimit:int;
        private var _stuffIds:Array;
        private var _id:int;
        private var _stringParam:String;
        private var _intParams:Array;
        private var _stuffTypeId:int;
        private var _stuffTypeSelectionCode:int;

        public function Triggerable(k:IMessageDataWrapper);

        public function get stuffTypeSelectionEnabled():Boolean;

        public function get stuffTypeSelectionCode():int;

        public function set stuffTypeSelectionCode(k:int):void;

        public function get furniLimit():int;

        public function get stuffIds():Array;

        public function get id():int;

        public function get stringParam():String;

        public function get intParams():Array;

        public function get code():int;

        public function get stuffTypeId():int;

        public function getBoolean(k:int):Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents

