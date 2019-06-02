//com.sulake.habbo.communication.messages.outgoing.preferences.SetSoundSettingsComposer

package com.sulake.habbo.communication.messages.outgoing.preferences{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class SetSoundSettingsComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function SetSoundSettingsComposer(k:int, _arg_2:int, _arg_3:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.preferences

