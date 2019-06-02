//com.sulake.habbo.communication.messages.outgoing.room.engine.GetFurnitureAliasesMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetFurnitureAliasesMessageComposer implements IMessageComposer {

        public function GetFurnitureAliasesMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

