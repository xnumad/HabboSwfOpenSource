//com.sulake.habbo.communication.messages.outgoing.nux.SkipNewUserExperienceMessageComposer

package com.sulake.habbo.communication.messages.outgoing.nux{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class SkipNewUserExperienceMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function SkipNewUserExperienceMessageComposer(k:Boolean);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.nux

