package com.sulake.habbo.communication.messages.parser.nux
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.nux.NewUserExperienceGiftOptions;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class NewUserExperienceGiftOfferParser implements IMessageParser 
    {
        private var _giftOptions:Vector.<NewUserExperienceGiftOptions>;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            this._giftOptions = new Vector.<NewUserExperienceGiftOptions>();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._giftOptions.push(new NewUserExperienceGiftOptions(k));
                _local_3++;
            }
            return true;
        }

        public function get giftOptions():Vector.<NewUserExperienceGiftOptions>
        {
            return this._giftOptions;
        }
    }
}
