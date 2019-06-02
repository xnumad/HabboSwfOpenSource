//com.sulake.habbo.communication.messages.incoming.roomsettings.ShowEnforceRoomCategoryDialogEvent

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.ShowEnforceRoomCategoryDialogParser;

    [SecureSWF(rename="true")]
    public class ShowEnforceRoomCategoryDialogEvent extends MessageEvent implements IMessageEvent {

        public function ShowEnforceRoomCategoryDialogEvent(k:Function);

        public function getParser():ShowEnforceRoomCategoryDialogParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

