package com.sulake.habbo.communication.messages.incoming.landingview
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PromoArticleData
    {
        public static const LINK_TYPE_URL:int = 0;
        public static const LINK_TYPE_INTERNAL:int = 1;
        public static const LINK_TYPE_NO_LINK:int = 2;

        private var _id:int;
        private var _title:String;
        private var _bodyText:String;
        private var _buttonText:String;
        private var _linkType:int;
        private var _linkContent:String;
        private var _imageUrl:String;

        public function PromoArticleData(k:IMessageDataWrapper)
        {
            this._id = k.readInteger();
            this._title = k.readString();
            this._bodyText = k.readString();
            this._buttonText = k.readString();
            this._linkType = k.readInteger();
            this._linkContent = k.readString();
            this._imageUrl = k.readString();
        }

        public function get id():int
        {
            return this._id;
        }

        public function get title():String
        {
            return this._title;
        }

        public function get bodyText():String
        {
            return this._bodyText;
        }

        public function get buttonText():String
        {
            return this._buttonText;
        }

        public function get linkType():int
        {
            return this._linkType;
        }

        public function get linkContent():String
        {
            return this._linkContent;
        }

        public function get imageUrl():String
        {
            return this._imageUrl;
        }
    }
}
