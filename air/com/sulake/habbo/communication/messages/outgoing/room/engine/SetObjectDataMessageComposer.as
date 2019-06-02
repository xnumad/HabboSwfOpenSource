//com.sulake.habbo.communication.messages.outgoing.room.engine.SetObjectDataMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.utils.Map;

    [SecureSWF(rename="true")]
    public class SetObjectDataMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function SetObjectDataMessageComposer(k:int, _arg_2:Map);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

