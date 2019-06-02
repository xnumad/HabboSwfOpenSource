package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuideSessionStartedMessageParser implements IMessageParser 
    {
        private var _requesterUserId:int;
        private var _requesterName:String;
        private var _requesterFigure:String;
        private var _guideUserId:int;
        private var _guideName:String;
        private var _guideFigure:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._requesterUserId = k.readInteger();
            this._requesterName = k.readString();
            this._requesterFigure = k.readString();
            this._guideUserId = k.readInteger();
            this._guideName = k.readString();
            this._guideFigure = k.readString();
            return true;
        }

        public function get requesterUserId():int
        {
            return this._requesterUserId;
        }

        public function get requesterName():String
        {
            return this._requesterName;
        }

        public function get requesterFigure():String
        {
            return this._requesterFigure;
        }

        public function get guideUserId():int
        {
            return this._guideUserId;
        }

        public function get guideName():String
        {
            return this._guideName;
        }

        public function get guideFigure():String
        {
            return this._guideFigure;
        }
    }
}
