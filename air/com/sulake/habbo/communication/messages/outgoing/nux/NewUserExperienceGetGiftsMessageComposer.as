//com.sulake.habbo.communication.messages.outgoing.nux.NewUserExperienceGetGiftsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.nux{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;
    import __AS3__.vec.Vector;

    [SecureSWF(rename="true")]
    public class NewUserExperienceGetGiftsMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function NewUserExperienceGetGiftsMessageComposer(k:Vector.<NewUserExperienceGetGiftsSelection>);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.nux

