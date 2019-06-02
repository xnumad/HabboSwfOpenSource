//com.sulake.habbo.communication.messages.incoming.nux.NewUserExperienceGift

package com.sulake.habbo.communication.messages.incoming.nux{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class NewUserExperienceGift {

        private var _roomTemplateName:String;
        private var _productOfferList:Vector.<String>;

        public function NewUserExperienceGift(k:IMessageDataWrapper);

        public function get roomTemplateName():String;

        public function get productOfferList():Vector.<String>;


    }
}//package com.sulake.habbo.communication.messages.incoming.nux

