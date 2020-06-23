package com.sulake.habbo.communication.messages.parser.roomsettings
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ShowEnforceRoomCategoryDialogParser implements IMessageParser
    {
        private var _selectionType:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._selectionType = k.readInteger();
            return true;
        }

        public function get selectionType():int
        {
            return this._selectionType;
        }
    }
}
