package com.sulake.habbo.communication.messages.parser.callforhelp
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CfhSanctionTypeData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CfhSanctionMessageParser implements IMessageParser
    {
        private var _issueId:int = -1;
        private var _accountId:int = -1;
        private var _sanctionType:CfhSanctionTypeData;


        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._issueId = k.readInteger();
            this._accountId = k.readInteger();
            this._sanctionType = new CfhSanctionTypeData(k);
            return true;
        }

        public function get _Str_2869():int
        {
            return this._issueId;
        }

        public function get accountId():int
        {
            return this._accountId;
        }

        public function get _Str_21198():CfhSanctionTypeData
        {
            return this._sanctionType;
        }

        public function flush():Boolean
        {
            this._issueId = -1;
            this._accountId = -1;
            this._sanctionType = null;
            return true;
        }
    }
}
