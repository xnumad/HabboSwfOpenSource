package com.sulake.habbo.communication.messages.incoming.nux
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class NewUserExperienceGift 
    {
        private var _productOfferList:Vector.<NewUserExperienceGiftProduct>;
        private var _thumbnailUrl:String;

        public function NewUserExperienceGift(k:IMessageDataWrapper)
        {
            this._thumbnailUrl = k.readString();
            if (this._thumbnailUrl == "")
            {
                this._thumbnailUrl = null;
            }
            this._productOfferList = new Vector.<NewUserExperienceGiftProduct>();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._productOfferList.push(new NewUserExperienceGiftProduct(k));
                _local_3++;
            }
        }

        public function get _Str_13979():Vector.<NewUserExperienceGiftProduct>
        {
            return this._productOfferList;
        }

        public function get roomTemplateName():String
        {
            return this._thumbnailUrl;
        }
    }
}
