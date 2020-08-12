package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ModeratorInitMessageParser implements IMessageParser
    {
        private var _data:ModeratorInitData;


        public function flush():Boolean
        {
            if (this._data != null)
            {
                this._data.dispose();
                this._data = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new ModeratorInitData(k);
            return true;
        }

        public function get data():ModeratorInitData
        {
            return this._data;
        }
    }
}
