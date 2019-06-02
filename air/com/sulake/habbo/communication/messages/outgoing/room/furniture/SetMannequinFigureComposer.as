//com.sulake.habbo.communication.messages.outgoing.room.furniture.SetMannequinFigureComposer

package com.sulake.habbo.communication.messages.outgoing.room.furniture{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SetMannequinFigureComposer implements IMessageComposer {

        private var _furniId:int;

        public function SetMannequinFigureComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.furniture

