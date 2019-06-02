//com.sulake.habbo.communication.messages.outgoing.room.furniture.GetGuildFurniContextMenuInfoMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetGuildFurniContextMenuInfoMessageComposer implements IMessageComposer {

        private var _objectId:int;
        private var _guildId:int;

        public function GetGuildFurniContextMenuInfoMessageComposer(k:int, _arg_2:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

