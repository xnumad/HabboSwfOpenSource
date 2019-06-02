//com.sulake.habbo.communication.messages.parser.nux.NewUserExperienceGiftOfferParser

package com.sulake.habbo.communication.messages.parser.nux{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.nux.NewUserExperienceGiftOptions;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class NewUserExperienceGiftOfferParser implements IMessageParser {

        private var _giftOptions:Vector.<NewUserExperienceGiftOptions>;

        public function NewUserExperienceGiftOfferParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get giftOptions():Vector.<NewUserExperienceGiftOptions>;


    }
}//package com.sulake.habbo.communication.messages.parser.nux

