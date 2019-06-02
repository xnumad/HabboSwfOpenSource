//com.sulake.habbo.communication.messages.outgoing.roomsettings.GetRoomSettingsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.roomsettings{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class GetRoomSettingsMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function GetRoomSettingsMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.roomsettings

