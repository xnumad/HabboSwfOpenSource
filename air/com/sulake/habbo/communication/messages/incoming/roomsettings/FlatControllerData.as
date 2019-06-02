//com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerData

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FlatControllerData implements IFlatUser {

        private var _userId:int;
        private var _userName:String;
        private var _sortableName;
        private var _selected:Boolean;

        public function FlatControllerData(k:IMessageDataWrapper);

        public function get userId():int;

        public function get userName():String;

        public function get selected():Boolean;

        public function get sortableName():String;

        public function set selected(k:Boolean):void;

        public function set userId(k:int):void;

        public function set userName(k:String):void;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

