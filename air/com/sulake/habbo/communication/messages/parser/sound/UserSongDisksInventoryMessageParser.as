//com.sulake.habbo.communication.messages.parser.sound.UserSongDisksInventoryMessageParser

package com.sulake.habbo.communication.messages.parser.sound{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserSongDisksInventoryMessageParser implements IMessageParser {

        private var _songDiskInventory:Map;

        public function UserSongDisksInventoryMessageParser();

        public function get songDiskCount():int;

        public function getDiskId(k:int):int;

        public function getSongId(k:int):int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.sound

