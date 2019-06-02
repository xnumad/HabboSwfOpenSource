//com.sulake.habbo.communication.messages.incoming.inventory.pets.NestBreedingSuccessEvent

package com.sulake.habbo.communication.messages.incoming.inventory.pets{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.NestBreedingSuccessParser;

    [SecureSWF(rename="true")]
    public class NestBreedingSuccessEvent extends MessageEvent implements IMessageEvent {

        public function NestBreedingSuccessEvent(k:Function);

        public function getParser():NestBreedingSuccessParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.pets

