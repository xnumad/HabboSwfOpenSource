//com.sulake.habbo.communication.messages.parser.roomsettings.ShowEnforceRoomCategoryDialogParser

package com.sulake.habbo.communication.messages.parser.roomsettings{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ShowEnforceRoomCategoryDialogParser implements IMessageParser {

        private var _selectionType:int;

        public function ShowEnforceRoomCategoryDialogParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get selectionType():int;


    }
}//package com.sulake.habbo.communication.messages.parser.roomsettings

