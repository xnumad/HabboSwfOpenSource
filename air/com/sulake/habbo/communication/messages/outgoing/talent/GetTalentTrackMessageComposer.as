//com.sulake.habbo.communication.messages.outgoing.talent.GetTalentTrackMessageComposer

package com.sulake.habbo.communication.messages.outgoing.talent{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class GetTalentTrackMessageComposer implements IMessageComposer, IDisposable {

        private var _data:Array;

        public function GetTalentTrackMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.talent

