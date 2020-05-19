package com.sulake.habbo.communication.messages.parser.mysterybox
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GotMysteryBoxPrizeMessageParser implements IMessageParser 
    {
        private var _contentType:String;
        private var _classId:int;


        public function flush():Boolean
        {
            this._contentType = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._contentType = k.readString();
            this._classId = k.readInteger();
            return true;
        }

        public function get contentType():String
        {
            return this._contentType;
        }

        public function get classId():int
        {
            return this._classId;
        }
    }
}
