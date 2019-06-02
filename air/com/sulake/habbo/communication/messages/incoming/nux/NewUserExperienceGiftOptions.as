//com.sulake.habbo.communication.messages.incoming.nux.NewUserExperienceGiftOptions

package com.sulake.habbo.communication.messages.incoming.nux{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class NewUserExperienceGiftOptions {

        private var _dayIndex:int;
        private var _stepIndex:int;
        private var _options:Vector.<NewUserExperienceGift>;

        public function NewUserExperienceGiftOptions(k:IMessageDataWrapper);

        public function get dayIndex():int;

        public function get stepIndex():int;

        public function get options():Vector.<NewUserExperienceGift>;


    }
}//package com.sulake.habbo.communication.messages.incoming.nux

