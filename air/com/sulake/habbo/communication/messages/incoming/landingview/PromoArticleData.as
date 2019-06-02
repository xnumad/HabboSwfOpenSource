//com.sulake.habbo.communication.messages.incoming.landingview.PromoArticleData

package com.sulake.habbo.communication.messages.incoming.landingview{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PromoArticleData {

        public static const LINK_TYPE_URL:int;
        public static const LINK_TYPE_INTERNAL:int;
        public static const LINK_TYPE_NO_LINK:int;

        private var _id:int;
        private var _title:String;
        private var _bodyText:String;
        private var _buttonText:String;
        private var _linkType:int;
        private var _linkContent:String;
        private var _imageUrl:String;

        public function PromoArticleData(k:IMessageDataWrapper);

        public function get id():int;

        public function get title():String;

        public function get bodyText():String;

        public function get buttonText():String;

        public function get linkType():int;

        public function get linkContent():String;

        public function get imageUrl():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.landingview

