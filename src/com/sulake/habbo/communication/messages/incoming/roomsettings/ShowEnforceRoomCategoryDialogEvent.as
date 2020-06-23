package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings.ShowEnforceRoomCategoryDialogParser;

    public class ShowEnforceRoomCategoryDialogEvent extends MessageEvent implements IMessageEvent
    {
        public function ShowEnforceRoomCategoryDialogEvent(k:Function)
        {
            super(k, ShowEnforceRoomCategoryDialogParser);
        }

        public function getParser():ShowEnforceRoomCategoryDialogParser
        {
            return this._parser as ShowEnforceRoomCategoryDialogParser;
        }
    }
}
