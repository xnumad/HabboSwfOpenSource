package com.sulake.habbo.communication.messages.parser.landingview
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.landingview.PromoArticleData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PromoArticlesMessageParser implements IMessageParser
    {
        private var _articles:Array;


        public function get articles():Array
        {
            return this._articles;
        }

        public function flush():Boolean
        {
            this._articles = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._articles.push(new PromoArticleData(k));
                _local_3++;
            }
            return true;
        }
    }
}
